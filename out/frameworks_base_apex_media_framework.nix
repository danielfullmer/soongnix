{ filegroup, java_library, java_sdk_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

updatable-media = java_library {
    name = "updatable-media";

    srcs = [
        ":updatable-media-srcs"
    ];

    permitted_packages = [
        "android.media"
    ];

    optimize = {
        enabled = true;
        shrink = true;
        proguard_flags_files = ["updatable-media-proguard.flags"];
    };

    installable = true;

    sdk_version = "module_current";
    libs = [
        "framework_media_annotation"
    ];

    static_libs = [
        "exoplayer2-extractor"
    ];
    jarjar_rules = "jarjar_rules.txt";

    plugins = ["java_api_finder"];

    hostdex = true; #  for hiddenapi check
    visibility = ["//frameworks/av/apex:__subpackages__"];
    apex_available = [
        "com.android.media"
        "test_com.android.media"
    ];
    min_sdk_version = "29";
};

updatable-media-srcs = filegroup {
    name = "updatable-media-srcs";
    srcs = [
        ":mediaparser-srcs"
        ":mediasession2-java-srcs"
        ":mediasession2-aidl-srcs"
    ];
};

mediasession2-java-srcs = filegroup {
    name = "mediasession2-java-srcs";
    srcs = [
        "java/android/media/Controller2Link.java"
        "java/android/media/MediaConstants.java"
        "java/android/media/MediaController2.java"
        "java/android/media/MediaSession2.java"
        "java/android/media/MediaSession2Service.java"
        "java/android/media/Session2Command.java"
        "java/android/media/Session2CommandGroup.java"
        "java/android/media/Session2Link.java"
        "java/android/media/Session2Token.java"
    ];
    path = "java";
};

mediaparser-srcs = filegroup {
    name = "mediaparser-srcs";
    srcs = [
        "java/android/media/MediaParser.java"
    ];
    path = "java";
};

framework-media = java_sdk_library {
    name = "framework-media";
    defaults = ["framework-module-defaults"];

    #  This is only used to define the APIs for updatable-media.
    api_only = true;

    srcs = [
        ":updatable-media-srcs"
    ];

    libs = [
        "framework_media_annotation"
    ];

    #  Allow access to the stubs from anywhere.
    visibility = ["//visibility:public"];

    #  Restrict access to implementation library.
    impl_library_visibility = [
        "//visibility:override" #  Ignore the visibility property.
        "//frameworks/av/apex:__subpackages__"
    ];
};

framework_media_annotation = java_library {
    name = "framework_media_annotation";
    srcs = [":framework-media-annotation-srcs"];
    installable = false;
    sdk_version = "core_current";
};

in { inherit framework-media framework_media_annotation mediaparser-srcs mediasession2-java-srcs updatable-media updatable-media-srcs; }
