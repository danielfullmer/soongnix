{ java_defaults, java_library, java_library_static }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

#  For platform use, builds directly against core-libart to avoid circular
#  dependencies. *NOT* for unbundled use.
libphonenumber-platform = java_library_static {
    name = "libphonenumber-platform";

    #  For the platform, compile everything except the carrier to phone number
    #  which isn't used.
    java_resource_dirs = [
        "repackaged/libphonenumber/src"
        "repackaged/geocoder/src"
        "repackaged/internal/prefixmapper/src"
    ];

    srcs = [
        "repackaged/libphonenumber/src/**/*.java"
        "repackaged/geocoder/src/**/*.java"
        "repackaged/internal/prefixmapper/src/**/*.java"
    ];

    no_framework_libs = true;
};

libphonenumber-unbundled-defaults = java_defaults {
    name = "libphonenumber-unbundled-defaults";
    java_resource_dirs = [
        "libphonenumber/src"
        "carrier/src"
        "internal/prefixmapper/src"
    ];

    srcs = [
        "libphonenumber/src/**/*.java"
        "carrier/src/**/*.java"
        "internal/prefixmapper/src/**/*.java"
    ];
};

#  For unbundled use, supports gingerbread and up.
libphonenumber = java_library_static {
    name = "libphonenumber";
    defaults = ["libphonenumber-unbundled-defaults"];

    srcs = ["geocoder/src/**/*.java"];
    java_resource_dirs = ["geocoder/src"];

    sdk_version = "9";
    java_version = "1.7";
};

#  For unbundled use - without geocoder
libphonenumber-nogeocoder = java_library_static {
    name = "libphonenumber-nogeocoder";
    defaults = ["libphonenumber-unbundled-defaults"];

    sdk_version = "9";
    java_version = "1.7";
};

#  Tests for unbundled use.
#  vogar --timeout 0  \
#     --classpath out/target/common/obj/JAVA_LIBRARIES/libphonenumber-test_intermediates/classes.jack \
#     com.google.i18n.phonenumbers
libphonenumber_test = java_library {
    name = "libphonenumber_test";
    srcs = [
        "carrier/test/**/*.java"
        "geocoder/test/**/*.java"
        "internal/prefixmapper/test/**/*.java"
        "libphonenumber/test/**/*.java"
    ];

    java_resource_dirs = [
        "carrier/test"
        "geocoder/test"
        "libphonenumber/test"
    ];

    sdk_version = "current";
    static_libs = [
        "libphonenumber"
        "junit"
    ];
    java_version = "1.7";
};

in { inherit libphonenumber libphonenumber-nogeocoder libphonenumber-platform libphonenumber-unbundled-defaults libphonenumber_test; }
