{ cc_library_host_static, cc_test_host }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

chre_chpp_linux = cc_library_host_static {
    name = "chre_chpp_linux";
    srcs = [
        "transport.c"
        "platform/linux/memory.c"
    ];
    export_include_dirs = [
        "platform/linux/include"
        "include"
    ];
};

chre_chpp_linux_tests = cc_test_host {
    name = "chre_chpp_linux_tests";
    srcs = ["test/transport_test.cpp"];
    static_libs = ["chre_chpp_linux"];
};

in { inherit chre_chpp_linux chre_chpp_linux_tests; }
