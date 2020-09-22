{ android_app_certificate, apex, apex_defaults, apex_key, filegroup, prebuilt_etc }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

"com.android.media-defaults" = apex_defaults {
    name = "com.android.media-defaults";
    updatable = true;
    java_libs = ["updatable-media"];
    multilib = {
        first = {
            #  Extractor process runs only with the primary ABI.
            native_shared_libs = [
                #  Extractor plugins
                "libaacextractor"
                "libamrextractor"
                "libflacextractor"
                "libmidiextractor"
                "libmkvextractor"
                "libmp3extractor"
                "libmp4extractor"
                "libmpeg2extractor"
                "liboggextractor"
                "libwavextractor"
            ];
        };
    };
    prebuilts = [
        "mediaextractor.policy"
        "code_coverage.policy"
        "crash_dump.policy"
    ];
    key = "com.android.media.key";
    certificate = ":com.android.media.certificate";

    #  Use a custom AndroidManifest.xml used for API targeting.
    androidManifest = ":com.android.media-androidManifest";

    #  IMPORTANT: For the APEX to be installed on Android 10 (API 29),
    #  min_sdk_version should be 29. This enables the build system to make
    #  sure the package compatible to Android 10 in two ways:
    #  - build the APEX package compatible to Android 10
    #    so that the package can be installed.
    #  - build artifacts (lib/javalib/bin) against Android 10 SDK
    #    so that the artifacts can run.
    min_sdk_version = "29";
};

"com.android.media" = apex {
    name = "com.android.media";
    manifest = "manifest.json";
    defaults = ["com.android.media-defaults"];
};

"com.android.media-androidManifest" = filegroup {
    name = "com.android.media-androidManifest";
    srcs = ["AndroidManifest-media.xml"];
};

"com.android.media.swcodec-androidManifest" = filegroup {
    name = "com.android.media.swcodec-androidManifest";
    srcs = ["AndroidManifest-swcodec.xml"];
};

"com.android.media.swcodec-defaults" = apex_defaults {
    name = "com.android.media.swcodec-defaults";
    updatable = true;
    binaries = [
        "mediaswcodec"
    ];
    prebuilts = [
        "com.android.media.swcodec-mediaswcodec.rc"
        "com.android.media.swcodec-ld.config.txt"
        "mediaswcodec.policy"
        "code_coverage.policy"
        "crash_dump.policy"
        "mediaswcodec.xml"
    ];
    use_vendor = true;
    key = "com.android.media.swcodec.key";
    certificate = ":com.android.media.swcodec.certificate";

    #  Use a custom AndroidManifest.xml used for API targeting.
    androidManifest = ":com.android.media.swcodec-androidManifest";

    #  IMPORTANT: For the APEX to be installed on Android 10 (API 29),
    #  min_sdk_version should be 29. This enables the build system to make
    #  sure the package compatible to Android 10 in two ways:
    #  - build the APEX package compatible to Android 10
    #    so that the package can be installed.
    #  - build artifacts (lib/javalib/bin) against Android 10 SDK
    #    so that the artifacts can run.
    min_sdk_version = "29";
};

"com.android.media.swcodec-mediaswcodec.rc" = prebuilt_etc {
    name = "com.android.media.swcodec-mediaswcodec.rc";
    src = "mediaswcodec.rc";
    filename = "init.rc";
    installable = false;
};

"com.android.media.swcodec-ld.config.txt" = prebuilt_etc {
    name = "com.android.media.swcodec-ld.config.txt";
    src = "ld.config.txt";
    filename = "ld.config.txt";
    installable = false;
};

"com.android.media.swcodec" = apex {
    name = "com.android.media.swcodec";
    manifest = "manifest_codec.json";
    defaults = ["com.android.media.swcodec-defaults"];
};

"com.android.media.key" = apex_key {
    name = "com.android.media.key";
    public_key = "com.android.media.avbpubkey";
    private_key = "com.android.media.pem";
};

"com.android.media.swcodec.key" = apex_key {
    name = "com.android.media.swcodec.key";
    public_key = "com.android.media.swcodec.avbpubkey";
    private_key = "com.android.media.swcodec.pem";
};

"com.android.media.certificate" = android_app_certificate {
    name = "com.android.media.certificate";
    certificate = "com.android.media";
};

"com.android.media.swcodec.certificate" = android_app_certificate {
    name = "com.android.media.swcodec.certificate";
    certificate = "com.android.media.swcodec";
};

in { inherit "com.android.media" "com.android.media-androidManifest" "com.android.media-defaults" "com.android.media.certificate" "com.android.media.key" "com.android.media.swcodec" "com.android.media.swcodec-androidManifest" "com.android.media.swcodec-defaults" "com.android.media.swcodec-ld.config.txt" "com.android.media.swcodec-mediaswcodec.rc" "com.android.media.swcodec.certificate" "com.android.media.swcodec.key"; }
