const Test = artifacts.require("DydxFlashLoaner");


module.exports = async (config) => {
    console.log("Hello world");

    const { ethers } = require("ethers");
    const { legos } = require("@studydefi/money-legos");

    const provider = new ethers.providers.JsonRpcProvider(
//        "http://localhost:8545",
//            "http://192.168.1.240:7545"
			"http://127.0.0.1:8545"
    );

    const wallet = new ethers.Wallet(
        //"0xa0df350d2637096571F7A701CBc1C5fdE30dF76A",
		"0xa0df350d2637096571F7A701CBc1C5fdE30dF76A",
        provider,
    );

    let instance = await Test.deployed();
    let accounts = await web3.eth.getAccounts();

    console.log(accounts);

    console.log("Getting balance");
    let bal = await wallet.getBalance();
    console.log(bal);
    //console.log(await wallet.getBalance());

    //console.log(ethers.utils.parseEther("10"));

    let GRT = "0xc944e90c64b2c07662a292be6244bdf05cda44a7";
    let AKRO = "0x8ab7404063ec4dbcfd4598215992dc3f8ec853d7";

    let tok = AKRO;

    const oneSplitContract = new ethers.Contract(
        legos.onesplit.address,
        legos.onesplit.abi,
        wallet
    );
    
    const expectedReturn1 = await oneSplitContract.getExpectedReturn(
        legos.erc20.weth.address,
        tok,
        100,
        10,
        0
    );
    console.log("RETURN 1");
    console.log(expectedReturn1.returnAmount.toString());

    const expectedReturn2 = await oneSplitContract.getExpectedReturn(
        tok,
        legos.erc20.weth.address,
        expectedReturn1.returnAmount,
        10,
        0
    );
    console.log("RETURN 2");
    console.log(expectedReturn2.returnAmount.toString());

    console.log(expectedReturn1.distribution);
    console.log(expectedReturn2.distribution);

    console.log({
        address: legos.dydx.soloMargin.address,
        weth: legos.erc20.weth.address,
        amount: ethers.utils.parseEther("100").toString(),
        otherToken: tok,
        expectedReturn1: expectedReturn1.distribution.join(','),
        expectedReturn2: expectedReturn2.distribution.join(',')
    });



    console.log("Calling flashloan");
    await instance.initiateFlashLoan(
        legos.dydx.soloMargin.address,
        legos.erc20.weth.address,
        ethers.utils.parseEther("100"),
        tok,
        expectedReturn1.distribution,
        expectedReturn2.distribution
    );
    console.log("DONE");

}