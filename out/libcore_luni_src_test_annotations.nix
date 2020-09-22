{ java_library }:
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

#  Build this separately with the --intermediate flag to preserve class
#  retention annotations which are otherwise removed by the dexer.
#
#  Included as a resource by //libcore:core-tests and loaded into its own
#  class loader by libcore.java.lang.reflect.annotations.RetentionPolicyTest.
annotations-test = java_library {
    name = "annotations-test";
    visibility = [
        "//libcore"
    ];
    compile_dex = true;
    srcs = [
        "src/libcore/tests/annotations/ClassRetentionAnnotation.java"
        "src/libcore/tests/annotations/RetentionAnnotations.java"
        "src/libcore/tests/annotations/RuntimeRetentionAnnotation.java"
        "src/libcore/tests/annotations/SourceRetentionAnnotation.java"
    ];
    sdk_version = "core_platform";
    dxflags = ["--intermediate"];
};

in { inherit annotations-test; }
