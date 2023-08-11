# Prime Counter

## spec

- [x] **Smart contract ecosystem 2:** NFT Enumerable Contracts
  - [x] Create a new NFT collection with 20 items using ERC721Enumerable. The token ids should be [1..20] inclusive.
  - [x] Create a second smart contract that has a function which accepts an address and returns how many NFTs are owned by that address which have tokenIDs that are prime numbers. For example, if an address owns tokenIds 10, 11, 12, 13, it should return 2. In a real blockchain game, these would refer to special items, but we only care about the abstract functionality for this exercise. Don’t hardcode the prime values, this should work for numbers arbitrarily larger than 20. **There is a lot of opportunity to gas optimize this routine.**

## tests

| File                 | % Lines         | % Statements    | % Branches      | % Funcs       |
| -------------------- | --------------- | --------------- | --------------- | ------------- |
| src/NFTprimes.sol    | 100.00% (3/3)   | 100.00% (3/3)   | 100.00% (2/2)   | 100.00% (1/1) |
| src/PrimeCounter.sol | 100.00% (20/20) | 100.00% (33/33) | 100.00% (10/10) | 100.00% (3/3) |
| Total                | 100.00% (23/23) | 100.00% (36/36) | 100.00% (12/12) | 100.00% (4/4) |
