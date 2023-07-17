// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTprimes is ERC721Enumerable {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
