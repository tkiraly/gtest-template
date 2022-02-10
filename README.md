# Intro

C project template with makefile and google test

# install google test

source: [google test wiki](https://github.com/google/googletest/blob/main/googletest/README.md#build-with-cmake)

```bash
git clone https://github.com/google/googletest.git -b release-1.11.0
cd googletest
mkdir build
cd build
cmake ..
make -j4
sudo make install
```
