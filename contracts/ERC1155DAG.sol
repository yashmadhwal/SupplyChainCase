pragma solidity ^0.5.0;
import "./ERC1155Mintable.sol";

/**
    @dev DAG extension to ERC1155Mintable.
    Allows the construction of Directed Acyclic Graphs (DAGs), where each node
    is a token that can represent a physical object and its state.
#*/

contract ERC1155DAG is ERC1155Mintable {
    /**
        @notice Get the address of the token.
        @dev
        MUST revert if the token does not exist.
        MUST return a unique address for each token.
        @param _id ID of the token
        @return    The address of the token
    */
    function tokenAddress(uint256 _id) external view returns (address) {
        require(creators[_id] != address(0),
                "ERC1155DAG: the token does not exist");
        // In case of possible overflow, the address will still be valid.
        return address(
            uint256(address(this)) + _id
            ); }

    // tokenSetAddress #=> tokenSet
    mapping (address => uint256[]) internal tokenSets;
    /**
    @dev MUST emit when a new token set is registered.
    */
    event tokenSet(address indexed _tokenSetAddress, uint256[] _tokenSet);
    /**
    @notice Get the address of the token array.
    @dev
    MUST return a unique address for each token array.
    @param _ids Array of token IDs
    @return     The address of the token array
    */
    function _tokenArrayAddress(uint256[] memory _ids) internal view returns (address) {
        return address(uint256(
        bytes32(uint256(address(this))) ^
        keccak256(abi.encode(_ids))
        ));
    }
    /**
    @notice Check if the token array is a valid token set.
    @dev
    MUST revert if there is only one token ID.
    MUST revert if any token ID does not exist.
    MUST revert if the token IDs are not sorted in ascending order.
    MUST revert if the token IDs are not unique.
    @param _ids Array of token IDs
    */

    function _validateTokenSet(uint256[] memory _ids) internal view {
        require(_ids.length > 1, "ERC1155DAG: there is only one token ID");

        for (uint256 i = 0; i < _ids.length; ++i) {
            require(creators[_ids[i]] != address(0),
            "ERC1155DAG: some token ID does not exist");

        if (i > 0) {
            require(_ids[i - 1] < _ids[i], "ERC1155DAG: the token IDs are not sorted or unique");
    }

    }
    }

    /**
    @notice Get the address of the token set.
    @dev
    MUST revert if the token set is invalid.
    MUST return a unique address for each token set.
    IMPORTANT: Any token set MUST be registered before use.
    @param _ids Set of token IDs
    @return     The address of the token set
    #*/

    function tokenSetAddress(uint256[] calldata _ids) external view returns (address) {
        _validateTokenSet(_ids);
        return _tokenArrayAddress(_ids);
    }

    /**
        @notice Register the token set.
        @dev
        MUST revert if the token set is invalid.
        MUST revert if the token set has already been registered.
        MUST revert if registration failed.
        @param _ids Set of token IDs
    */

    function registerTokenSet(uint256[] calldata _ids) external {
        _validateTokenSet(_ids);
        address _account = _tokenArrayAddress(_ids);
        require(tokenSets[_account].length == 0,
                "ERC1155DAG: the token set has already been registered");
        tokenSets[_account] = _ids;
        emit tokenSet(_account, _ids);
    }

    /**
        @notice Get the registered token set that corresponds to the address.
        @dev
        MUST revert if there is no such registered token set.
        @param _account The address to which the registered token set corresponds
        @return         Set of token IDs
#*/
    function getTokenSet(address _account) external view returns (uint256[] memory) {
        require(tokenSets[_account].length != 0,
                "ERC1155DAG: there is no such registered token set");
        return tokenSets[_account];
}
}
