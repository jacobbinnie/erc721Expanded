// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BullyGoats is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("BullyGoats", "MAAA") {}

    uint256 mintPrice = 1 ether;

    function Mint(uint256 num) public payable {
        uint256 tokenId = _tokenIdCounter.current();
        uint256 supply = totalSupply();
        require(tokenId <= 8888, "Max supply minted");
        require(
            num <= 5,
            "You can only mint maximum 5 NFTs in one transaction"
        );
        require(
            (supply + num) <= 8888,
            "This NFT collection has almost sold out. Reduce the number of NFTs you are trying to mint in one transaction. "
        );
        require(
            msg.value >= mintPrice * num,
            "Not enough ether. Check your wallet balance. The mint price per NFT is 1 ether."
        );
        _tokenIdCounter.increment();
        for (uint256 i; i < num; i++) {
            _safeMint(msg.sender, supply + i);
        }
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
