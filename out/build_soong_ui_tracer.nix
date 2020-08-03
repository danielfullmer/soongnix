{ bootstrap_go_package }:
let

#  Copyright 2016 Google Inc. All rights reserved.
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

soong-ui-tracer = bootstrap_go_package {
    name = "soong-ui-tracer";
    pkgPath = "android/soong/ui/tracer";
    deps = [
        "soong-ui-logger"
        "soong-ui-status"
    ];
    srcs = [
        "microfactory.go"
        "status.go"
        "tracer.go"
    ];
};

in { inherit soong-ui-tracer; }
