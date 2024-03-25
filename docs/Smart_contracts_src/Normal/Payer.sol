pragma solidity 0.4.12;

contract Payer {
    uint256 public num_cli = 0;
    mapping(uint256 => address) public clients;
    uint256 public balance = 0;

    function Payer() {
        clients[0] = msg.sender;
    }

    function deposit() public payable {
        uint256 eth = msg.value / num_cli;
        for (uint256 i = 1; i <= num_cli; i++)
            clients[i].transfer(eth);
    }

    function add_acc(address _add) public{
        num_cli = num_cli + 1;
        clients[num_cli] = _add;
    }
}