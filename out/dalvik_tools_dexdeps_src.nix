{ droiddoc, droidstubs }:
let

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

dexdeps-doc-stubs = droidstubs {
    name = "dexdeps-doc-stubs";
    srcs = [
        "com/android/dexdeps/ClassRef.java"
        "com/android/dexdeps/DexData.java"
        "com/android/dexdeps/DexDataException.java"
        "com/android/dexdeps/FieldRef.java"
        "com/android/dexdeps/Main.java"
        "com/android/dexdeps/MethodRef.java"
        "com/android/dexdeps/Output.java"
        "com/android/dexdeps/UsageException.java"
    ];
    create_doc_stubs = true;
};

dexdeps-docs = droiddoc {
    name = "dexdeps-docs";
    srcs = [
        ":dexdeps-doc-stubs"
    ];
    custom_template = "droiddoc-templates-sdk";
    create_stubs = false;
};

in { inherit dexdeps-doc-stubs dexdeps-docs; }
