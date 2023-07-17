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
        vm.startPrank(alice);
        nftPrimes.mint(); // 1
        nftPrimes.mint(); // 2 PRIME
        nftPrimes.mint(); // 3 PRIME
        nftPrimes.mint(); // 4
        nftPrimes.mint(); // 5 PRIME
        nftPrimes.mint(); // 6
        nftPrimes.mint(); // 7 PRIME
        nftPrimes.mint(); // 8
        nftPrimes.mint(); // 9
        nftPrimes.mint(); // 10
        nftPrimes.mint(); // 11 PRIME
        nftPrimes.mint(); // 12
        nftPrimes.mint(); // 13 PRIME
        nftPrimes.mint(); // 14
        nftPrimes.mint(); // 15
        nftPrimes.mint(); // 16
        nftPrimes.mint(); // 17 PRIME
        nftPrimes.mint(); // 18
        nftPrimes.mint(); // 19 PRIME
        nftPrimes.mint(); // 20
        vm.stopPrank();

        uint256 primeCount = primeCounter.countPrimes(alice);
        assertEq(primeCount, 8);
    }
}
