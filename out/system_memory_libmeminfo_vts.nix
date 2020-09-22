{ cc_defaults, cc_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

vts_meminfo_defaults = cc_defaults {
    name = "vts_meminfo_defaults";
    defaults = ["libmeminfo_defaults"];
    srcs = ["vts_meminfo_test.cpp"];
    static_libs = ["libmeminfo"];
};

vts_meminfo_test = cc_test {
    name = "vts_meminfo_test";
    defaults = ["vts_meminfo_defaults"];
};

vts_core_meminfo_test = cc_test {
    name = "vts_core_meminfo_test";
    defaults = ["vts_meminfo_defaults"];
    test_suites = ["vts"];
    require_root = true;
    auto_gen_config = true;
    test_min_api_level = 29;
};

in { inherit vts_core_meminfo_test vts_meminfo_defaults vts_meminfo_test; }
