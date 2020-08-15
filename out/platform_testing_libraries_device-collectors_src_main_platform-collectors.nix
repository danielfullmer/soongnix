{ java_genrule, java_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

#  Genrule for handwritten statsd configs.
statsd-config-protos = java_genrule {
    name = "statsd-config-protos";
    host_supported = true;
    srcs = [
        "res/statsd-configs/app-compact/app-compact.pb"
        "res/statsd-configs/app-start/app-start.pb"
        "res/statsd-configs/full-battery-capacity/full-battery-capacity-run-level.pb"
        "res/statsd-configs/full-battery-capacity/full-battery-capacity-test-level.pb"
        "res/statsd-configs/greenday-power/greenday-power-run-level.pb"
        "res/statsd-configs/greenday-power/greenday-power-test-level.pb"
        "res/statsd-configs/greenday-power-smaller/greenday-power-smaller-run-level.pb"
        "res/statsd-configs/greenday-power-smaller/greenday-power-smaller-test-level.pb"
        "res/statsd-configs/on-device-power-measurement/on-device-power-measurement-run-level.pb"
        "res/statsd-configs/on-device-power-measurement/on-device-power-measurement-test-level.pb"
        "res/statsd-configs/remaining-battery-capacity/remaining-battery-capacity-run-level.pb"
        "res/statsd-configs/remaining-battery-capacity/remaining-battery-capacity-test-level.pb"
        "res/statsd-configs/remaining-battery-capacity/remaining-battery-capacity-with-uid-run-level.pb"
        "res/statsd-configs/remaining-battery-capacity/remaining-battery-capacity-with-uid-test-level.pb"
        "res/statsd-configs/wifi-bytes-transfer/wifi-bytes-transfer-run-level.pb"
        "res/statsd-configs/wifi-bytes-transfer/wifi-bytes-transfer-test-level.pb"
    ];
    out = ["statsd-config-protos.jar"];
    /*
     * Loops over all subdirectories under res/statsd-configs/ and copy all *.pb configs within to
     * an assets/statsd-configs/ directory, which gets packed into a .jar file and ends up under the
     * assets/statsd-configs/ directory in the package, which can then be read with asset manager
     * in the APK.
     *
     * If a config fails to parse, an error is thrown and the build will fail.
     */
    cmd = "out_dir=$$(dirname $(out)) && assets_dir=\"assets/statsd-configs\" " +
        "&& mkdir -p $$out_dir/$$assets_dir && protos=($(locations res/statsd-configs/**/*.pb)) " +
        "&& for file in $\${protos[@]} ; do cp $$file $$out_dir/$$assets_dir/ ; done " +
        "&& jar cf $(out) -C $$(dirname $(out)) $$assets_dir";
};

#  This library enables additional listeners dependent on platform apis.
collector-device-lib-platform = java_library {
    name = "collector-device-lib-platform";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = [
        "src/android/device/collectors/AppStartupListener.java"
        "src/android/device/collectors/CpuUsageListener.java"
        "src/android/device/collectors/CrashListener.java"
        "src/android/device/collectors/StatsdListener.java"
        "src/android/device/collectors/ThermalListener.java"
    ];

    static_libs = [
        "collector-device-lib"
        "libprotobuf-java-lite"
        "statsd-config-protos"
        "statsd-helper"
        "ub-uiautomator"
    ];
    platform_apis = true;
};

in { inherit collector-device-lib-platform statsd-config-protos; }
