{ art_cc_library }:
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

libartbenchmark = art_cc_library {
    name = "libartbenchmark";
    host_supported = true;
    defaults = ["art_defaults"];
    srcs = [
        "jni_loader.cc"
        "jobject-benchmark/jobject_benchmark.cc"
        "jni-perf/perf_jni.cc"
        "micro-native/micro_native.cc"
        "scoped-primitive-array/scoped_primitive_array.cc"
    ];
    shared_libs = [
        "libart"
        "libbacktrace"
        "libbase"
        "libnativehelper"
    ];
    cflags = [
        "-Wno-frame-larger-than="
    ];
};

libartbenchmark-micronative-host = art_cc_library {
    name = "libartbenchmark-micronative-host";
    host_supported = true;
    device_supported = false;
    defaults = [
        "art_debug_defaults"
        "art_defaults"
    ];
    srcs = [
        "jni_loader.cc"
        "micro-native/micro_native.cc"
    ];
    shared_libs = [
    ];
    static_libs = [
    ];
    header_libs = ["jni_headers"];
    stl = "libc++_static";
    cflags = [
        "-Wno-frame-larger-than="
    ];
};

in { inherit libartbenchmark libartbenchmark-micronative-host; }
