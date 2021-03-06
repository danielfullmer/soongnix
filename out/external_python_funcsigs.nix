{ python_test }:
let

#  Copyright 2018 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

py2-funcsigs-tests = python_test {
    name = "py2-funcsigs-tests";
    #  use _ instead of . in the name to avoid error:
    #    error: external/python/funcsigs/Android.bp:18:7: module "py2-funcsigs-tests" variant
    #    "linux_glibc_x86_64_PY2": srcs: the path "Android.tests.py" contains invalid token "Android.tests".
    main = "Android_tests.py";
    srcs = [
        #  important: the tests must be run as if they were in the 'tests' module
        #  (i.e. from external/python/funcsigs) otherwise one of the tests will fail.
        "tests/__init__.py"
        "tests/test_formatannotation.py"
        "tests/test_funcsigs.py"
        "tests/test_inspect.py"
        "Android_tests.py"
    ];
    host_supported = true;
    libs = ["py-funcsigs"];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    #  required for tests.test_funcsigs.TestFunctionSignatures
    data = ["README.rst"];
};

py3-funcsigs-tests = python_test {
    name = "py3-funcsigs-tests";
    main = "Android_tests.py";
    srcs = [
        "tests/__init__.py"
        "tests/test_formatannotation.py"
        "tests/test_funcsigs.py"
        "tests/test_inspect.py"
        "Android_tests.py"
    ];
    host_supported = true;
    libs = ["py-funcsigs"];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
    data = ["README.rst"];
};

in { inherit py2-funcsigs-tests py3-funcsigs-tests; }
