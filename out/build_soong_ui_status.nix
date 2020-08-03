{ bootstrap_go_package }:
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

soong-ui-status = bootstrap_go_package {
    name = "soong-ui-status";
    pkgPath = "android/soong/ui/status";
    deps = [
        "golang-protobuf-proto"
        "soong-ui-logger"
        "soong-ui-status-ninja_frontend"
    ];
    srcs = [
        "kati.go"
        "log.go"
        "ninja.go"
        "status.go"
    ];
    testSrcs = [
        "kati_test.go"
        "ninja_test.go"
        "status_test.go"
    ];
};

soong-ui-status-ninja_frontend = bootstrap_go_package {
    name = "soong-ui-status-ninja_frontend";
    pkgPath = "android/soong/ui/status/ninja_frontend";
    deps = ["golang-protobuf-proto"];
    srcs = [
        "ninja_frontend/frontend.pb.go"
    ];
};

in { inherit soong-ui-status soong-ui-status-ninja_frontend; }
