// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// owner contract
contract Ownable {
    address owner;

    modifier onlyOwner(){
        require(msg.sender == owner, "Must be owner.");
        _;
    }

    constructor()  {
        owner = msg.sender;
    }

}
// secret contract
contract SecretVault{
    string secret;
    
    constructor(string memory _secret)  {
        secret = _secret;
    }
    
    function getSecret() public view returns(string memory){
        return secret;
    } 
}

// Factory of smart contract 
contract Inheritance is Ownable{

    address secretVault;
    
    constructor(string memory _secret){
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super; // call to Ownable constructor
    }

    function getSecret() public view onlyOwner returns(string memory){
        return SecretVault(secretVault).getSecret();
    } 

}
