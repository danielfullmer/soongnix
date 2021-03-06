{ art_cc_library, cc_defaults, cc_library_headers }:
let

#
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

libopenjdkjvmti_headers = cc_library_headers {
    name = "libopenjdkjvmti_headers";
    host_supported = true;
    export_include_dirs = ["include"];
    sdk_version = "current";
};

libopenjdkjvmti_defaults = cc_defaults {
    name = "libopenjdkjvmti_defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "deopt_manager.cc"
        "events.cc"
        "fixed_up_dex_file.cc"
        "object_tagging.cc"
        "OpenjdkJvmTi.cc"
        "ti_allocator.cc"
        "ti_breakpoint.cc"
        "ti_class.cc"
        "ti_class_definition.cc"
        "ti_class_loader.cc"
        "ti_ddms.cc"
        "ti_dump.cc"
        "ti_extension.cc"
        "ti_field.cc"
        "ti_heap.cc"
        "ti_jni.cc"
        "ti_logging.cc"
        "ti_method.cc"
        "ti_monitor.cc"
        "ti_object.cc"
        "ti_phase.cc"
        "ti_properties.cc"
        "ti_search.cc"
        "ti_stack.cc"
        "ti_redefine.cc"
        "ti_thread.cc"
        "ti_threadgroup.cc"
        "ti_timers.cc"
        "transform.cc"
    ];
    header_libs = [
        "libnativehelper_header_only"
        "libopenjdkjvmti_headers"
    ];
    shared_libs = [
        "libbase"
    ];
};

libopenjdkjvmti = art_cc_library {
    name = "libopenjdkjvmti";
    defaults = ["libopenjdkjvmti_defaults"];
    shared_libs = [
        "libart"
        "libart-compiler"
        "libart-dexlayout"
        "libdexfile"
        "libartbase"
    ];
};

libopenjdkjvmtid = art_cc_library {
    name = "libopenjdkjvmtid";
    defaults = [
        "art_debug_defaults"
        "libopenjdkjvmti_defaults"
    ];
    shared_libs = [
        "libartd"
        "libartd-compiler"
        "libartd-dexlayout"
        "libdexfiled"
        "libartbased"
    ];
};

in { inherit libopenjdkjvmti libopenjdkjvmti_defaults libopenjdkjvmti_headers libopenjdkjvmtid; }
