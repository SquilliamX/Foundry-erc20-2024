// // SPDX-License-Identifier: MIT

// pragma solidity 0.8.19;

// // in order to create an ERC-20, it needs to have all the functions that the ERC20 token standard has.
// // you can read more about this @https://eips.ethereum.org/EIPS/eip-20

// contract ManualToken {
//     // maps address to a number and this mapping is named balances
//     mapping(address => uint256) private s_balances; // people(addresses) are assigned to their amount of this token(uint256)

//     function name() public pure returns (string memory) {
//         return "Manual Token"; // name of our token is "Manual Token"
//     }

//     function totalSupply() public pure returns (uint256) {
//         return 100 ether; // total supply of tokens.
//     }

//     function decimals() public pure returns (uint8) {
//         return 18; // the amount of decimals in our token
//     }

//     function balanceOf(address _owner) public view returns (uint256) {
//         return s_balances[_owner]; // mapping s_balances maps address that is inputted to the amount the address has
//     }

//     function transfer(address _to, uint256 _amount) public {
//         // the sum of the balance of the msg.sender and the balance of the receiver is saved in a variable named previousBalances.
//         uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
//         // the balance of the msg.sender is reduced by the amount he is sending
//         s_balances[msg.sender] -= _amount;
//         // the balance of the receiver is increased by the amount that is being sent
//         s_balances[_to] += _amount;
//         // require that the sume of the amount held by the sender and the receiver is equal to the the amount it was before. This should be true because no money should be lost in the transaction, only moved around, therefore the sum of these balances should be the same
//         require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
//     }
// }
