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

soong-ui-metrics = bootstrap_go_package {
    name = "soong-ui-metrics";
    pkgPath = "android/soong/ui/metrics";
    deps = [
        "golang-protobuf-proto"
        "soong-ui-metrics_proto"
        "soong-ui-tracer"
    ];
    srcs = [
        "metrics.go"
        "time.go"
    ];
};

soong-ui-metrics_proto = bootstrap_go_package {
    name = "soong-ui-metrics_proto";
    pkgPath = "android/soong/ui/metrics/metrics_proto";
    deps = ["golang-protobuf-proto"];
    srcs = [
        "metrics_proto/metrics.pb.go"
    ];
};

in { inherit soong-ui-metrics soong-ui-metrics_proto; }
