// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyContract {

    // integer vars
    uint myUnit = 1;
    uint256  public myUnit256 = 1;
    //strings
    string public myString = "Hello world!";
    bytes32 public myByte32 = "Hello bytes32";

    // adress in the blockchain
    address public myAdress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //struct type
    struct MyStruct {
        uint256 myUnit;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello");

}
