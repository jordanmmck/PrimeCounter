// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PrimeCounter.sol";
import "../src/NFTprimes.sol";

contract PrimeCounterTest is Test {
    NFTprimes public nftPrimes;
    PrimeCounter public primeCounter;
    address public alice = address(0x1);

    function setUp() public {
        nftPrimes = new NFTprimes();
        primeCounter = new PrimeCounter(address(nftPrimes));
    }

    function testPrimeCounter() public {
        // alice will own [0, 1, 2, 3, 4, 5, 6, 7]
        vm.startPrank(alice);
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        nftPrimes.mint();
        vm.stopPrank();

        // there are 4 primes in the array above
        uint256 primeCount = primeCounter.countPrimes(alice);
        assertEq(primeCount, 4);
    }

    function _printAllIds(address holder) private view {
        uint256 count = nftPrimes.balanceOf(holder);
        console.log("-------");
        for (uint256 i; i < count;) {
            console.log(nftPrimes.tokenOfOwnerByIndex(holder, i));
            unchecked {
                i++;
            }
        }
        console.log("-------");
    }

    // function _getAllIds(address holder) private view returns (uint256[] memory) {
    //     uint256 count = nftPrimes.balanceOf(holder);
    //     uint256[] memory tokenIds = new uint256[](count);

    //     for (uint256 i; i < count;) {
    //         tokenIds[i] = nftPrimes.tokenOfOwnerByIndex(holder, i);
    //         unchecked {
    //             i++;
    //         }
    //     }

    //     return tokenIds;
    // }
}
