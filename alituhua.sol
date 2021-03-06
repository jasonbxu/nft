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

  /// @dev reserving the following Token IDs
  constructor() ERC721("阿里土话", "ALI") {
    baseTokenURI = "";
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 2);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 3);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 23);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 26);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 27);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 38);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 39);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 41);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 60);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 74);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 85);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 103);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 107);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 109);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 113);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 114);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 115);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 120);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 121);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 124);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 132);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 143);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 144);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 147);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 158);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 161);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 168);
    _safeMint(0x22C2E91f7fd0B7DECB53D7F10aFebd95CC08779a, 169);
  }

  /// @dev Since some token IDs are reserved, need to skip them when minting
  function mintTo(address recipient) public payable returns (uint256) {
    uint256 tokenId = currentTokenId.current();
    require(tokenId < TOTAL_SUPPLY, "Max supply reached");

    currentTokenId.increment();
    uint256 newItemId = currentTokenId.current();

    /// @dev Checks if item has already been minted, if so, recursively mint again
    if(_exists(newItemID) {
    return mintTo(recipient);
    }
    else {
    _safeMint(recipient, newItemId);
    return newItemId;
    }
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
