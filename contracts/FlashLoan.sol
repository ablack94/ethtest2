pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

//import "@studydefi/money-legos/dydx/contracts/DydxFlashloanBase.sol";
import "./DydxFlashloanBase.sol";
//import "@studydefi/money-legos/dydx/contracts/ICallee.sol";
import "./ICallee.sol";

import "@studydefi/money-legos/onesplit/contracts/IOneSplit.sol";

//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


//pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/*
contract IOneSplitConsts {
    // flags = FLAG_DISABLE_UNISWAP + FLAG_DISABLE_BANCOR + ...
    uint256 internal constant FLAG_DISABLE_UNISWAP = 0x01;
    uint256 internal constant DEPRECATED_FLAG_DISABLE_KYBER = 0x02; // Deprecated
    uint256 internal constant FLAG_DISABLE_BANCOR = 0x04;
    uint256 internal constant FLAG_DISABLE_OASIS = 0x08;
    uint256 internal constant FLAG_DISABLE_COMPOUND = 0x10;
    uint256 internal constant FLAG_DISABLE_FULCRUM = 0x20;
    uint256 internal constant FLAG_DISABLE_CHAI = 0x40;
    uint256 internal constant FLAG_DISABLE_AAVE = 0x80;
    uint256 internal constant FLAG_DISABLE_SMART_TOKEN = 0x100;
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_ETH = 0x200; // Deprecated, Turned off by default
    uint256 internal constant FLAG_DISABLE_BDAI = 0x400;
    uint256 internal constant FLAG_DISABLE_IEARN = 0x800;
    uint256 internal constant FLAG_DISABLE_CURVE_COMPOUND = 0x1000;
    uint256 internal constant FLAG_DISABLE_CURVE_USDT = 0x2000;
    uint256 internal constant FLAG_DISABLE_CURVE_Y = 0x4000;
    uint256 internal constant FLAG_DISABLE_CURVE_BINANCE = 0x8000;
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_DAI = 0x10000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_USDC = 0x20000; // Deprecated, Turned off by default
    uint256 internal constant FLAG_DISABLE_CURVE_SYNTHETIX = 0x40000;
    uint256 internal constant FLAG_DISABLE_WETH = 0x80000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_COMPOUND = 0x100000; // Works only when one of assets is ETH or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 internal constant FLAG_DISABLE_UNISWAP_CHAI = 0x200000; // Works only when ETH<>DAI or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 internal constant FLAG_DISABLE_UNISWAP_AAVE = 0x400000; // Works only when one of assets is ETH or FLAG_ENABLE_MULTI_PATH_ETH
    uint256 internal constant FLAG_DISABLE_IDLE = 0x800000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP = 0x1000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_V2 = 0x2000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_V2_ETH = 0x4000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_V2_DAI = 0x8000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_V2_USDC = 0x10000000;
    uint256 internal constant FLAG_DISABLE_ALL_SPLIT_SOURCES = 0x20000000;
    uint256 internal constant FLAG_DISABLE_ALL_WRAP_SOURCES = 0x40000000;
    uint256 internal constant FLAG_DISABLE_CURVE_PAX = 0x80000000;
    uint256 internal constant FLAG_DISABLE_CURVE_RENBTC = 0x100000000;
    uint256 internal constant FLAG_DISABLE_CURVE_TBTC = 0x200000000;
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_USDT = 0x400000000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_WBTC = 0x800000000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_TBTC = 0x1000000000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_RENBTC = 0x2000000000; // Deprecated, Turned off by default
    uint256 internal constant FLAG_DISABLE_DFORCE_SWAP = 0x4000000000;
    uint256 internal constant FLAG_DISABLE_SHELL = 0x8000000000;
    uint256 internal constant FLAG_ENABLE_CHI_BURN = 0x10000000000;
    uint256 internal constant FLAG_DISABLE_MSTABLE_MUSD = 0x20000000000;
    uint256 internal constant FLAG_DISABLE_CURVE_SBTC = 0x40000000000;
    uint256 internal constant FLAG_DISABLE_DMM = 0x80000000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_ALL = 0x100000000000;
    uint256 internal constant FLAG_DISABLE_CURVE_ALL = 0x200000000000;
    uint256 internal constant FLAG_DISABLE_UNISWAP_V2_ALL = 0x400000000000;
    uint256 internal constant FLAG_DISABLE_SPLIT_RECALCULATION = 0x800000000000;
    uint256 internal constant FLAG_DISABLE_BALANCER_ALL = 0x1000000000000;
    uint256 internal constant FLAG_DISABLE_BALANCER_1 = 0x2000000000000;
    uint256 internal constant FLAG_DISABLE_BALANCER_2 = 0x4000000000000;
    uint256 internal constant FLAG_DISABLE_BALANCER_3 = 0x8000000000000;
    uint256 internal constant DEPRECATED_FLAG_ENABLE_KYBER_UNISWAP_RESERVE = 0x10000000000000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_KYBER_OASIS_RESERVE = 0x20000000000000; // Deprecated, Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_KYBER_BANCOR_RESERVE = 0x40000000000000; // Deprecated, Turned off by default
    uint256 internal constant FLAG_ENABLE_REFERRAL_GAS_SPONSORSHIP = 0x80000000000000; // Turned off by default
    uint256 internal constant DEPRECATED_FLAG_ENABLE_MULTI_PATH_COMP = 0x100000000000000; // Deprecated, Turned off by default
    uint256 internal constant FLAG_DISABLE_KYBER_ALL = 0x200000000000000;
    uint256 internal constant FLAG_DISABLE_KYBER_1 = 0x400000000000000;
    uint256 internal constant FLAG_DISABLE_KYBER_2 = 0x800000000000000;
    uint256 internal constant FLAG_DISABLE_KYBER_3 = 0x1000000000000000;
    uint256 internal constant FLAG_DISABLE_KYBER_4 = 0x2000000000000000;
    uint256 internal constant FLAG_ENABLE_CHI_BURN_BY_ORIGIN = 0x4000000000000000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP_ALL = 0x8000000000000000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP_ETH = 0x10000000000000000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP_DAI = 0x20000000000000000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP_USDC = 0x40000000000000000;
    uint256 internal constant FLAG_DISABLE_MOONISWAP_POOL_TOKEN = 0x80000000000000000;
}
*/

// contract IOneSplit {
//     /*
//     function getExpectedReturn(
//         IERC20 fromToken,
//         IERC20 destToken,
//         uint256 amount,
//         uint256 parts,
//         uint256 flags // See constants in IOneSplit.sol
//     )
//         public
//         view
//         returns(
//             uint256 returnAmount,
//             uint256[] memory distribution
//         );
//     */
//     function swap(
//         IERC20 fromToken,
//         IERC20 destToken,
//         uint256 amount,
//         uint256 minReturn,
//         uint256[] memory distribution,
//         uint256 flags
//     )
//         public
//         payable
//         returns(uint256 returnAmount);
// }

contract DydxFlashLoaner is ICallee, DydxFlashloanBase {

    struct MyCustomData {
        address loanedToken;
        uint256 loanedAmount;
        uint256 repayAmount;
        address intermediateToken;
        uint256[] distribution1;
        uint256[] distribution2;
    }

    // 1inch
    address constant OneSplitAddress = 0xC586BeF4a0992C495Cf22e1aeEE4E446CECDee0E;
    IOneSplit public oneSplit;

    function swap1inch(
        IERC20 srcToken,
        uint srcAmount,
        IERC20 destToken,
        uint256[] memory distribution)
            internal
    {
        // Check
        require(srcAmount <= srcToken.balanceOf(address(this)), "1inch srcToken");
        // Approve
        require(srcToken.approve(OneSplitAddress, srcAmount), "1inch approve");
        // Get best route
        /*
        (uint256 returnAmount, uint256[] memory distribution) = oneSplit.getExpectedReturn(
            srcToken,
            destToken,
            srcAmount,
            10,
            0
        );
        */
        // Swap
        IOneSplit(OneSplitAddress).swap(
            srcToken,
            destToken,
            srcAmount,
            0, // minimumDest
            distribution,
            0
        );
    }

    /*
    function doWork(IERC20 loanedToken, uint256 amount, IERC20 intermediateToken) internal
    {
        IOneSplitMulti oneSplitM = IOneSplitMulti(OneSplitAddress);

        IERC20[] memory tokens = new IERC20[](3);
            tokens[0] = loanedToken;
            tokens[1] = intermediateToken;
            tokens[2] = loanedToken;

        uint256[] memory parts = new uint256[](2);
            parts[0] = 10;
            parts[1] = 10;
        
        uint256[] memory flags = new uint256[](2);
            flags[0] = 0;
            flags[1] = 0;

        uint256[] memory gasPrices = new uint256[](2);
            gasPrices[0] = 0;
            gasPrices[1] = 0;

        (uint256[] memory returnAmount, uint256 estimateGasAMount, uint256[] memory distribution) = oneSplitM.getExpectedReturnWithGasMulti(
            tokens,
            amount,
            parts,
            flags,
            flags);

        oneSplitM.swapMulti(
            tokens,
            amount,
            0,
            distribution,
            flags
        );
    }
    */

    // This is the function that will be called postLoan
    // i.e. Encode the logic to handle your flashloaned funds here
    function callFunction(
        address sender,
        Account.Info memory account,
        bytes memory data
    ) public {
        MyCustomData memory mcd = abi.decode(data, (MyCustomData));
        IERC20 loanedToken = IERC20(mcd.loanedToken);
        IERC20 intermediateToken = IERC20(mcd.intermediateToken);

        oneSplit = IOneSplit(OneSplitAddress);
        
        // loanedToken -> intermediateToken
        swap1inch(
            loanedToken,
            mcd.loanedAmount,
            intermediateToken,
            mcd.distribution1);
        uint256 intermediateAmount = intermediateToken.balanceOf(address(this));
        require(intermediateAmount > 0, "return 1");
        // intermediateToken -> loanedToken
        swap1inch(
            intermediateToken,
            intermediateAmount,
            loanedToken,
            mcd.distribution2);

        //doWork(loanedToken, mcd.loanedAmount, intermediateToken);

        // How did we do?
        uint256 fLoanedBalance = loanedToken.balanceOf(address(this));
        require(fLoanedBalance > 0, "no profit");
        //uint256 fIntermediateBalance = intermediateToken.balanceOf(address(this));
        //uint256 loanedProfit = fLoanedBalance - mcd.repayAmount;
        
        // Did we make enough?
        require(fLoanedBalance >= mcd.repayAmount, "repay dydx");
        // Pocket profit
        loanedToken.transfer(sender, fLoanedBalance - mcd.repayAmount);
        //if(fIntermediateBalance > 0)
        //{
        //    intermediateToken.transfer(sender, fIntermediateBalance);
        //}
        
    }

    function initiateFlashLoan(
        address _solo,
        address _token,
        uint256 _amount,
        address intermediateToken,
        uint256[] calldata distribution1,
        uint256[] calldata distribution2)
            external
    {
        ISoloMargin solo = ISoloMargin(_solo);
        //oneSplit = IOneSplit(OneSplitAddress);

        // Get marketId from token address
        uint256 marketId = _getMarketIdFromTokenAddress(_solo, _token);

        // Calculate repay amount (_amount + (2 wei))
        // Approve transfer from
        uint256 repayAmount = _getRepaymentAmountInternal(_amount);
        IERC20(_token).approve(_solo, repayAmount);

        // 1. Withdraw $
        // 2. Call callFunction(...)
        // 3. Deposit back $
        Actions.ActionArgs[] memory operations = new Actions.ActionArgs[](3);

        operations[0] = _getWithdrawAction(marketId, _amount);
        operations[1] = _getCallAction(
            // Encode MyCustomData for callFunction
            abi.encode(MyCustomData(
                {
                    loanedToken: _token,
                    loanedAmount: _amount,
                    repayAmount: repayAmount,
                    intermediateToken: intermediateToken,
                    distribution1: distribution1,
                    distribution2: distribution2
                })
            )
        );
        operations[2] = _getDepositAction(marketId, repayAmount);

        Account.Info[] memory accountInfos = new Account.Info[](1);
        accountInfos[0] = _getAccountInfo();

        solo.operate(accountInfos, operations);
    }
}