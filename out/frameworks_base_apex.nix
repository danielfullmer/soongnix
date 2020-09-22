{ java_defaults, stubs_defaults }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

mainline_stubs_args = "--error UnhiddenSystemApi " +
    "--hide BroadcastBehavior " +
    "--hide DeprecationMismatch " +
    "--hide HiddenSuperclass " +
    "--hide HiddenTypedefConstant " +
    "--hide HiddenTypeParameter " +
    "--hide MissingPermission " +
    "--hide RequiresPermission " +
    "--hide SdkConstant " +
    "--hide Todo " +
    "--hide Typo " +
    "--hide UnavailableSymbol ";

#  TODO: modularize this so not every module has the same whitelist
framework_packages_to_document = [
    "android"
    "dalvik"
    "java"
    "javax"
    "junit"
    "org.apache.http"
    "org.json"
    "org.w3c.dom"
    "org.xml.sax"
    "org.xmlpull"
];

#  TODO: remove the hiding when server classes are cleaned up.
mainline_framework_stubs_args = mainline_stubs_args +
    "--hide-package com.android.server ";

priv_apps = " " +
    "--show-annotation android.annotation.SystemApi\\(" +
    "client=android.annotation.SystemApi.Client.PRIVILEGED_APPS" +
    "\\) ";

module_libs = " " +
    " --show-annotation android.annotation.SystemApi\\(" +
    "client=android.annotation.SystemApi.Client.MODULE_LIBRARIES" +
    "\\) ";

mainline_service_stubs_args = mainline_stubs_args +
    "--show-annotation android.annotation.SystemApi\\(" +
    "client=android.annotation.SystemApi.Client.SYSTEM_SERVER" +
    "\\) " +
    "--hide-annotation android.annotation.Hide " +
    "--hide InternalClasses "; #  com.android.* classes are okay in this interface

#  Defaults common to all mainline module java_sdk_library instances.
framework-module-common-defaults = java_defaults {
    name = "framework-module-common-defaults";

    #  Additional annotations used for compiling both the implementation and the
    #  stubs libraries.
    libs = ["framework-annotations-lib"];

    #  Framework modules are not generally shared libraries, i.e. they are not
    #  intended, and must not be allowed, to be used in a <uses-library> manifest
    #  entry.
    shared_library = false;

    #  Enable api lint. This will eventually become the default for java_sdk_library
    #  but it cannot yet be turned on because some usages have not been cleaned up.
    #  TODO(b/156126315) - Remove when no longer needed.
    api_lint = {
        enabled = true;
    };

    #  The API scope specific properties.
    public = {
        enabled = true;
        sdk_version = "module_current";
    };

    #  Configure framework module specific metalava options.
    droiddoc_options = [mainline_stubs_args];

    annotations_enabled = true;

    stubs_library_visibility = [
        "//visibility:public"
    ];

    #  Set the visibility of the modules creating the stubs source.
    stubs_source_visibility = [
        #  Ignore any visibility rules specified on the java_sdk_library when
        #  setting the visibility of the stubs source modules.
        "//visibility:override"

        #  Currently, the stub source is not required for anything other than building
        #  the stubs library so is private to avoid misuse.
        "//visibility:private"
    ];

    #  Collates API usages from each module for further analysis.
    plugins = ["java_api_finder"];

    #  Mainline modules should only rely on 'module_lib' APIs provided by other modules
    #  and the non updatable parts of the platform.
    sdk_version = "module_current";
};

#  Defaults for mainline module provided java_sdk_library instances.
framework-module-defaults = java_defaults {
    name = "framework-module-defaults";
    defaults = ["framework-module-common-defaults"];

    system = {
        enabled = true;
        sdk_version = "module_current";
    };
    module_lib = {
        enabled = true;
        sdk_version = "module_current";
    };
};

#  Defaults for mainline module system server provided java_sdk_library instances.
framework-system-server-module-defaults = java_defaults {
    name = "framework-system-server-module-defaults";
    defaults = ["framework-module-common-defaults"];

    system_server = {
        enabled = true;
        sdk_version = "module_current";
    };
};

framework-module-stubs-defaults-publicapi = stubs_defaults {
    name = "framework-module-stubs-defaults-publicapi";
    args = mainline_framework_stubs_args;
    installable = false;
    sdk_version = "module_current";
    annotations_enabled = true;
    merge_annotations_dirs = [
        "metalava-manual"
    ];
    filter_packages = framework_packages_to_document;
    check_api = {
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
        };
        api_lint = {
            enabled = true;
        };
    };
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/public/api";
    };
};

framework-module-stubs-defaults-systemapi = stubs_defaults {
    name = "framework-module-stubs-defaults-systemapi";
    args = mainline_framework_stubs_args + priv_apps;
    libs = ["framework-annotations-lib"];
    installable = false;
    sdk_version = "module_current";
    annotations_enabled = true;
    merge_annotations_dirs = [
        "metalava-manual"
    ];
    filter_packages = framework_packages_to_document;
    check_api = {
        current = {
            api_file = "api/system-current.txt";
            removed_api_file = "api/system-removed.txt";
        };
        api_lint = {
            enabled = true;
        };
    };
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/system/api";
    };
};

framework-module-stubs-lib-defaults-publicapi = java_defaults {
    name = "framework-module-stubs-lib-defaults-publicapi";
    installable = false;
    sdk_version = "module_current";
    libs = ["stub-annotations"];
    java_version = "1.8";
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/public";
    };
};

framework-module-stubs-lib-defaults-systemapi = java_defaults {
    name = "framework-module-stubs-lib-defaults-systemapi";
    installable = false;
    sdk_version = "module_current";
    libs = ["stub-annotations"];
    java_version = "1.8";
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/system";
    };
};

framework-module-stubs-lib-defaults-module_libs_api = java_defaults {
    name = "framework-module-stubs-lib-defaults-module_libs_api";
    installable = false;
    sdk_version = "module_current";
    libs = ["stub-annotations"];
    java_version = "1.8";
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/module-lib";
    };
};

#  The defaults for module_libs comes in two parts - defaults for API checks
#  and defaults for stub generation. This is because we want the API txt
#  files to *only* include the module_libs_api, but the stubs to include
#  module_libs_api as well as priv_apps.

framework-module-api-defaults-module_libs_api = stubs_defaults {
    name = "framework-module-api-defaults-module_libs_api";
    args = mainline_framework_stubs_args + module_libs;
    libs = ["framework-annotations-lib"];
    installable = false;
    sdk_version = "module_current";
    annotations_enabled = true;
    merge_annotations_dirs = [
        "metalava-manual"
    ];
    filter_packages = framework_packages_to_document;
    check_api = {
        current = {
            api_file = "api/module-lib-current.txt";
            removed_api_file = "api/module-lib-removed.txt";
        };
        api_lint = {
            enabled = true;
        };
    };
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/module-lib/api";
    };
};

framework-module-stubs-defaults-module_libs_api = stubs_defaults {
    name = "framework-module-stubs-defaults-module_libs_api";
    args = mainline_framework_stubs_args + module_libs + priv_apps;
    libs = ["framework-annotations-lib"];
    installable = false;
    sdk_version = "module_current";
    annotations_enabled = true;
    merge_annotations_dirs = [
        "metalava-manual"
    ];
    filter_packages = framework_packages_to_document;
};

service-module-stubs-srcs-defaults = stubs_defaults {
    name = "service-module-stubs-srcs-defaults";
    args = mainline_service_stubs_args;
    installable = false;
    annotations_enabled = true;
    merge_annotations_dirs = [
        "metalava-manual"
    ];
    filter_packages = ["com.android."];
    check_api = {
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
        };
        api_lint = {
            enabled = true;
        };
    };
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/system-server/api";
    };
};

#  Empty for now, but a convenient place to add rules for all
#  module java_library system_server stub libs.
service-module-stubs-defaults = java_defaults {
    name = "service-module-stubs-defaults";
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/system-server";
    };
};

in { inherit framework-module-api-defaults-module_libs_api framework-module-common-defaults framework-module-defaults framework-module-stubs-defaults-module_libs_api framework-module-stubs-defaults-publicapi framework-module-stubs-defaults-systemapi framework-module-stubs-lib-defaults-module_libs_api framework-module-stubs-lib-defaults-publicapi framework-module-stubs-lib-defaults-systemapi framework-system-server-module-defaults service-module-stubs-defaults service-module-stubs-srcs-defaults; }
