// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Firsttoken is  ERC20Capped, Ownable{


    /*uint256 public blockreward = (10) * (10 ** uint(decimals()));*/

    constructor () ERC20 ( "Rewards" , "CCC" ) ERC20Capped ( 10000000000000000 * 10** uint(decimals())) {

        _mint(payable(msg.sender), 10000 * 10 ** uint(decimals()));
    }

    function _beforeTokenTransfer(address from , address to , uint256 value) internal virtual override{
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)){
        /*_MintMinerReward();*/
        }
        super._beforeTokenTransfer(from , to , value);
     }


    function _mint(address account, uint256 amount) internal virtual override(ERC20Capped) {
        require(ERC20.totalSupply() + amount <= cap(), "You could not mint more");
        super._mint(payable(account), amount * 10 ** uint(decimals()));
    }

    
}
