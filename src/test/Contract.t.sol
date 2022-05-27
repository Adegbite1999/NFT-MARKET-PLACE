// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../nft.sol";
import "../nftMarketPlace.sol";

contract ContractTest is DSTest {
    NFTMarketplace nftmarket;
    NFT nft;
    function setUp() public {
     nftmarket = new NFTMarketplace();
     nft = new NFT(address(nftmarket));
    }

    function testCreateNft() public returns (uint256 token1, uint256 token2) {
   token1 = nft.createToken("http://www.mytokenlocation.com");
   token2=  nft.createToken("http://www.mytokenlocation2.com");
    assert(token1 == 1);
    assert(token2 == 2);
    }
    //   function testCreateNft2() public returns (uint256 token2) {
    // token2=  nft.createToken("http://www.mytokenlocation2.com");
    //  assert(token2 == 2);
    // }
}
