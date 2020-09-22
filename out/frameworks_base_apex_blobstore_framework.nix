{ filegroup, java_library }:
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

framework-blobstore-sources = filegroup {
    name = "framework-blobstore-sources";
    srcs = [
        "java/android/app/blob/BlobHandle.java"
        "java/android/app/blob/BlobInfo.java"
        "java/android/app/blob/BlobStoreManager.java"
        "java/android/app/blob/BlobStoreManagerFrameworkInitializer.java"
        "java/android/app/blob/LeaseInfo.java"
        "java/android/app/blob/XmlTags.java"
        "java/android/app/blob/BlobHandle.aidl"
        "java/android/app/blob/BlobInfo.aidl"
        "java/android/app/blob/IBlobCommitCallback.aidl"
        "java/android/app/blob/IBlobStoreManager.aidl"
        "java/android/app/blob/IBlobStoreSession.aidl"
        "java/android/app/blob/LeaseInfo.aidl"
    ];
    path = "java";
};

blobstore-framework = java_library {
    name = "blobstore-framework";
    installable = false;
    compile_dex = true;
    sdk_version = "core_platform";
    srcs = [
        ":framework-blobstore-sources"
    ];
    aidl = {
        export_include_dirs = [
            "java"
        ];
    };
    libs = [
        "framework-minus-apex"
    ];
};

in { inherit blobstore-framework framework-blobstore-sources; }
