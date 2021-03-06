{ cc_binary, cc_defaults, cc_prebuilt_binary }:
let

#
#  Copyright (C) 2006 The Android Open Source Project
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

logcat_defaults = cc_defaults {
    name = "logcat_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libpcrecpp"
        "libprocessgroup"
    ];
    static_libs = ["liblog"];
    logtags = ["event.logtags"];
};

logcat = cc_binary {
    name = "logcat";

    defaults = ["logcat_defaults"];
    srcs = [
        "logcat_main.cpp"
        "logcat.cpp"
    ];
};

logcatd = cc_binary {
    name = "logcatd";

    defaults = ["logcat_defaults"];
    srcs = [
        "logcatd_main.cpp"
        "logcat.cpp"
    ];
};

"logpersist.start" = cc_prebuilt_binary {
    name = "logpersist.start";
    srcs = ["logpersist"];
    init_rc = ["logcatd.rc"];
    required = ["logcatd"];
    symlinks = [
        "logpersist.stop"
        "logpersist.cat"
    ];
    strip = {
        none = true;
    };
};

in { inherit "logpersist.start" logcat logcat_defaults logcatd; }
