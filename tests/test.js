const { expect } = require("chai");
const { rarityManifestedAddr } = require("../registry.json");

describe("Basic set", function () {

    before(async function () {
        this.timeout(6000000000);

        [this.user, this.anotherUser, ...this.others] = await ethers.getSigners();

        this.basicSetPrice = ethers.utils.parseUnits("1");

        //Deploy
        this.Contract = await ethers.getContractFactory("rarity_extended_basic_set");
        this.contract = await this.Contract.deploy(rarityManifestedAddr, this.basicSetPrice);
        await this.contract.deployed();
    });
    
    it("Should deploy a new set, successfully...", async function () {
        this.timeout(6000000000);
    });

    it("Should buy a set, successfully...", async function () {
        this.timeout(6000000000);
    });

    it("Should get money, successfully...", async function () {
        this.timeout(6000000000);
    });

});