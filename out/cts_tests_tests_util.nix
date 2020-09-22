{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsUtilTestCases = android_test {
    name = "CtsUtilTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.rules"
        "ctstestrunner-axt"
        "cts-install-lib"
        "core-test-rules" #  for libcore.dalvik.system.CloseGuardSupport
    ];
    srcs = [
        "src/android/util/cts/AndroidExceptionTest.java"
        "src/android/util/cts/AndroidRuntimeExceptionTest.java"
        "src/android/util/cts/ArrayMapTest.java"
        "src/android/util/cts/ArraySetTest.java"
        "src/android/util/cts/CloseGuardTest.java"
        "src/android/util/cts/DebugUtilsTest.java"
        "src/android/util/cts/DisplayMetricsTest.java"
        "src/android/util/cts/EventLogTest.java"
        "src/android/util/cts/HalfTest.java"
        "src/android/util/cts/InstallUtilTest.java"
        "src/android/util/cts/JsonReaderTest.java"
        "src/android/util/cts/JsonWriterTest.java"
        "src/android/util/cts/LogPrinterTest.java"
        "src/android/util/cts/LogTest.java"
        "src/android/util/cts/LongSparseArrayTest.java"
        "src/android/util/cts/LruCacheTest.java"
        "src/android/util/cts/MathUtilsTest.java"
        "src/android/util/cts/MonthDisplayHelperTest.java"
        "src/android/util/cts/MutableTest.java"
        "src/android/util/cts/PatternsTest.java"
        "src/android/util/cts/PrintStreamPrinterTest.java"
        "src/android/util/cts/PrintWriterPrinterTest.java"
        "src/android/util/cts/PropertyTest.java"
        "src/android/util/cts/RangeTest.java"
        "src/android/util/cts/RationalTest.java"
        "src/android/util/cts/SizeTest.java"
        "src/android/util/cts/SparseArrayMapTest.java"
        "src/android/util/cts/SparseArrayTest.java"
        "src/android/util/cts/SparseBooleanArrayTest.java"
        "src/android/util/cts/SparseIntArrayTest.java"
        "src/android/util/cts/SparseLongArrayTest.java"
        "src/android/util/cts/StateSetTest.java"
        "src/android/util/cts/StrictJarFileTest.java"
        "src/android/util/cts/StringBuilderPrinterTest.java"
        "src/android/util/cts/TimeUtilsTest.java"
        "src/android/util/cts/TimingLoggerTest.java"
        "src/android/util/cts/TypedValueTest.java"
        "src/android/util/cts/XmlEncodingTest.java"
        "src/android/util/cts/XmlTest.java"
    ];
    platform_apis = true;
};

in { inherit CtsUtilTestCases; }
