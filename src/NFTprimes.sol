// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NFTprimes is ERC721Enumerable {
    uint256 public constant MAX_SUPPLY = 20;
    uint256 public currentSupply;

    constructor() ERC721("NFTprimes", "NFTP") {}

    function mint() public {
        require(currentSupply < MAX_SUPPLY, "Max supply reached");
        currentSupply++;
        _safeMint(msg.sender, currentSupply);
    }
}
