//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address immutable public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {

        // User must send 0.1ETH min, 100000000000000000 wei
        // Require doesn't consume gas because there's no code before it
        require(msg.value == 0.1 ether);

        // Convert plain address to payable one
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint) {
        // On]y ownew can read the balance
        require(msg.sender == owner);
        return address(this).balance;
    }
}