// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./interfaces/IrERC721.sol";
import "./rERC721Enumerable.sol";
import "./extended.sol";

contract rarity_extended_basic_set is Extended {

    uint public basicSetPrice;
    uint public setsIndex = 1;
    address public rm;
    mapping(uint => BasicSet) public sets;

    struct BasicSet {
        string setName;
        address head;
        address body;
        address hand;
        address foot;
    }

    constructor(address _rm, uint _basicSetPrice) {
        rm = _rm;
        basicSetPrice = _basicSetPrice;
    }

    function getMoney() public onlyExtended {
        payable(msg.sender).transfer(address(this).balance);
    }

    function deployNewSet(
        string memory setName,
        string memory headName,
        string memory headSymbol,
        string memory bodyName,
        string memory bodySymbol,
        string memory handName,
        string memory handSymbol,
        string memory footName,
        string memory footSymbol
    ) public onlyExtended {
        
        //Head
        basic_set head = new basic_set(rm, headName, headSymbol);

        //Body
        basic_set body = new basic_set(rm, bodyName, bodySymbol);

        //Hand
        basic_set hand = new basic_set(rm, handName, handSymbol);

        //Foot
        basic_set foot = new basic_set(rm, footName, footSymbol);

        //Save on registry
        sets[setsIndex] = BasicSet(setName, address(head), address(body), address(hand), address(foot));
        setsIndex++;
    }

    function _mintSet(address setAddr, uint receiver) internal {
        IrERC721 set = IrERC721(setAddr);
        set.mint(receiver);
    }

    function buySet(uint setIndex, uint receiver) public payable {
        require(msg.value == basicSetPrice, "!basicSetPrice");
        require(setIndex != 0, "!setIndex");
        BasicSet memory setToBuy = sets[setIndex];

        //Head
        _mintSet(setToBuy.head, receiver);

        //Body
        _mintSet(setToBuy.body, receiver);

        //Hand
        _mintSet(setToBuy.hand, receiver);

        //Foot
        _mintSet(setToBuy.foot, receiver);
    }

}

contract basic_set is rERC721Enumerable, Extended {

    uint public tokenIds = 1;
    string public name;
    string public symbol;

    constructor(address _rm, string memory _name, string memory _symbol) ERC721(_rm) {
        name = _name;
        symbol = _symbol;
    }

    function mint(uint to) external onlyExtended {
        _safeMint(to, tokenIds);
        tokenIds++;
    }

}