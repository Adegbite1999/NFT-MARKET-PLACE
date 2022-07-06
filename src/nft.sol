// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;
import "openzeppelin-contracts/contracts/utils/Counters.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _itemsSold;
    address contractAddress;

    constructor(address marketPlaceAddress) ERC721("codeWhizperer", "CWR") {
        contractAddress = marketPlaceAddress;
    }

    function createToken(string memory tokenURI)
        public
        payable
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newTokenId;
    }

    function getBalanceOfToken(address owner) public view returns (uint256) {
        return balanceOf(owner);
    }
}
