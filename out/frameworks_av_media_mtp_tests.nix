{ cc_test }:
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

mtp_ffs_handle_test = cc_test {
    name = "mtp_ffs_handle_test";
    test_suites = ["device-tests"];
    srcs = ["MtpFfsHandle_test.cpp"];
    shared_libs = [
        "libbase"
        "libmtp"
        "liblog"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

posix_async_io_test = cc_test {
    name = "posix_async_io_test";
    test_suites = ["device-tests"];
    srcs = ["PosixAsyncIO_test.cpp"];
    shared_libs = [
        "libbase"
        "libmtp"
        "liblog"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

in { inherit mtp_ffs_handle_test posix_async_io_test; }
