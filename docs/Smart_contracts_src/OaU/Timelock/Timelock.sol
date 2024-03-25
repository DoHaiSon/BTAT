pragma solidity ^0.4.16;

contract TimeLock {
    uint public SM_bal = 0;
    mapping(address => uint) public balances;
    mapping(address => uint) public lockTime;
    function deposit() external payable {
        balances[msg.sender] += msg.value * 1001209600/1000000000;
        lockTime[msg.sender] = now + 1 weeks;
    }
    function increaseLockTime(uint _secondsToIncrease) public payable {                 // 0.0000002% per sec
        balances[msg.sender] += balances[msg.sender] * ( 500000000 + _secondsToIncrease) / 500000000;
        lockTime[msg.sender] += _secondsToIncrease;
    }
    function withdraw() public {
        require(balances[msg.sender] > 0);
        require(now > lockTime[msg.sender]);
        uint tmp =  balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.transfer(tmp);
    }
    function update_BalofSM() public {
        SM_bal = address(this).balance;
    }
}