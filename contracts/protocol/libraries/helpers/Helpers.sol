// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.6.12;

import {IERC20} from '../../../dependencies/openzeppelin/contracts/IERC20.sol';
import {DataTypes} from '../types/DataTypes.sol';

/**
 * @title Helpers library
 * @author Aave
 */
library Helpers {
  /**
   * @dev Fetches the user current stable and variable debt balances
   * @param user The user address
   * @param reserve The reserve data object
   * @return The stable and variable debt balance
   **/
  /**
   * @dev 获取用户当前稳定利率和可变利率的债务余额
   * @param user 用户地址
   * @param reserve 资金池数据对象，注意为storage存储，是持久化的
   * @return 稳定利率和可变利率的债务余额
   **/   
  function getUserCurrentDebt(address user, DataTypes.ReserveData storage reserve)
    internal
    view
    returns (uint256, uint256)
  {
    return (
      IERC20(reserve.stableDebtTokenAddress).balanceOf(user), //稳定利率债务通证化，是一个ERC20合约
      IERC20(reserve.variableDebtTokenAddress).balanceOf(user) //可变利率债务通证化，是一个ERC20合约
    );
  }

  function getUserCurrentDebtMemory(address user, DataTypes.ReserveData memory reserve)
    internal
    view
    returns (uint256, uint256)
  {
    return (
      IERC20(reserve.stableDebtTokenAddress).balanceOf(user),
      IERC20(reserve.variableDebtTokenAddress).balanceOf(user)
    );
  }
}
