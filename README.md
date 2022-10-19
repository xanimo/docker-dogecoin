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
*Also note that the branch is modeled around `1.14.7-dev` so either clone your fork and be checked out to the right branch you want or configure in `scripts/build` prior to your first run*

