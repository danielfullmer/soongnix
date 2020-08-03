{ bootstrap_go_package }:
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

soong-ui-build-paths = bootstrap_go_package {
    name = "soong-ui-build-paths";
    pkgPath = "android/soong/ui/build/paths";
    srcs = [
        "paths/config.go"
        "paths/logs.go"
    ];
    testSrcs = [
        "paths/logs_test.go"
    ];
};

soong-ui-build = bootstrap_go_package {
    name = "soong-ui-build";
    pkgPath = "android/soong/ui/build";
    deps = [
        "soong-ui-build-paths"
        "soong-ui-logger"
        "soong-ui-metrics"
        "soong-ui-status"
        "soong-ui-terminal"
        "soong-ui-tracer"
        "soong-shared"
        "soong-finder"
        "blueprint-microfactory"
    ];
    srcs = [
        "build.go"
        "cleanbuild.go"
        "config.go"
        "context.go"
        "dumpvars.go"
        "environment.go"
        "exec.go"
        "finder.go"
        "goma.go"
        "kati.go"
        "ninja.go"
        "path.go"
        "proc_sync.go"
        "signal.go"
        "soong.go"
        "test_build.go"
        "util.go"
    ];
    testSrcs = [
        "config_test.go"
        "environment_test.go"
        "util_test.go"
        "proc_sync_test.go"
    ];
    darwin = {
        srcs = [
            "sandbox_darwin.go"
        ];
    };
    linux = {
        srcs = [
            "sandbox_linux.go"
        ];
    };
};

in { inherit soong-ui-build soong-ui-build-paths; }
