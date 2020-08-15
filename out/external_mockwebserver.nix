{ java_library }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

mockwebserver = java_library {
    name = "mockwebserver";
    hostdex = true;
    srcs = [
        "src/main/java/com/google/mockwebserver/Dispatcher.java"
        "src/main/java/com/google/mockwebserver/MockResponse.java"
        "src/main/java/com/google/mockwebserver/MockWebServer.java"
        "src/main/java/com/google/mockwebserver/QueueDispatcher.java"
        "src/main/java/com/google/mockwebserver/RecordedRequest.java"
        "src/main/java/com/google/mockwebserver/SocketPolicy.java"
    ];

    #  Some tests (CtsVerifier, etc) that are built with SDK are using this library,
    #  thus this lib should be built with public APIs. Since this lib is not specific
    #  to Android, core_current which is a core-Java subset of Android SDK is used.
    sdk_version = "core_current";

};

in { inherit mockwebserver; }
