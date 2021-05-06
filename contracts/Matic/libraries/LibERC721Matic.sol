// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

library LibERC721Matic {

  struct ERC721Storage {
    // Token name
    string  _name;

    // Token symbol
    string  _symbol;

    // Mapping from token ID to owner address
    mapping (uint256 => address)  _owners;

    // Mapping owner address to token count
    mapping (address => uint256)  _balances;

    // Mapping from token ID to approved address
    mapping (uint256 => address)  _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping (address => mapping (address => bool))  _operatorApprovals;

    // Base URI for all tokens
    string _baseURI;

    uint256 _totalSupply;

    // Mapping from owner to list of owned token IDs
    mapping(address => mapping(uint256 => uint256)) _ownedTokens;

    // Mapping from token ID to index of the owner tokens list
    mapping(uint256 => uint256) _ownedTokensIndex;

    // Mapping from token ID to memo
    mapping (uint256 => string) _shroomName;
    // Mapping from token ID to memo
    mapping (uint256 => string) _shroomMemo;

    // Sale specific variables
    uint256 _saleCurrentIndex;
    uint256 _saleCapIndex;
    mapping (uint256 => uint256) _shroomBirthDate;

    // Matic specific variables
    mapping (uint256 => bool) withdrawnTokens;

    address childChainManagerProxy;
  }


  function getERC721Storage() internal pure returns (ERC721Storage storage e721s) {
    assembly {
      e721s.slot := 0
    }
  }

}