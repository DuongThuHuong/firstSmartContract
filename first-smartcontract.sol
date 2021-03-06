pragma solidity >=0.4.22 <0.7.0; // trinh bien dich >= phien ban 0.4.22, nho hon 0.7.0

contract Meme{
    string public name = "BlockchainToken";
    string public symbol = "BCT";
    uint8 public decimals = 0; /* de biet token co the dc chia nho ra bao nhieu chu so thap phan, 1.003 = 3 */ 
    uint256  public totalSupply = 0;
    
    mapping(address => uint256) balances;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success){
        balances[msg.sender] -= _value; // ham msg.sender lay ra dia chi cua nguoi goi ham transfer
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function() public payable{                 
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
        emit Transfer(address(0), msg.sender, msg.value);
    }
}

// smart contract nay duoc viet theo chuan ERC20
