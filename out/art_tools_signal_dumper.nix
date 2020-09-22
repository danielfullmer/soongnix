{ art_cc_binary, cc_defaults }:
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

signal_dumper_libbase_static_deps = cc_defaults {
    name = "signal_dumper_libbase_static_deps";
    static_libs = ["liblog"];
};

signal_dumper_libunwindstack_static_deps = cc_defaults {
    name = "signal_dumper_libunwindstack_static_deps";
    defaults = ["signal_dumper_libbase_static_deps"];
    static_libs = [
        "libbase"
        "libdexfile_support_static"
        "liblog"
        "liblzma"
    ];
};

signal_dumper_libbacktrace_static_deps = cc_defaults {
    name = "signal_dumper_libbacktrace_static_deps";
    defaults = [
        "signal_dumper_libbase_static_deps"
        "signal_dumper_libunwindstack_static_deps"
    ];
    static_libs = [
        "libbase"
        "libunwindstack"
    ];
};

signal_dumper = art_cc_binary {
    name = "signal_dumper";

    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    device_supported = true;

    defaults = [
        "art_defaults"
        "signal_dumper_libbacktrace_static_deps"
        "signal_dumper_libbase_static_deps"
    ];

    srcs = ["signal_dumper.cc"];

    static_libs = [
        "libbacktrace"
        "libbase"
    ];
};

in { inherit signal_dumper signal_dumper_libbacktrace_static_deps signal_dumper_libbase_static_deps signal_dumper_libunwindstack_static_deps; }
