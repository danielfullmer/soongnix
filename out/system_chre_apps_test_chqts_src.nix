{ cc_test_host }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

#  While it's arguably overkill to have unit test for our testing code,
#  this testing code runs under an embedded environment which is much more
#  difficult to test.  To the extent that we have platform-independent
#  code here, it seems a long-term time saver to have Linux tests for
#  what we can easily test.

nanoapp_chqts_shared_tests = cc_test_host {
    name = "nanoapp_chqts_shared_tests";

    srcs = [
        #  Files under test
        "shared/dumb_allocator.cc"
        "shared/nano_endian.cc"
        "shared/nano_string.cc"

        #  Testing source
        "shared/dumb_allocator_test.cc"
        "shared/nano_endian_be_test.cc"
        "shared/nano_endian_le_test.cc"
        "shared/nano_endian_test.cc"
        "shared/nano_string_test.cc"
    ];

    cppflags = [
        "-Wall"
        "-Wextra"
        "-Werror"

        "-DINTERNAL_TESTING"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit nanoapp_chqts_shared_tests; }
