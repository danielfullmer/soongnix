{ blueprint_go_binary, bootstrap_go_package }:
let

#  Copyright 2015 Google Inc. All rights reserved.
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

#
#  androidmk Android.mk to Blueprints translator
#

androidmk = blueprint_go_binary {
    name = "androidmk";
    srcs = [
        "cmd/androidmk/android.go"
        "cmd/androidmk/androidmk.go"
        "cmd/androidmk/values.go"
    ];
    testSrcs = [
        "cmd/androidmk/androidmk_test.go"
    ];
    deps = [
        "androidmk-parser"
        "blueprint-parser"
        "bpfix-lib"
    ];
};

androidmk-parser = bootstrap_go_package {
    name = "androidmk-parser";
    pkgPath = "android/soong/androidmk/parser";
    srcs = [
        "parser/ast.go"
        "parser/make_strings.go"
        "parser/parser.go"
        "parser/scope.go"
    ];
    testSrcs = [
        "parser/make_strings_test.go"
        "parser/parser_test.go"
    ];
};

in { inherit androidmk androidmk-parser; }
