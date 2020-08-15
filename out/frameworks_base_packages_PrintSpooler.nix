{ android_app }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

PrintSpooler = android_app {
    name = "PrintSpooler";

    resource_dirs = ["res"];

    srcs = [
        "src/com/android/printspooler/model/CustomPrinterIconCache.java"
        "src/com/android/printspooler/model/MutexFileProvider.java"
        "src/com/android/printspooler/model/NotificationController.java"
        "src/com/android/printspooler/model/OpenDocumentCallback.java"
        "src/com/android/printspooler/model/PageContentRepository.java"
        "src/com/android/printspooler/model/PrintSpoolerProvider.java"
        "src/com/android/printspooler/model/PrintSpoolerService.java"
        "src/com/android/printspooler/model/RemotePrintDocument.java"
        "src/com/android/printspooler/renderer/PdfManipulationService.java"
        "src/com/android/printspooler/ui/AddPrinterActivity.java"
        "src/com/android/printspooler/ui/FusedPrintersProvider.java"
        "src/com/android/printspooler/ui/PageAdapter.java"
        "src/com/android/printspooler/ui/PrintActivity.java"
        "src/com/android/printspooler/ui/PrintErrorFragment.java"
        "src/com/android/printspooler/ui/PrintPreviewController.java"
        "src/com/android/printspooler/ui/PrintProgressFragment.java"
        "src/com/android/printspooler/ui/PrinterRegistry.java"
        "src/com/android/printspooler/ui/SelectPrinterActivity.java"
        "src/com/android/printspooler/util/ApprovedPrintServices.java"
        "src/com/android/printspooler/util/BitmapSerializeUtils.java"
        "src/com/android/printspooler/util/MediaSizeUtils.java"
        "src/com/android/printspooler/util/PageRangeUtils.java"
        "src/com/android/printspooler/widget/ClickInterceptSpinner.java"
        "src/com/android/printspooler/widget/CustomErrorEditText.java"
        "src/com/android/printspooler/widget/EmbeddedContentContainer.java"
        "src/com/android/printspooler/widget/PageContentView.java"
        "src/com/android/printspooler/widget/PreviewPageFrame.java"
        "src/com/android/printspooler/widget/PrintContentView.java"
        "src/com/android/printspooler/widget/PrintOptionsLayout.java"
        "src/com/android/printspooler/renderer/IPdfRenderer.aidl"
        "src/com/android/printspooler/renderer/IPdfEditor.aidl"
    ];

    platform_apis = true;

    jni_libs = ["libprintspooler_jni"];
    static_libs = [
        "android-support-v7-recyclerview"
        "android-support-compat"
        "android-support-media-compat"
        "android-support-core-utils"
        "android-support-core-ui"
        "android-support-fragment"
        "android-support-annotations"
    ];
};

in { inherit PrintSpooler; }
