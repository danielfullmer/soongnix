{ cc_library_shared, package }:
let

#
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
#
_missingName = package {
    default_visibility = [
        "//art/build/apex"
    ];
};

libicu_jni = cc_library_shared {
    name = "libicu_jni";
    host_supported = true;
    shared_libs = [
        "libbase"
        "libicuuc"
        "libicui18n"
        "liblog"
        "libnativehelper"
    ];
    srcs = [
        "IcuUtilities.cpp"
        "JniConstants.cpp"
        "MatcherState.cpp"
        "Register.cpp"
        "com_android_icu_charset_NativeConverter.cpp"
        "com_android_icu_util_CaseMapperNative.cpp"
        "com_android_icu_util_ICU4CMetadata.cpp"
        "com_android_icu_util_LocaleNative.cpp"
        "com_android_icu_util_regex_MatcherNative.cpp"
        "com_android_icu_util_regex_PatternNative.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    cppflags = ["-DU_USING_ICU_NAMESPACE=0"];
    target = {
        android = {
            cflags = [
                #  -DANDROID_LINK_SHARED_ICU4C to enable access to the full ICU4C.
                #  See external/icu/android_icu4c/include/uconfig_local.h
                #  for more information.
                "-DANDROID_LINK_SHARED_ICU4C"
            ];
        };
    };
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

in { inherit _missingName libicu_jni; }
