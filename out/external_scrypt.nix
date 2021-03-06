{ cc_library_static, cc_test }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

build = ["sources.bp"];

libscrypt_static = cc_library_static {
    name = "libscrypt_static";
    defaults = ["libscrypt_sources"];
    shared_libs = ["libcrypto"];
    sdk_version = "17";
    host_supported = true;
    vendor_available = true;
};

scrypt_test = cc_test {
    name = "scrypt_test";
    srcs = ["tests/scrypt_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libcrypto"];
    static_libs = ["libscrypt_static"];
};

in { inherit libscrypt_static scrypt_test; }
