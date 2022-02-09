// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFTs is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MyNFTs", "MNFT") { //토큰이름, 토큰이니셜
    } 

    function mintNFT(string memory tokenURI)
        public onlyOwner 
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId); //오너의 지갑에서만 실행할 수 있다.& 오너의지갑으로 발행
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}