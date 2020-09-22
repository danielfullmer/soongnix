{ }:
let

libcxx_includes = [
    "current/sources/cxx-stl/llvm-libc++/include"
    "current/sources/cxx-stl/llvm-libc++abi/include"
];

#  libandroid_support headers are exported by libc++ rather than by
#  libandroid_support itself because it's the only way we can enforce the
#  correct ordering of the includes (libc++ first, libandroid_support
#  second).

#  The LLVM libunwind unwinder. This unwinder is only used for arm32.

in { }
