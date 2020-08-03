{ blueprint_go_binary, bootstrap_go_package }:
let

#  Copyright 2017 Google Inc. All rights reserved.
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

bpfix = blueprint_go_binary {
    name = "bpfix";
    srcs = [
        "cmd/bpfix.go"
    ];
    deps = [
        "bpfix-lib"
    ];
};

bpfix-lib = bootstrap_go_package {
    name = "bpfix-lib";
    pkgPath = "android/soong/bpfix/bpfix";
    srcs = [
        "bpfix/bpfix.go"
    ];
    testSrcs = [
        "bpfix/bpfix_test.go"
    ];
    deps = [
        "blueprint-parser"
    ];
};

in { inherit bpfix bpfix-lib; }
