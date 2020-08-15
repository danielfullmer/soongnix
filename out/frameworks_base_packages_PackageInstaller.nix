{ android_app }:
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

PackageInstaller = android_app {
    name = "PackageInstaller";

    srcs = [
        "src/com/android/packageinstaller/DeleteStagedFileOnResult.java"
        "src/com/android/packageinstaller/DeviceUtils.java"
        "src/com/android/packageinstaller/EventResultPersister.java"
        "src/com/android/packageinstaller/InstallEventReceiver.java"
        "src/com/android/packageinstaller/InstallFailed.java"
        "src/com/android/packageinstaller/InstallInstalling.java"
        "src/com/android/packageinstaller/InstallStaging.java"
        "src/com/android/packageinstaller/InstallStart.java"
        "src/com/android/packageinstaller/InstallSuccess.java"
        "src/com/android/packageinstaller/PackageInstalledNotificationUtils.java"
        "src/com/android/packageinstaller/PackageInstalledReceiver.java"
        "src/com/android/packageinstaller/PackageInstallerActivity.java"
        "src/com/android/packageinstaller/PackageInstallerApplication.java"
        "src/com/android/packageinstaller/PackageUtil.java"
        "src/com/android/packageinstaller/RemoveReceiver.java"
        "src/com/android/packageinstaller/TemporaryFileManager.java"
        "src/com/android/packageinstaller/UninstallEventReceiver.java"
        "src/com/android/packageinstaller/UninstallFinish.java"
        "src/com/android/packageinstaller/UninstallUninstalling.java"
        "src/com/android/packageinstaller/UninstallerActivity.java"
        "src/com/android/packageinstaller/handheld/ErrorDialogFragment.java"
        "src/com/android/packageinstaller/handheld/UninstallAlertDialogFragment.java"
        "src/com/android/packageinstaller/television/ErrorFragment.java"
        "src/com/android/packageinstaller/television/UninstallAlertFragment.java"
        "src/com/android/packageinstaller/television/UninstallAppProgress.java"
        "src/com/android/packageinstaller/television/UninstallAppProgressFragment.java"
        "src/com/android/packageinstaller/wear/InstallTask.java"
        "src/com/android/packageinstaller/wear/InstallerConstants.java"
        "src/com/android/packageinstaller/wear/PackageInstallerFactory.java"
        "src/com/android/packageinstaller/wear/PackageInstallerImpl.java"
        "src/com/android/packageinstaller/wear/WearPackageArgs.java"
        "src/com/android/packageinstaller/wear/WearPackageIconProvider.java"
        "src/com/android/packageinstaller/wear/WearPackageInstallerService.java"
        "src/com/android/packageinstaller/wear/WearPackageUtil.java"
    ];

    certificate = "platform";
    privileged = true;
    platform_apis = true;

    static_libs = [
        "xz-java"
        "androidx.leanback_leanback"
    ];
};

in { inherit PackageInstaller; }
