{ cc_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

#  see how_to_run.txt for instructions on running these tests

minikin_tests = cc_test {
    name = "minikin_tests";
    test_suites = ["device-tests"];
    data = [":minikin-test-data"];

    header_libs = ["libminikin-headers-for-tests"];

    static_libs = [
        "libminikin-tests-util"
        "libminikin"
        "libxml2"
    ];

    #  Shared libraries which are dependencies of minikin; these are not automatically
    #  pulled in by the build system (and thus sadly must be repeated).
    shared_libs = [
        "libft2"
        "libharfbuzz_ng"
        "libandroidicu"
        "liblog"
        "libutils"
        "libz"
    ];

    srcs = [
        "AndroidLineBreakerHelperTest.cpp"
        "BidiUtilsTest.cpp"
        "CmapCoverageTest.cpp"
        "EmojiTest.cpp"
        "FontTest.cpp"
        "FontCollectionTest.cpp"
        "FontCollectionItemizeTest.cpp"
        "FontFamilyTest.cpp"
        "FontLanguageListCacheTest.cpp"
        "FontUtilsTest.cpp"
        "HasherTest.cpp"
        "HyphenatorMapTest.cpp"
        "HyphenatorTest.cpp"
        "GraphemeBreakTests.cpp"
        "GreedyLineBreakerTest.cpp"
        "LayoutCacheTest.cpp"
        "LayoutCoreTest.cpp"
        "LayoutSplitterTest.cpp"
        "LayoutTest.cpp"
        "LayoutUtilsTest.cpp"
        "LocaleListTest.cpp"
        "MeasuredTextTest.cpp"
        "MeasurementTests.cpp"
        "OptimalLineBreakerTest.cpp"
        "SparseBitSetTest.cpp"
        "StringPieceTest.cpp"
        "SystemFontsTest.cpp"
        "TestMain.cpp"
        "UnicodeUtilsTest.cpp"
        "WordBreakerTests.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit minikin_tests; }
