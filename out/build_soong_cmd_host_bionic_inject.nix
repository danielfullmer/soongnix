{ blueprint_go_binary }:
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

host_bionic_inject = blueprint_go_binary {
    name = "host_bionic_inject";
    deps = ["soong-symbol_inject"];
    srcs = ["host_bionic_inject.go"];
    testSrcs = ["host_bionic_inject_test.go"];
};

in { inherit host_bionic_inject; }
