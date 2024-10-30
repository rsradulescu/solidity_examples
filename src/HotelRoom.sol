// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract HotelRoom {
    address payable public owner;

    //Vacant or occupied
    enum Statuses{
        Vacant, 
        Occupied
    }
    Statuses public currentStatus;

    event Ocuppy(address _occupant, uint _value);


    constructor(){
        //msg.sender is the person who is calling the smart contrct
        owner = payable (msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant{
        //Check status: replace with onlyWhileVacant
        require(currentStatus == Statuses.Vacant, "Currently Occupied.");
        _;
    }

    modifier cost(uint _amount){
        //Check price 
        require(msg.value >= _amount , "Not enough ether to book.");
        _;
    }

    // you can book just once (vacancy), if you have at least 2 ether
    function book() payable public onlyWhileVacant cost(2 ether){
        currentStatus = Statuses.Occupied;
        // value is the ether (crypto) sent when you call the function book
        (bool sent, bytes memory data) = owner.call{value : msg.value}("");
        require(true);

        emit Ocuppy(msg.sender, msg.value);
    }

}
