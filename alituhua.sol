// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/PullPayment.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFT is ERC721, PullPayment, Ownable {
  using Counters for Counters.Counter;

  // Constants
  uint256 public constant TOTAL_SUPPLY = 169;

  Counters.Counter private currentTokenId;

  /// @dev Base token URI used as a prefix by tokenURI().
  string public baseTokenURI;
  string public contractURI;

  constructor() ERC721("阿里土话", "ALI") {
    baseTokenURI = "";
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 26);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 41);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 103);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 104);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 105);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 109);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 111);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 115);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 117);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 122);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 123);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 126);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 134);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 146);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 147);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 150);
  }

  function mintTo(address recipient) public payable returns (uint256) {
    uint256 tokenId = currentTokenId.current();
    require(tokenId < TOTAL_SUPPLY, "Max supply reached");

    currentTokenId.increment();
    uint256 newItemId = currentTokenId.current();
    _safeMint(recipient, newItemId);
    return newItemId;
  }

  /// @dev Returns an URI for a given token ID
  function _baseURI() internal view virtual override returns (string memory) {
    return baseTokenURI;
  }

  /// @dev Returns URI for the contract
  function contractURI() public view returns (string memory) {
    return contractURI;
  }

  /// @dev Sets the base token URI prefix.
  function setBaseTokenURI(string memory _baseTokenURI) public onlyOwner {
    baseTokenURI = _baseTokenURI;
  }

  /// @dev Sets the contract URI.
  function setContractURI(string memory _contractURI) public onlyOwner {
    contractURI = _contractURI;
  }

  /// @dev Overridden in order to make it an onlyOwner function
  function withdrawPayments(address payable payee) public override onlyOwner virtual {
      super.withdrawPayments(payee);
  }
}
