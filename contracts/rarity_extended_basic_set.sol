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

    /*******************************************************************************
    **  @notice: used for admin to extract money earned from sets sales
	*******************************************************************************/
    function getMoney() public onlyExtended {
        payable(msg.sender).transfer(address(this).balance);
    }

    /*******************************************************************************
    **  @dev: deploy 4 new rERC721 (head, body, hand, foot). Saves on a registry
    **  @notice: deploy a new set
    **  @param setName: name of the set
    **  @param headName: name of the rERC721 of the head
    **	@param headSymbol: symbol of the rERC721 of the head
    **  @param bodyName: name of the rERC721 of the body
    **  @param bodySymbol: symbol of the rERC721 of the body
    **	@param handName: name of the rERC721 of the hand
    **  @param handSymbol: symbol of the rERC721 of the hand
    **  @param footName: name of the rERC721 of the foot
    **	@param footSymbol: symbol of the rERC721 of the foot
	*******************************************************************************/
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

    /*******************************************************************************
    **  @dev: internal function for mint a new set part 
    **  @param setAddr: address of the rERC721
    **  @param receiver: summoner which will receive the set
	*******************************************************************************/
    function _mintSet(address setAddr, uint receiver) internal {
        IrERC721 set = IrERC721(setAddr);
        set.mint(receiver);
    }

    /*******************************************************************************
    **  @dev: mint a new set in exchange for `basicSetPrice`
    **  @notice: buy a new set paying the price
    **  @param setIndex: index of the set to buy
    **  @param receiver: summoner which will receive the set
	*******************************************************************************/
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

    /*******************************************************************************
    **  @notice: get all sets
    **  @return: an array of BasicSet
	*******************************************************************************/
    function getSets() public view returns (BasicSet[] memory) {
        uint _setsIndex = setsIndex - 1;
        BasicSet[] memory _sets = new BasicSet[](_setsIndex - 1);
        for (uint256 i = 0; i < _setsIndex; i++) {
            _sets[i] = sets[i];
        }
        return _sets;
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

    /*******************************************************************************
    **  @notice: mint a new set part
    **  @param to: receiver of the rERC721
	*******************************************************************************/
    function mint(uint to) public onlyExtended {
        _safeMint(to, tokenIds);
        tokenIds++;
    }

}