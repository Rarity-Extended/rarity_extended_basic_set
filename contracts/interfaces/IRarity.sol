// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

interface IRarity {
    function level(uint) external view returns (uint);
    function class(uint) external view returns (uint);
    function getApproved(uint) external view returns (address);
    function ownerOf(uint) external view returns (address);
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    function next_summoner() external view returns (uint);
    function summon(uint _class) external;
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}
