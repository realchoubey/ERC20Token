pragma solidity ^0.8.9;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract RCTokenV2 is ERC20 {
    address public minter;
    mapping (address => uint) public balances;
    event Sent(address from, address to, uint amount);

    constructor() ERC20("RealChoubeyToken", "RCT") {
        _mint(msg.sender, 10000 * (10 ** decimals()));
    }

    function symbol() public view virtual override returns (string memory) {
        return "RCT";
    }

    function name() public view virtual override returns (string memory) {
        return "RealChoubeyTokenV2";
    }


    function mint(address receiver, uint amount) public {
        if(msg.sender != minter) return;
        balances[receiver] += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function balanceOf(address account) public view virtual override returns (uint) {
        return balances[account];
    }

    function transfer(address to, uint amount) public virtual override returns (bool){
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
}
