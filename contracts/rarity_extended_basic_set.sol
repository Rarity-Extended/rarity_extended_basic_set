// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./interfaces/IrERC721.sol";
import "./ERC721Enumerable.sol";
import "./extended.sol";

contract rarity_extended_basic_set is Extended {

    uint public basicSetPrice;
    IrERC721 public heavySet;
    IrERC721 public lightSet;
    IrERC721 public mediumSet;
    IrERC721 public magicianSet;

    constructor(uint _basicSetPrice) {
        basicSetPrice = _basicSetPrice;
    }

    function getMoney() public onlyExtended {
        payable(msg.sender).transfer(address(this).balance);
    }

    function buyHeavySet(uint receiver) public payable {
        require(msg.value == basicSetPrice, "!basicSetPrice");
    }

}