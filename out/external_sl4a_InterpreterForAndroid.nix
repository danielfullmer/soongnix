{ java_library }:
let

#
#   Copyright (C) 2017 Google, Inc.
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

"sl4a.InterpreterForAndroid" = java_library {
    name = "sl4a.InterpreterForAndroid";
    owner = "google";
    static_libs = [
        "guava"
        "android-common"
        "sl4a.Utils"

        # "android-support-v4",
    ];

    srcs = [
        "src/com/googlecode/android_scripting/AsyncTaskListener.java"
        "src/com/googlecode/android_scripting/InterpreterInstaller.java"
        "src/com/googlecode/android_scripting/InterpreterUninstaller.java"
        "src/com/googlecode/android_scripting/UrlDownloaderTask.java"
        "src/com/googlecode/android_scripting/ZipExtractorTask.java"
        "src/com/googlecode/android_scripting/activity/Main.java"
        "src/com/googlecode/android_scripting/interpreter/InterpreterProvider.java"
        "src/com/googlecode/android_scripting/interpreter/Sl4aHostedInterpreter.java"
    ];
};

in { inherit "sl4a.InterpreterForAndroid"; }
