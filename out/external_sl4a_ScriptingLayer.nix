{ java_library }:
let

#
#   Copyright (C) 2016 Google, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at:
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

"sl4a.ScriptingLayer" = java_library {
    name = "sl4a.ScriptingLayer";
    owner = "google";

    static_libs = [
        "guava"
        "android-common"

        "sl4a.Utils"
        "sl4a.Common"
    ];

    srcs = [
        "src/com/googlecode/android_scripting/AndroidProxy.java"
        "src/com/googlecode/android_scripting/ScriptLauncher.java"
        "src/com/googlecode/android_scripting/ScriptProcess.java"
        "src/com/googlecode/android_scripting/ScriptStorageAdapter.java"
        "src/com/googlecode/android_scripting/facade/FacadeConfiguration.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterProcess.java"
        "src/com/googlecode/android_scripting/trigger/EventGenerationControllingObserver.java"
    ];
};

in { inherit "sl4a.ScriptingLayer"; }
