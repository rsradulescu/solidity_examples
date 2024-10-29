// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ConditionalLoop {
    
    uint[] public numbers = [1,2,3,4,5];
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    //Loop
    function countEvenNumbers() public view returns(uint){
        uint count = 0;

        for (uint i = 0; i < numbers.length; i++) 
        {
            if(isEvenNumber(numbers[i])){
                count++;
            }
        }
        return count;
    }
    //Conditions if-then-else
    function isEvenNumber(uint _number) public pure returns(bool){
        return (_number % 2 == 0);
    }

    function isOwner() public view returns(bool){
        return (msg.sender == owner) ;
    }

}
