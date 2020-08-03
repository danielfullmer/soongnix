{ cc_benchmark }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

minikin_perftests = cc_benchmark {
    name = "minikin_perftests";
    test_suites = ["device-tests"];
    cppflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
    srcs = [
        "FontCollection.cpp"
        "FontLanguage.cpp"
        "GraphemeBreak.cpp"
        "Hyphenator.cpp"
        "WordBreaker.cpp"
        "main.cpp"
    ];

    header_libs = ["libminikin-headers-for-tests"];

    static_libs = [
        "libminikin-tests-util"
        "libminikin"
        "libxml2"
    ];

    shared_libs = [
        "libft2"
        "libharfbuzz_ng"
        "libandroidicu"
        "liblog"

    ];
};

in { inherit minikin_perftests; }
