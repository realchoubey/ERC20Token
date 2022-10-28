pragma solidity ^0.8.9;


contract yourToken {
    string public name = "realChoubey Token";
    string public symbol = "RCT";

    address public minter;
    uint public totalSupply = 1000000;
    mapping (address => uint) public balances;
    event Sent(address from, address to, uint amount);

    constructor() {
        balances[msg.sender] = totalSupply;
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if(msg.sender != minter) return;
        balances[receiver] += amount;
    }

    function balanceOf(address account) external view returns (uint) {
        return balances[account];
    }

    function transfer(address to, uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}