{ java_library }:
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

service-blobstore = java_library {
    name = "service-blobstore";
    installable = true;

    srcs = [
        "java/com/android/server/blob/BlobAccessMode.java"
        "java/com/android/server/blob/BlobMetadata.java"
        "java/com/android/server/blob/BlobStoreConfig.java"
        "java/com/android/server/blob/BlobStoreIdleJobService.java"
        "java/com/android/server/blob/BlobStoreManagerInternal.java"
        "java/com/android/server/blob/BlobStoreManagerService.java"
        "java/com/android/server/blob/BlobStoreManagerShellCommand.java"
        "java/com/android/server/blob/BlobStoreSession.java"
        "java/com/android/server/blob/BlobStoreUtils.java"
    ];

    libs = [
        "framework"
        "services.core"
        "services.usage"
    ];
};

in { inherit service-blobstore; }
