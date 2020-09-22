{ filegroup, java_library }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

app-compat-annotations = java_library {
    name = "app-compat-annotations";
    host_supported = true;
    srcs = [
        "ChangeId.java"
        "Disabled.java"
        "EnabledAfter.java"
        "LoggingOnly.java"
    ];
    sdk_version = "core_current";
    exported_plugins = ["compat-changeid-annotation-processor"];
};

#  Don't forget to depend on exported_plugins, if using sources directly
app-compat-annotations-source = filegroup {
    name = "app-compat-annotations-source";
    srcs = [
        "ChangeId.java"
        "Disabled.java"
        "EnabledAfter.java"
        "LoggingOnly.java"
        "UnsupportedAppUsage.java"
    ];
    visibility = ["//libcore:__pkg__"];
};

unsupportedappusage = java_library {
    name = "unsupportedappusage";
    host_supported = true;
    srcs = [
        "UnsupportedAppUsage.java"
    ];
    sdk_version = "core_current";
    exported_plugins = ["unsupportedappusage-annotation-processor"];
};

in { inherit app-compat-annotations app-compat-annotations-source unsupportedappusage; }
