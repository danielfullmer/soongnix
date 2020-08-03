{ cc_library, droidstubs, genrule, java_library, stubs_defaults }:
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

libcarpowermanager = cc_library {
    name = "libcarpowermanager";

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = [
            "src"
        ];
    };

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];

    include_dirs = [
        "packages/services/Car/car-lib/native/include"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
    ];

    srcs = [
        "src/android/car/ICar.aidl"
        "src/android/car/hardware/power/ICarPower.aidl"
        "src/android/car/hardware/power/ICarPowerStateListener.aidl"
        "native/CarPowerManager/CarPowerManager.cpp"
    ];
};

"android.car.cluster.navigation" = java_library {
    name = "android.car.cluster.navigation";
    proto = {
        type = "lite";
    };
    static_libs = ["libprotobuf-java-lite"];
    srcs = ["src/android/car/navigation/navigation_state.proto"];
};

#  library to access settings from CarSettings
"android.car.settings" = java_library {
    name = "android.car.settings";
    srcs = ["src/android/car/settings/CarSettings.java"];
};

"android.car" = java_library {
    name = "android.car";
    srcs = [
        "src/**/*.java"
        "src_feature_future/**/*.java"
        "src/**/I*.aidl"
    ];
    aidl = {
        include_dirs = [
            "system/bt/binder"
        ];
    };
    exclude_srcs = [
        "src/android/car/storagemonitoring/IoStats.aidl"
        "src/android/car/storagemonitoring/IoStatsEntry.aidl"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    installable = true;
};

"android.car-docs-default" = stubs_defaults {
    name = "android.car-docs-default";
    srcs = [
        "src/**/*.java"
        "src_feature_future/**/*.java"
    ];
    libs = [
        "android.car"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

android-car-last-released-api = genrule {
    name = "android-car-last-released-api";
    srcs = [
        "api/released/*.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -n | tail -1) $(genDir)/last-released-api.txt";
    out = [
        "last-released-api.txt"
    ];
};

android-car-last-released-system-api = genrule {
    name = "android-car-last-released-system-api";
    srcs = [
        "api/system-released/*.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -n | tail -1) $(genDir)/last-released-system-api.txt";
    out = [
        "last-released-system-api.txt"
    ];
};

"android.car-stubs-docs" = droidstubs {
    name = "android.car-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* ";
    installable = false;
    check_api = {
        last_released = {
            api_file = ":android-car-last-released-api";
            removed_api_file = "api/removed.txt";
            args = " -hide 2 -hide 3 -hide 4 -hide 5 -hide 6 -hide 24 -hide 25 -hide 26 -hide 27 " +
                " -warning 7 -warning 8 -warning 9 -warning 10 -warning 11 -warning 12 " +
                " -warning 13 -warning 14 -warning 15 -warning 16 -warning 17 -warning 18 -hide 113 ";
        };
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-system-stubs-docs" = droidstubs {
    name = "android.car-system-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR_SYSTEM";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* " +
        "--show-annotation android.annotation.SystemApi ";
    installable = false;
    check_api = {
        last_released = {
            api_file = ":android-car-last-released-system-api";
            removed_api_file = "api/system-removed.txt";
            args = " -hide 2 -hide 3 -hide 4 -hide 5 -hide 6 -hide 24 -hide 25 -hide 26 -hide 27 " +
                " -warning 7 -warning 8 -warning 9 -warning 10 -warning 11 -warning 12 " +
                " -warning 13 -warning 14 -warning 15 -warning 16 -warning 17 -warning 18 -hide 113 ";
        };
        current = {
            api_file = "api/system-current.txt";
            removed_api_file = "api/system-removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-test-stubs-docs" = droidstubs {
    name = "android.car-test-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR_SYSTEM";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* " +
        "--show-annotation android.annotation.TestApi ";
    installable = false;
    check_api = {
        current = {
            api_file = "api/test-current.txt";
            removed_api_file = "api/test-removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-stub-docs" = droidstubs {
    name = "android.car-stub-docs";
    srcs = [
        "src/**/*.java"
    ];
    libs = [
        "android.car"
    ];
    api_tag_name = "ANDROID_CAR_STUB";
    api_filename = "api.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* ";
    installable = false;
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

"android.car-stubs" = java_library {
    name = "android.car-stubs";
    srcs = [
        ":android.car-stub-docs"
    ];
    sdk_version = "current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-system-stubs" = java_library {
    name = "android.car-system-stubs";
    srcs = [
        ":android.car-system-stubs-docs"
        "src_stub/**/*.java"
    ];
    sdk_version = "system_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-test-stubs" = java_library {
    name = "android.car-test-stubs";
    srcs = [
        ":android.car-test-stubs-docs"
    ];
    sdk_version = "test_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

in { inherit "android.car" "android.car-docs-default" "android.car-stub-docs" "android.car-stubs" "android.car-stubs-docs" "android.car-system-stubs" "android.car-system-stubs-docs" "android.car-test-stubs" "android.car-test-stubs-docs" "android.car.cluster.navigation" "android.car.settings" android-car-last-released-api android-car-last-released-system-api libcarpowermanager; }
