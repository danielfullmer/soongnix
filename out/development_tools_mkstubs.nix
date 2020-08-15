{ java_library_host }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

mkstubs = java_library_host {
    name = "mkstubs";
    srcs = [
        "src/com/android/mkstubs/AsmAnalyzer.java"
        "src/com/android/mkstubs/Filter.java"
        "src/com/android/mkstubs/FilterClassAdapter.java"
        "src/com/android/mkstubs/Main.java"
        "src/com/android/mkstubs/SourceGenerator.java"
        "src/com/android/mkstubs/StubGenerator.java"
        "src/com/android/mkstubs/sourcer/AccessSourcer.java"
        "src/com/android/mkstubs/sourcer/AnnotationSourcer.java"
        "src/com/android/mkstubs/sourcer/ClassSourcer.java"
        "src/com/android/mkstubs/sourcer/FieldSourcer.java"
        "src/com/android/mkstubs/sourcer/MethodSourcer.java"
        "src/com/android/mkstubs/sourcer/Output.java"
        "src/com/android/mkstubs/sourcer/SignatureSourcer.java"
        "src/com/android/mkstubs/stubber/ClassStubber.java"
        "src/com/android/mkstubs/stubber/MethodStubber.java"
    ];
    manifest = "manifest.txt";
    static_libs = ["asm-5.2"];
};

in { inherit mkstubs; }
