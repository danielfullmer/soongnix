{ }:
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

#  NOTE: NONE_OF_THESE_TARGETS_ACTUALLY_WORK. AAPT2 doesn't seem to be able to skip
#  errors within tag attributes. This is here as an reference of how to build the test apps, but
#  they will have to built manually and checked into the tree as prebuilts. A modified version of
#  AAPT2 is necessary to build the broken APKs.

#  android_test_helper_app {
#      name: "PackageParsingTestAppEmptyActionSdkQ",
#      manifest: "AndroidManifestEmptyAction.xml",
#      srcs: ["**/*.kt"],
#      min_sdk_version: "28",
#      target_sdk_version: "29",
#      aaptflags: ["--warn-manifest-validation"],
#  }

#  android_test_helper_app {
#      name: "PackageParsingTestAppEmptyActionSdkR",
#      manifest: "AndroidManifestEmptyAction.xml",
#      srcs: ["**/*.kt"],
#      min_sdk_version: "28",
#      target_sdk_version: "30",
#      aaptflags: ["--warn-manifest-validation"],
#  }

#  android_test_helper_app {
#      name: "PackageParsingTestAppEmptyCategorySdkQ",
#      manifest: "AndroidManifestEmptyCategory.xml",
#      srcs: ["**/*.kt"],
#      min_sdk_version: "28",
#      target_sdk_version: "29",
#      aaptflags: ["--warn-manifest-validation"],
#  }

#  android_test_helper_app {
#      name: "PackageParsingTestAppEmptyCategorySdkR",
#      manifest: "AndroidManifestEmptyCategory.xml",
#      srcs: ["**/*.kt"],
#      min_sdk_version: "28",
#      target_sdk_version: "30",
#      aaptflags: ["--warn-manifest-validation"],
#  }

#  android_test_helper_app {
#      name: "PackageParsingTestAppMissingAppSdkQ",
#      manifest: "AndroidManifestMissingApp.xml",
#      min_sdk_version: "28",
#      target_sdk_version: "29",
#      aaptflags: ["--warn-manifest-validation"],
#  }

#  android_test_helper_app {
#      name: "PackageParsingTestAppMissingAppSdkR",
#      manifest: "AndroidManifestMissingApp.xml",
#      min_sdk_version: "28",
#      target_sdk_version: "30",
#      aaptflags: ["--warn-manifest-validation"],
#  }

in { }
