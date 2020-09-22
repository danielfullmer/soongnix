{ tradefed_java_library_host }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

tf-contrib-tests = tradefed_java_library_host {
    name = "tf-contrib-tests";

    #  Only compile source java files in this lib.
    srcs = [
        "src/com/android/build/tests/ImageStatsTest.java"
        "src/com/android/continuous/SmokeTestTest.java"
        "src/com/android/monkey/MonkeyBaseTest.java"
        "src/com/android/regression/tests/DetectRegressionTest.java"
        "src/com/android/regression/tests/MetricsTest.java"
        "src/com/android/regression/tests/MetricsXmlParserTest.java"
        "src/com/android/scenario/AppSetupTest.java"
        "src/com/android/tradefed/prodtests/UnitTests.java"
    ];

    # resource_dirs: ["res"],

    javacflags = [
        "-g"
        "-Xlint"
    ];

    libs = [
        "tradefed"
        "tradefed-contrib"
        "easymock"
        "mockito"
        "objenesis"
    ];
};

in { inherit tf-contrib-tests; }
