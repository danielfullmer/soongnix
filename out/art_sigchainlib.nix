{ art_cc_test, cc_library, cc_library_static, filegroup }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

libsigchain = cc_library {
    name = "libsigchain";

    host_supported = true;
    defaults = ["art_defaults"];
    target = {
        linux = {
            shared = {
                srcs = ["sigchain_dummy.cc"];
            };
            static = {
                srcs = ["sigchain.cc"];
            };
        };

        darwin = {
            srcs = ["sigchain_dummy.cc"];
        };

        android = {
            whole_static_libs = ["libasync_safe"];
        };
    };
};

#  Create a dummy version of libsigchain which expose the necessary symbols
#  but throws when called. This can be used to get static binaries which don't
#  need the real functionality of the sig chain but need to please the linker.
libsigchain_dummy = cc_library_static {
    name = "libsigchain_dummy";
    host_supported = true;
    defaults = ["art_defaults"];
    srcs = ["sigchain_dummy.cc"];
    target = {
        android = {
            whole_static_libs = ["libasync_safe"];
        };
    };
};

art_sigchain_tests = art_cc_test {
    name = "art_sigchain_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = ["sigchain_test.cc"];
    whole_static_libs = ["libsigchain"];
};

"art_sigchain_version_script32.txt" = filegroup {
    name = "art_sigchain_version_script32.txt";
    srcs = ["version-script32.txt"];
};

"art_sigchain_version_script64.txt" = filegroup {
    name = "art_sigchain_version_script64.txt";
    srcs = ["version-script64.txt"];
};

in { inherit "art_sigchain_version_script32.txt" "art_sigchain_version_script64.txt" art_sigchain_tests libsigchain libsigchain_dummy; }
