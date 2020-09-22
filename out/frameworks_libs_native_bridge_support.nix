{ cc_defaults }:
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

native_bridge_stub_library_defaults = cc_defaults {
    name = "native_bridge_stub_library_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wover-aligned"
        "-Wunused"
    ];

    shared_libs = [
        "libnative_bridge_vdso"
    ];

    #  TODO(b/24465209): keep stub libraries old loader-compatible.
    ldflags = [
        "-Wl,--hash-style=both"
    ];
    pack_relocations = false;

    enabled = false;
    target = {
        native_bridge = {
            enabled = true;
        };
    };

    native_bridge_supported = true;
    compile_multilib = "both";
};

in { inherit native_bridge_stub_library_defaults; }
