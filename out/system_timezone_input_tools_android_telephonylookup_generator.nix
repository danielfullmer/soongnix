{ java_binary_host, java_library_host, java_test_host }:
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

#  Proto library
telephonylookupprotos = java_library_host {
    name = "telephonylookupprotos";
    proto = {
        type = "full";
        include_dirs = ["external/protobuf/src"];
    };

    srcs = ["src/main/proto/telephony_lookup_proto_file.proto"];
};

#  The telephonylookup_generator host tool.
telephonylookup_generator = java_binary_host {
    name = "telephonylookup_generator";

    main_class = "com.android.libcore.timezone.telephonylookup.TelephonyLookupGenerator";
    srcs = [
        "src/main/java/com/android/libcore/timezone/telephonylookup/TelephonyLookupGenerator.java"
        "src/main/java/com/android/libcore/timezone/telephonylookup/TelephonyLookupProtoFileSupport.java"
        "src/main/java/com/android/libcore/timezone/telephonylookup/TelephonyLookupXmlFile.java"
    ];
    static_libs = [
        "icu4j"
        "libprotobuf-java-full"
        "telephonylookupprotos"
        "tztools_common"
    ];
};

#  Tests for the telephonylookup_generator host tool.
telephonylookup_generator_tests = java_test_host {
    name = "telephonylookup_generator_tests";

    srcs = ["src/test/java/com/android/libcore/timezone/telephonylookup/TelephonyLookupGeneratorTest.java"];
    static_libs = [
        "junit"
        "telephonylookup_generator"
        "tztools_common_testing"
    ];
};

in { inherit telephonylookup_generator telephonylookup_generator_tests telephonylookupprotos; }
