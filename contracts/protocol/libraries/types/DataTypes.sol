// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.6.12;

library DataTypes {
  // refer to the whitepaper, section 1.1 basic concepts for a formal description of these properties.
  // 有关这些属性的正式描述，请参阅白皮书1.1部分的基本概念。
  struct ReserveData {
    //stores the reserve configuration
    //资金池配置
    ReserveConfigurationMap configuration;
    //the liquidity index. Expressed in ray
    //流动性指数
    uint128 liquidityIndex;
    //variable borrow index. Expressed in ray
    //可变借款指数
    uint128 variableBorrowIndex;
    //the current supply rate. Expressed in ray
    //当前流动性供应率
    uint128 currentLiquidityRate;
    //the current variable borrow rate. Expressed in ray
    //当前可变利率借款率
    uint128 currentVariableBorrowRate;
    //the current stable borrow rate. Expressed in ray
    //当前稳定利率借款率
    uint128 currentStableBorrowRate;
    //上次更新时间
    uint40 lastUpdateTimestamp;
    //tokens addresses
    //aToken地址
    address aTokenAddress;
    //稳定利率债务token地址，注：债务通证化，债务被表示为token
    address stableDebtTokenAddress;
    //可变利率债务token地址
    address variableDebtTokenAddress;
    //address of the interest rate strategy
    //利率策略的地址
    address interestRateStrategyAddress;
    //the id of the reserve. Represents the position in the list of the active reserves
    //本资金池的id。表示在活跃资金池列表中的位置
    uint8 id;
  }

  struct ReserveConfigurationMap {
    //bit 0-15: LTV
    //bit 16-31: Liq. threshold
    //bit 32-47: Liq. bonus
    //bit 48-55: Decimals
    //bit 56: Reserve is active
    //bit 57: reserve is frozen
    //bit 58: borrowing is enabled
    //bit 59: stable rate borrowing enabled
    //bit 60-63: reserved
    //bit 64-79: reserve factor
    uint256 data;
  }

  struct UserConfigurationMap {
    uint256[2] data; // size is _maxReserves / 128 + ((_maxReserves % 128 > 0) ? 1 : 0), but need to be literal
  }

  enum InterestRateMode {NONE, STABLE, VARIABLE}
}
