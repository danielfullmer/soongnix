{ cc_binary, cc_defaults, sh_binary }:
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
        "-DANDROID_BASE_UNIQUE_FD_DISABLE_IMPLICIT_CONVERSION=1"
    ];
    shared_libs = [
        "libbase"
        "libprocessgroup"
    ];
    static_libs = ["liblog"];
    logtags = ["event.logtags"];
};

logcat = cc_binary {
    name = "logcat";

    defaults = ["logcat_defaults"];
    srcs = [
        "logcat.cpp"
    ];
};

logcatd = sh_binary {
    name = "logcatd";
    src = "logcatd";
};

"logpersist.start" = sh_binary {
    name = "logpersist.start";
    src = "logpersist";
    init_rc = ["logcatd.rc"];
    required = ["logcatd"];
    symlinks = [
        "logpersist.stop"
        "logpersist.cat"
    ];
};

in { inherit "logpersist.start" logcat logcat_defaults logcatd; }
