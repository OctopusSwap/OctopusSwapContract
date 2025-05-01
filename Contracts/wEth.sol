// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WETH9 {
    string public name     = "Wrapped PPT";
    string public symbol   = "WPPT";
    uint8  public decimals = 18;

    event  Approval(address indexed src, address indexed guy, uint wad);
    event  Transfer(address indexed src, address indexed dst, uint wad);
    event  Deposit(address indexed dst, uint wad);
    event  Withdrawal(address indexed src, uint wad);

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    receive() external payable {
        deposit();
    }

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 wad) public {
        require(balanceOf[msg.sender] >= wad, "WPPT: insufficient balance");
        balanceOf[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }

    function totalSupply() public view returns (uint256) {
        return address(this).balance;
    }

    function approve(address guy, uint256 wad) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }

    function increaseAllowance(address guy, uint256 addedWad) public returns (bool) {
    allowance[msg.sender][guy] += addedWad;
    emit Approval(msg.sender, guy, allowance[msg.sender][guy]);
    return true;
    }

    function decreaseAllowance(address guy, uint256 subtractedWad) public returns (bool) {
        uint256 currentAllowance = allowance[msg.sender][guy];
        require(currentAllowance >= subtractedWad, "WPPT: decreased allowance below zero");
        allowance[msg.sender][guy] = currentAllowance - subtractedWad;
        emit Approval(msg.sender, guy, allowance[msg.sender][guy]);
        return true;
    }

    function transfer(address dst, uint256 wad) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    function transferFrom(address src, address dst, uint256 wad) public returns (bool) {
        require(balanceOf[src] >= wad, "WPPT: insufficient balance");

        if (src != msg.sender && allowance[src][msg.sender] != type(uint256).max) {
            require(allowance[src][msg.sender] >= wad, "WPPT: allowance exceeded");
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit Transfer(src, dst, wad);
        return true;
    }
}
