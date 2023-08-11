// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract PrimeCounter {
    address public immutable nftAddress;

    constructor(address _nftAddress) {
        require(_nftAddress != address(0), "Invalid NFT address");
        nftAddress = _nftAddress;
    }

    function countPrimes(address holder) public view returns (uint256) {
        // get token count for holder
        uint256 count = ERC721Enumerable(nftAddress).balanceOf(holder);
        uint256[] memory tokenIds = new uint256[](count);

        // fill array with token ids owned by holder
        for (uint256 i; i < count;) {
            tokenIds[i] = ERC721Enumerable(nftAddress).tokenOfOwnerByIndex(holder, i);
            unchecked {
                i++;
            }
        }

        // count primes in array and return
        return _countPrimes(tokenIds);
    }

    function _countPrimes(uint256[] memory tokenIds) internal pure returns (uint256) {
        uint256 primeCount = 0;
        uint256 len = tokenIds.length;
        for (uint256 i; i < len;) {
            if (_isPrime(tokenIds[i])) {
                primeCount++;
            }
            unchecked {
                i++;
            }
        }

        return primeCount;
    }

    function _isPrime(uint256 n) private pure returns (bool) {
        if (n < 2) return false;
        if (n == 2) return true;
        if (n % 2 == 0) return false;

        for (uint256 i = 3; i * i <= n;) {
            if (n % i == 0) return false;
            unchecked {
                i += 2;
            }
        }
        return true;
    }
}
