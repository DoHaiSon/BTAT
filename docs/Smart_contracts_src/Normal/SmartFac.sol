pragma solidity >=0.6.0;

contract SmartFac {
  string private name;
  address private initaddress;
  uint256 public total_of_reco = 0;

  struct Reco {
    string id;
    string time;
    string data;
  }
  mapping(uint256 => Reco) public reco;

  mapping(address => bool) private trusted_acc;

  event added(
    address addr,
    string id,
    string time,
    string data
  );
  
  constructor(string memory _name) public{
    require(bytes(_name).length > 0, "Missing name.");
    name = _name;
    trusted_acc[msg.sender] = true;
    initaddress = msg.sender;
  }
  
  function add_acc(address _add) public{
      require(msg.sender == initaddress, "Plese use init contract Account.");
      trusted_acc[_add] = true;
  }
  
  function remove_acc(address _rm) public{
      require(msg.sender == initaddress, "Plese use init contract Account.");
      require(initaddress != _rm, "Cannot remove init Account.");
      delete trusted_acc[_rm];
  }
  
  function Fac_name() public view virtual returns (string memory) {
    return name;
  }
  
  function new_Reco(string memory _id, string memory _time, string memory _data) public {
    require(trusted_acc[msg.sender], "This address not in trusted list.");
    ++total_of_reco;  
    reco[total_of_reco] = Reco(_id, _time, _data);
    emit added(msg.sender, _id, _time, _data);
  } 
}
