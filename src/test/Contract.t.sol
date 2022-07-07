// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
// import "ds-test/cheatcode/cheatcode.sol";
import "../nftMarketPlace.sol";
import "../nft.sol";

contract ContractTest is DSTest {
    NFTMarketplace nftmarket;
    NFT nft;
    uint256 listingPrice = 0.015 ether;
    // Vm cheat = Vm(HEVM_ADDRESS);

    // address owner = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    function setUp() public {
        nftmarket = new NFTMarketplace();
        nft = new NFT(address(nftmarket));
    }

    function testCreateNft() public returns (uint256 token1, uint256 token2) {
        token1 = nft.createToken("http://www.mytokenlocation.com");
        // token2 = nft.createToken("http://www.mytokenlocation2.com");
        assert(token1 == 1);
        // assert(token2 == 2);
        nftmarket.createMarketItem{value:0.015 ether}(address(nft),1,0.025 ether);
         nftmarket.createMarketSale{value:0.025 ether}(address(nft),1);

    }



    function testListingPrice() public view returns (uint256 listing) {
        listing = nftmarket.listingPrice();
        assert(listing == 0.015 ether);
    }

    // function testCreateMarket() public {
    //     nftmarket.createMarketSale{value:0.025 ether}(address(nft),1);
    // }




}
