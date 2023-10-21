# clo-chain

A blockchain written in clojure

(for learning clojure and basics of blockchains)


## Installation

N/A

## Usage

N/A

## Options

N/A

## Examples

...

### Bugs

...

### Any Other Sections
### That You Think
### Might be Useful

## License

Copyright © 2023 FIXME

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.


### Notes

Components:

- Block: once a transaction occurs, it is propagated through the network and added to the blockchain if there's a consensus. Can choose what is on blockchain.
- Block Linking: Once a block is full a new block is generated, links back to previous block. New block has a hash as id based on transaction (like checksum). Forms a chain.
- Adding to Chain: All transactions are blocked together in fixed fashion to form the blockchain.
- Consensus Mechanism: Method of verifying a block: Proof of Work, Proof of Stake, Byzantine fault-tolerant, Deposit-based consensus, Proof of History
- Blockchain Nodes: 

Configurations:
- Permissions
- Key management
- Block signatures
- etc.

Usage:
- Keeping track of transactions in a cryptographically secure way. Can attach cryptocurrencies, assets, etc.
- Transparency of members in network, reduced risk of fraud, increased speed and efficiency.

The blockchain trilemma:
- Decentralization: through consensus, tradeoff of taking time to reach consensus.
- Scalability: tradeoff speed as block sizes grow. Blockchain: 1mb blocksize, but each coin can generate infinite number of transactions, each transaction increasing size of each block, so blocks could exceed any size limitations on them.
- Security: always a concern.


