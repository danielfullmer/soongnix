{ python_library_host, python_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

python-symbol = python_library_host {
    name = "python-symbol";
    srcs = [
        "symbol.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
};

python-native_heapdump_viewer_test = python_test_host {
    name = "python-native_heapdump_viewer_test";
    main = "native_heapdump_viewer_tests.py";
    srcs = [
        "native_heapdump_viewer.py"
        "native_heapdump_viewer_tests.py"
    ];
    test_config = "native_heapdump_viewer-tests.xml";
    test_suites = ["general-tests"];
};

python-symbol_test = python_test_host {
    name = "python-symbol_test";
    main = "symbol.py";
    #  Would be nice to use the library above, but as it's single-source
    #  this doesn't work.
    srcs = ["symbol.py"];
    test_config = "symbol-tests.xml";
    test_suites = ["general-tests"];
};

in { inherit python-native_heapdump_viewer_test python-symbol python-symbol_test; }
