{ cc_library_shared }:
let

#
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

libperfettocts_heapprofdtarget = cc_library_shared {
    name = "libperfettocts_heapprofdtarget";
    srcs = [
        "target.cc"
    ];
    static_libs = [
        "perfetto_cts_jni_deps"
    ];
    shared_libs = [
        "libandroid"
        "liblog"
        "libnativehelper_compat_libc++"
    ];
    compile_multilib = "both";
    stl = "libc++_static";
};

in { inherit libperfettocts_heapprofdtarget; }
