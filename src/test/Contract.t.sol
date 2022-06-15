// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "ds-test/test.sol";
import "ds-test/cheatcode/cheatcode.sol";
import "../nft.sol";
import "../nftMarketPlace.sol";



contract ContractTest is DSTest {
    NFTMarketplace nftmarket;
    NFT nft;
    Vm cheat = Vm(HEVM_ADDRESS);
    // address owner = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
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

    //   function testUpdateListingPrice() public returns (uint256 result){
    //     nftmarket.updateListingPrice(0.016 ether);
    //      result = nftmarket.listingPrice();
    //     assert(result == 0.016 ether);
    // }

    function testListingPrice() public view returns  (uint256 listing){
        listing = nftmarket.listingPrice();
        assert(listing == 0.015 ether);
    }

    function testCreateMarket() public{
        nftmarket.createMarketItem(address(nft), 0, 0.015 ether);


    }

 
  


}
