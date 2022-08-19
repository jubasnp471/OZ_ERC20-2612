// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Context.sol";
  contract erc20 is IERC20 , Context   {


    mapping (address=> uint) private _balances;
    mapping (address=> mapping(address=>uint)) private _allownces;

    uint public _totalSupply;
    
    uint  public immutable _decimals;
    string public _symbol;
    string public _name;



    constructor(string memory symbol,string memory name) {
        _symbol = symbol;
        _name = name;
        _decimals = 18;
    }

    function totalSupply() public view  returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address who) external view  returns(uint256){
    return _balances[who];
    }
    function allowance(address owner ,address spender) external view  returns(uint256){
    return _allownces[owner][spender];
    }
     
    
    function transfer(address to , uint amount) external returns(bool){
      _transfer(to, amount);

    }
    function transferFrom(address _from , address to , uint256 amount) external  returns(bool){}
    function approve(address spender, uint256 amount) external returns(bool){}
    
    function _transfer(address to, uint amount) internal  returns(bool){
        require( to != address(0));
        require(msg.sender != address(0));
        uint ownerBalance = _balances[msg.sender];
        require( amount <= ownerBalance );
         _balances[msg.sender] -= amount;

        unchecked {
          _balances[to] += amount;
        }
        emit Transfer(msg.sender,to, amount);
    }

    





}