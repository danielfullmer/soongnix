{ java_test, java_test_host }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

#  Build the common library for use device-side
CtsInputMethodServiceCommon = java_test {
    name = "CtsInputMethodServiceCommon";
    srcs = [
        "src/android/inputmethodservice/cts/common/BusyWaitUtils.java"
        "src/android/inputmethodservice/cts/common/ComponentNameUtils.java"
        "src/android/inputmethodservice/cts/common/DeviceEventConstants.java"
        "src/android/inputmethodservice/cts/common/EditTextAppConstants.java"
        "src/android/inputmethodservice/cts/common/EventProviderConstants.java"
        "src/android/inputmethodservice/cts/common/Ime1Constants.java"
        "src/android/inputmethodservice/cts/common/Ime2Constants.java"
        "src/android/inputmethodservice/cts/common/ImeCommandConstants.java"
        "src/android/inputmethodservice/cts/common/test/DeviceTestConstants.java"
        "src/android/inputmethodservice/cts/common/test/ShellCommandUtils.java"
        "src/android/inputmethodservice/cts/common/test/TestInfo.java"
    ];
    libs = ["junit"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

#  Build the common library for use host-side
cts-inputmethodservice-common-host = java_test_host {
    name = "cts-inputmethodservice-common-host";
    srcs = [
        "src/android/inputmethodservice/cts/common/BusyWaitUtils.java"
        "src/android/inputmethodservice/cts/common/ComponentNameUtils.java"
        "src/android/inputmethodservice/cts/common/DeviceEventConstants.java"
        "src/android/inputmethodservice/cts/common/EditTextAppConstants.java"
        "src/android/inputmethodservice/cts/common/EventProviderConstants.java"
        "src/android/inputmethodservice/cts/common/Ime1Constants.java"
        "src/android/inputmethodservice/cts/common/Ime2Constants.java"
        "src/android/inputmethodservice/cts/common/ImeCommandConstants.java"
        "src/android/inputmethodservice/cts/common/test/DeviceTestConstants.java"
        "src/android/inputmethodservice/cts/common/test/ShellCommandUtils.java"
        "src/android/inputmethodservice/cts/common/test/TestInfo.java"
    ];
    libs = ["junit"];
};

in { inherit CtsInputMethodServiceCommon cts-inputmethodservice-common-host; }
