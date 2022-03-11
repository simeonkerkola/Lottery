//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address immutable public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        // Convert plain address to payable one
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}