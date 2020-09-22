{ cc_defaults, cc_library_headers, cc_library_static, filegroup }:
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

libinputdispatcher_headers = cc_library_headers {
    name = "libinputdispatcher_headers";
    export_include_dirs = [
        "include"
    ];
};

libinputdispatcher_sources = filegroup {
    name = "libinputdispatcher_sources";
    srcs = [
        "AnrTracker.cpp"
        "Connection.cpp"
        "Entry.cpp"
        "InjectionState.cpp"
        "InputDispatcher.cpp"
        "InputDispatcherFactory.cpp"
        "InputState.cpp"
        "InputTarget.cpp"
        "Monitor.cpp"
        "TouchState.cpp"
    ];
};

libinputdispatcher_defaults = cc_defaults {
    name = "libinputdispatcher_defaults";
    srcs = [":libinputdispatcher_sources"];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "libinput"
        "liblog"
        "libstatslog"
        "libui"
        "libutils"
    ];
    header_libs = [
        "libinputdispatcher_headers"
    ];
};

libinputdispatcher = cc_library_static {
    name = "libinputdispatcher";
    defaults = [
        "inputflinger_defaults"
        "libinputdispatcher_defaults"
    ];
    shared_libs = [
        #  This should consist only of dependencies from inputflinger. Other dependencies should be
        #  in cc_defaults so that they are included in the tests.
        "libinputreporter"
        "libinputflinger_base"
    ];
    export_header_lib_headers = [
        "libinputdispatcher_headers"
    ];
};

in { inherit libinputdispatcher libinputdispatcher_defaults libinputdispatcher_headers libinputdispatcher_sources; }