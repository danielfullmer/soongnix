{ cc_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

inputflinger_tests = cc_test {
    name = "inputflinger_tests";
    defaults = [
        "inputflinger_defaults"
        #  For all targets inside inputflinger, these tests build all of their sources using their
        #  defaults rather than including them as shared or static libraries. By doing so, the tests
        #  will always run against the compiled version of the inputflinger code rather than the
        #  version on the device.
        "libinputflinger_base_defaults"
        "libinputreader_defaults"
        "libinputreporter_defaults"
        "libinputdispatcher_defaults"
        "libinputflinger_defaults"
    ];
    srcs = [
        "AnrTracker_test.cpp"
        "BlockingQueue_test.cpp"
        "EventHub_test.cpp"
        "TestInputListener.cpp"
        "InputClassifier_test.cpp"
        "InputClassifierConverter_test.cpp"
        "InputDispatcher_test.cpp"
        "InputReader_test.cpp"
        "UinputDevice.cpp"
    ];
    require_root = true;
};

in { inherit inputflinger_tests; }
