{ java_library, java_library_host }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

vogarexpect = java_library {
    name = "vogarexpect";
    host_supported = true;
    srcs = [
        "src/vogar/expect/Expectation.java"
        "src/vogar/expect/ExpectationStore.java"
        "src/vogar/expect/ModeId.java"
        "src/vogar/expect/Outcome.java"
        "src/vogar/expect/Result.java"
        "src/vogar/expect/ResultValue.java"
        "src/vogar/expect/util/Log.java"
        "src/vogar/expect/util/LogOutput.java"
        "src/vogar/expect/util/Strings.java"
    ];

    sdk_version = "current";

    static_libs = [
        "guava"
        "json"
    ];
};

vogarexpectlib = java_library_host {
    name = "vogarexpectlib";
    static_libs = ["vogarexpect"];
};

#  Version of the lib without dependencies statically linked
vogarexpect-no-deps = java_library_host {
    name = "vogarexpect-no-deps";
    srcs = [
        "src/vogar/expect/Expectation.java"
        "src/vogar/expect/ExpectationStore.java"
        "src/vogar/expect/ModeId.java"
        "src/vogar/expect/Outcome.java"
        "src/vogar/expect/Result.java"
        "src/vogar/expect/ResultValue.java"
        "src/vogar/expect/util/Log.java"
        "src/vogar/expect/util/LogOutput.java"
        "src/vogar/expect/util/Strings.java"
    ];

    libs = [
        "guava"
        "json"
    ];
};

in { inherit vogarexpect vogarexpect-no-deps vogarexpectlib; }
