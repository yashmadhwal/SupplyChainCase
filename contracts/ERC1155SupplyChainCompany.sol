pragma solidity ^0.5.0;
import "./ERC1155DAG.sol";

contract ERC1155SupplyChainCompany is ERC1155DAG {
    // Company name
    string private _name;
    constructor (string memory name) public {
        _name = name;
}
    function name() public view returns (string memory) {
        return _name;
}

}
