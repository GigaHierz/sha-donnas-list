// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @title ContributorToken
 * @dev Implements the contributorToken distribution to the Member
 */
contract ContributorToken is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    uint256 public maxSupply;
    address public tokenIssuer;

    constructor(
        address _issuer,
        string memory _name,
        string memory _symbol,
        uint256 _nbTokens
    ) ERC721(_name, _symbol) {
        maxSupply = _nbTokens;
        tokenIssuer = _issuer;
    }

    function _createRatingTokens(uint256 _nbTokens) external {
        for (uint256 i; i < _nbTokens; i++) {
            _safeMint(msg.sender, i);
        }
    }

    function _transferContributorToken(address to)
        public
        returns (string memory)
    {
        // add non-tranferable function
        uint256 _tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        _transfer(tokenIssuer, to, _tokenId);

        // add token to MerkelTree Tornadocash

        return "as234sdadfa";
    }

    function safeMint(
        address to,
        uint256 _tokenId,
        string memory _uri
    ) public onlyOwner {
        _safeMint(to, _tokenId);
        _setTokenURI(_tokenId, _uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 _tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(_tokenId);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(_tokenId);
    }
}
