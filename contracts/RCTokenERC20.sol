pragma solidity ^0.8.9;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract RCTokenV2 is ERC20 {
    address public minter;

    constructor() ERC20("RealChoubeyTokenV3", "RCT") {
        _mint(msg.sender, 10000 * (10 ** decimals()));
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter, "ERC20: Incorrect minter");
        _mint(receiver, amount);
    }

    function transfer(address to, uint amount) public virtual override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function burn(uint amount) public virtual returns (bool) {
        require(msg.sender == minter, "ERC20: Incorrect minter");
        _burn(msg.sender, amount);
        return true;
    }

    function approve(address spender, uint amount) public virtual override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
}
