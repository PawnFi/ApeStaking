// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.10;

import "./InterestRateModel.sol";

/**
 * @title Pawnfi's ApePoolStorage Contract
 * @author Pawnfi
 */
abstract contract ApePoolStorage {

    // keccak256("REINVEST_ROLE")
    bytes32 internal constant REINVEST_ROLE = 0xd93ff0403c1db5bd4fbb77a795131f2a70890eb98caff8a0284dcba25677aeb2;

    // Maximum fraction of interest that can be set aside for reserves
    uint internal constant reserveFactorMaxMantissa = 1e18;

    /// @notice Platform fee used for reinvestment
    uint public reinvestmentFee;

    // token Precision digit 
    uint8 internal _decimals;

    /**
     * @notice Underlying asset for this CToken
     */
    address public underlying;

    /**
     * @notice ApeCoin Staking address
     */
    address public apeCoinStaking;

    /**
     * @notice ApeStaking address
     */
    address public apeStaking;

    /**
     * @dev Guard variable for re-entrancy checks
     */
    bool internal _notEntered;

    /**
     * @notice Model which tells what the current interest rate should be
     */
    InterestRateModel public interestRateModel;

    // Initial exchange rate used when minting the first CTokens (used when totalSupply = 0)
    uint internal initialExchangeRateMantissa;

    /**
     * @notice Fraction of interest currently set aside for reserves
     */
    uint public reserveFactorMantissa;

    /**
     * @notice Block number that interest was last accrued at
     */
    uint public accrualBlockNumber;

    /**
     * @notice Accumulator of the total earned interest rate since the opening of the market
     */
    uint public borrowIndex;

    /**
     * @notice Total amount of outstanding borrows of the underlying in this market
     */
    uint public totalBorrows;

    /**
     * @notice Container for borrow balance information
     * @member principal Total balance (with accrued interest), after applying the most recent balance-changing action
     * @member interestIndex Global borrowIndex as of the most recent balance-changing action
     */
    struct BorrowSnapshot {
        uint principal;
        uint interestIndex;
    }

    // Mapping of account addresses to outstanding borrow balances
    mapping(address => BorrowSnapshot) internal accountBorrows;


    /*** Market Events ***/

    /**
     * @notice Event emitted when interest is accrued
     */
    event AccrueInterest(uint cashPrior, uint interestAccumulated, uint borrowIndex, uint totalBorrows);

    /**
     * @notice Event emitted when tokens are redeemed
     */
    event Redeem(address redeemer, uint redeemAmount, uint redeemTokens);

    /**
     * @notice Event emitted when underlying is borrowed
     */
    event Borrow(address borrower, uint borrowAmount, uint accountBorrows, uint totalBorrows);

    /**
     * @notice Event emitted when a borrow is repaid
     */
    event RepayBorrow(address payer, address borrower, uint repayAmount, uint accountBorrows, uint totalBorrows);


    /*** Admin Events ***/

    /**
     * @notice Event emitted when interestRateModel is changed
     */
    event NewMarketInterestRateModel(InterestRateModel oldInterestRateModel, InterestRateModel newInterestRateModel);

    /**
     * @notice Event emitted when the reserve factor is changed
     */
    event NewReserveFactor(uint oldReserveFactorMantissa, uint newReserveFactorMantissa);
}