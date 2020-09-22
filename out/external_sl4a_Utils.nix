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

"sl4a.Utils" = java_library {
    name = "sl4a.Utils";
    owner = "google";
    static_libs = [
        "guava"
        "android-common"
    ];
    srcs = [
        "src/com/googlecode/android_scripting/ConvertUtils.java"
        "src/com/googlecode/android_scripting/FileUtils.java"
        "src/com/googlecode/android_scripting/ForegroundService.java"
        "src/com/googlecode/android_scripting/IoUtils.java"
        "src/com/googlecode/android_scripting/Log.java"
        "src/com/googlecode/android_scripting/MainThread.java"
        "src/com/googlecode/android_scripting/NotificationIdFactory.java"
        "src/com/googlecode/android_scripting/SimpleServer.java"
        "src/com/googlecode/android_scripting/SingleThreadExecutor.java"
        "src/com/googlecode/android_scripting/exception/Sl4aException.java"
        "src/com/googlecode/android_scripting/future/FutureResult.java"
        "src/com/googlecode/android_scripting/interpreter/ExternalClassLoader.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterConstants.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterDescriptor.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterPropertyNames.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterUtils.java"
        "src/com/trilead/ssh2/StreamGobbler.java"
    ];
};

in { inherit "sl4a.Utils"; }
