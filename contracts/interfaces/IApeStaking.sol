// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.10;

import "./IApeCoinStaking.sol";
import "../ApeStakingStorage.sol";

interface IApeStaking {

    function apeCoin() external view returns (address);

    function apeCoinStaking() external view returns (address);

    function apePool() external view returns (address);

    function claimAndRestake(
        address userAddr,
        uint256[] memory baycNfts,
        uint256[] memory maycNfts,
        IApeCoinStaking.PairNft[] memory baycPairNfts,
        IApeCoinStaking.PairNft[] memory maycPairNfts
    ) external;

    function claimApeCoin(
        address nftAsset,
        uint256[] memory _nfts,
        IApeCoinStaking.PairNft[] memory _nftPairs
    ) external;

    function depositAndBorrowApeAndStake(
        ApeStakingStorage.DepositInfo memory depositInfo,
        ApeStakingStorage.StakingInfo memory stakingInfo,
        IApeCoinStaking.SingleNft[] memory _nfts,
        IApeCoinStaking.PairNftDepositWithAmount[] memory _nftPairs
    ) external;

    function feeTo() external view returns (address);

    function getRewardRatePerBlock(uint256 poolId, uint256 addAmount)
        external
        view
        returns (uint256);

    function getStakeInfo(uint256 poolId, uint256 nftId)
        external
        view
        returns (
            uint256,
            uint256,
            uint256
        );

    function getStakeNftIds(address nftAsset)
        external
        view
        returns (uint256[] memory nftIds);

    function getUserHealth(address userAddr)
        external
        returns (uint256 totalIncome, uint256 totalPay);

    function getUserInfo(address userAddr, address nftAsset)
        external
        returns (
            uint256 collectRate,
            uint256 iTokenAmount,
            uint256 pTokenAmount,
            uint256 interestReward,
            uint256[] memory stakeNftIds,
            uint256[] memory depositNftIds
        );

    function initialize(
        address apePool_,
        address nftGateway_,
        address pawnToken_,
        address feeTo_,
        ApeStakingStorage.StakingConfiguration memory stakingConfiguration_
    ) external;

    function nftGateway() external view returns (address);

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function onStopStake(
        address caller,
        address nftAsset,
        uint256[] memory nftIds,
        uint8 actionType
    ) external;

    function owner() external view returns (address);

    function pawnToken() external view returns (address);

    function pbakcAddr() external view returns (address);

    function pbaycAddr() external view returns (address);

    function pmaycAddr() external view returns (address);

    function renounceOwnership() external;

    function setCollectRate(uint256 newCollectRate) external;

    function setFeeTo(address newFeeTo) external;

    function setStakingConfiguration(
        ApeStakingStorage.StakingConfiguration memory newStakingConfiguration
    ) external;

    function stakingConfiguration()
        external
        view
        returns (
            uint256 addMinStakingRate,
            uint256 restakeMinTotalAmount,
            uint256 restakeMinOneAmount,
            uint256 liquidateRate,
            uint256 borrowSafeRate,
            uint256 liquidatePawnAmount,
            uint256 feeRate
        );

    function transferOwnership(address newOwner) external;

    function unstakeAndRepay(
        address userAddr,
        address[] memory nftAssets,
        uint256[] memory nftIds
    ) external;

    function withdraw(
        uint256[] memory _baycTokenIds,
        uint256[] memory _maycTokenIds,
        uint256[] memory _bakcTokenIds
    ) external;

    function withdrawApeCoin(
        address nftAsset,
        IApeCoinStaking.SingleNft[] memory _nfts,
        IApeCoinStaking.PairNftWithdrawWithAmount[] memory _nftPairs
    ) external;
}