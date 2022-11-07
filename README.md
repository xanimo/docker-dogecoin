# docker-dogecoin

Please inspect the build script found in `scripts/build` and adjust accordingly to suit your needs.

##### available host triplets
 - aarch64-linux-gnu
 - arm-linux-gnueabihf
 - i686-pc-linux-gnu
 - i686-w64-mingw32
 - x86_64-apple-darwin11
 - x86_64-pc-linux-gnu
 - x86_64-w64-mingw32

To get started ensure you have docker installed and started and then execute:
```
./scripts/build --host=<triplet>
```
*Also note that this branch and set of scripts is modeled around `1.14.7-dev` so either clone your `/dogecoin` fork and be checked out to the right branch you want or configure in `scripts/build` prior to your first run*

https://github.com/bitcoin/bitcoin/commit/a6099ef319a73e2255dca77065600abb22c4f5f8
https://github.com/bitcoin/bitcoin/commit/abe7b3d3abe10e3554b770f40824174b3b217490
https://github.com/bitcoin/bitcoin/commit/2754ef1c4a8cd7415f9ac2d3660ce6e4545b2754 qt tests
https://github.com/bitcoin/bitcoin/commit/9e6817ed1146a340543de96b36d9eaee5d5ced7d qt

https://github.com/bitcoin/bitcoin/commit/9350e13396b3624b81ce9fb8dd3bf194ec6e2c4d logs
https://github.com/bitcoin/bitcoin/commit/b9f930b383480a443fea5e89cb972265690962af qt tests
https://github.com/bitcoin/bitcoin/commit/a387d3a807f86cbe97a3ed8c073ee34eb1d5dbb1 qt
https://github.com/bitcoin/bitcoin/commit/9c7b7cf0bb579714b35f7c88db20a407dfc716bd qt
https://github.com/bitcoin/bitcoin/commit/3d857f307be8712b9b251e770d8425717409654b import multi watch address
https://github.com/bitcoin/bitcoin/commit/63d66ba20a634b54f6d5e8b051fb4a106f2cef6c shift from qa to tests dir
https://github.com/bitcoin/bitcoin/commit/d5046e72f4180b7932368919ae08da24be8e9583 qt stuff
https://github.com/bitcoin/bitcoin/commit/b5bec4e330fc7201d989663b4dbc6a1e620dd0f9 qt stuff

https://github.com/bitcoin/bitcoin/commit/79df9df3482d71391dee1dd59054aed8f7bbfa6b bip38

https://github.com/bitcoin/bitcoin/commit/71afe3c0995592ff17968816a833a8ed3ce05bf2 backup

Bugfix: ancestor modifed fees were incorrect for descendants
@sdaftuar
sdaftuar committed on Apr 3, 2017

Test prioritisetransaction and ancestor fee state
@sdaftuar
sdaftuar committed on Apr 3, 2017

Merge #10123: Allow debug logs to be excluded from specified component
@laanwj
laanwj committed on Apr 3, 2017

Run bitcoin_test-qt under minimal QPA platform
@ryanofsky
ryanofsky committed on Apr 3, 2017



Add -debugexclude option to switch off logging for specified components
@jnewbery
jnewbery committed on Apr 3, 2017
Merge #10144: Prioritisetransaction wasn't always updating ancestor fee
@laanwj
laanwj committed on Apr 4, 2017

Merge #10133: Clean up calculations of pcoinsTip memory usage
@laanwj
laanwj committed on Apr 4, 2017

Merge #10104: linearize script: Option to use RPC cookie
@laanwj
laanwj committed on Apr 4, 2017

init: Remove redundant logging code
@MarcoFalke
MarcoFalke committed on Apr 4, 2017

logging: Fix off-by-one for shrinkdebugfile
@MarcoFalke
MarcoFalke committed on Apr 4, 2017

Merge #10152: [trivial] remove unused line in Travis config
@MarcoFalke
MarcoFalke committed on Apr 4, 2017

Remove accidental trailing semicolons
@practicalswift
practicalswift committed on Apr 4, 2017

Remove unused import
@practicalswift
practicalswift committed on Apr 4, 2017

initialize flag variable to 0 (and continue if GetLogCategory() fails)
@jnewbery
jnewbery committed on Apr 4, 2017

[trivial] remove unused line in Travis config
@jnewbery
jnewbery committed on Apr 4, 2017

Merge #10146: Better error handling for submitblock
@laanwj
laanwj committed on Apr 4, 2017


[tests] color test results and sort alphabetically
@jnewbery
jnewbery committed on Apr 5, 2017


doc: Update release process for simplified version bumping
@laanwj
laanwj committed on Apr 6, 2017

build: Remove duplicate version information from src/clientversion.h
@laanwj
laanwj committed on Apr 6, 2017


Log calls to getblocktemplate
@jnewbery
jnewbery committed on Apr 6, 2017


[tests] Add unicode symbols for tests passing/failing/skipping
@jnewbery
jnewbery committed on Apr 6, 2017
Merge #9902: Lightweight abstraction of boost::filesystem IMPORTANT
@laanwj
laanwj committed on Apr 6, 2017
MOVEONLY: tx functions to consensus/tx_verify.o
@jtimon
jtimon committed on Apr 6, 2017
461e49fee2935b1eb4d4ea7bae3023e655c0a6d8
SyncTransaction->TxAddedToMempool/BlockConnected/Disconnected
@TheBlueMatt
TheBlueMatt committed on Apr 7, 2017

53e2aafead (HEAD -> 1.14.7-dev-net) HEAD@{0}: reset: moving to 53e2aafeada5509fe3628cc5d8fa4df12f6f6b69
53e2aafead (HEAD -> 1.14.7-dev-net) HEAD@{1}: cherry-pick: Add specialization of SipHash for 256 + 32 bit data
6453ef0403 HEAD@{2}: cherry-pick: Introduce CHashVerifier to hash read data
bc58ea2611 (origin/1.14.7-dev-net) HEAD@{3}: reset: moving to bc58ea26112b9a49886079bc03d4a094fcd5dfc5
bc58ea2611 (origin/1.14.7-dev-net) HEAD@{4}: rebase (continue) (finish): returning to refs/heads/1.14.7-dev-net
bc58ea2611 (origin/1.14.7-dev-net) HEAD@{5}: rebase (continue) (pick): Merge READWRITEMANY into READWRITE