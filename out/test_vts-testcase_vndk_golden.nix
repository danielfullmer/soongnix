{ genrule, python_binary_host }:
let

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

extract_lsdump = python_binary_host {
    name = "extract_lsdump";
    main = "extract_lsdump.py";
    srcs = ["extract_lsdump.py"];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

#  TODO(b/150663999): Replace with gensrcs when the build system is able to
#                     process the large file group.
vts_vndk_abi_dump_zip = genrule {
    name = "vts_vndk_abi_dump_zip";
    tools = ["extract_lsdump"];
    cmd = "$(location extract_lsdump) $(in) $(out)";
    srcs = [":vndk_abi_dump_zip"];
    out = ["vts/testcases/vndk/abi_dump.zip"];
};

in { inherit extract_lsdump vts_vndk_abi_dump_zip; }
