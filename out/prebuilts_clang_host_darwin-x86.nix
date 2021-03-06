{ llvm_darwin_filegroup }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

#  -----------------------------------------------------------------------------
#  Export shared libraries for host tools (libLLVM, libclang, libc++) in a
#  filegroup.  These are exported only when the LLVM_BUILD_HOST_TOOLS
#  environment variable is set.
#  -----------------------------------------------------------------------------

libLLVM_darwin = llvm_darwin_filegroup {
    name = "libLLVM_darwin";
};

libclang_cxx_darwin = llvm_darwin_filegroup {
    name = "libclang_cxx_darwin";
};

"libc++_darwin" = llvm_darwin_filegroup {
    name = "libc++_darwin";
};

"libc++abi_darwin" = llvm_darwin_filegroup {
    name = "libc++abi_darwin";
};

in { inherit "libc++_darwin" "libc++abi_darwin" libLLVM_darwin libclang_cxx_darwin; }
