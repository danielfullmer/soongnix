{ cc_test }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

gatekeeperd-unit-tests = cc_test {
    name = "gatekeeperd-unit-tests";

    cflags = [
        "-g"
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
    ];
    shared_libs = [
        "libgatekeeper"
        "libcrypto"
        "libbase"
    ];
    static_libs = ["libscrypt_static"];
    include_dirs = ["external/scrypt/lib/crypto"];
    srcs = ["gatekeeper_test.cpp"];
};

in { inherit gatekeeperd-unit-tests; }
