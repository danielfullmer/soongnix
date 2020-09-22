{ android_app }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

BuiltInPrintService = android_app {
    name = "BuiltInPrintService";
    privileged = true;
    srcs = [
        "src/com/android/bips/BuiltInPrintService.java"
        "src/com/android/bips/DelayedAction.java"
        "src/com/android/bips/ImagePrintActivity.java"
        "src/com/android/bips/ImageToPdfTask.java"
        "src/com/android/bips/JobQueue.java"
        "src/com/android/bips/LocalDiscoverySession.java"
        "src/com/android/bips/LocalDiscoverySessionInfo.java"
        "src/com/android/bips/LocalPrintJob.java"
        "src/com/android/bips/LocalPrinter.java"
        "src/com/android/bips/P2pPermissionManager.java"
        "src/com/android/bips/PdfPrintActivity.java"
        "src/com/android/bips/discovery/ConnectionListener.java"
        "src/com/android/bips/discovery/DelayedDiscovery.java"
        "src/com/android/bips/discovery/DiscoveredPrinter.java"
        "src/com/android/bips/discovery/Discovery.java"
        "src/com/android/bips/discovery/ManualDiscovery.java"
        "src/com/android/bips/discovery/MdnsDiscovery.java"
        "src/com/android/bips/discovery/MultiDiscovery.java"
        "src/com/android/bips/discovery/NsdResolveQueue.java"
        "src/com/android/bips/discovery/P2pDiscovery.java"
        "src/com/android/bips/discovery/SavedDiscovery.java"
        "src/com/android/bips/ipp/Backend.java"
        "src/com/android/bips/ipp/CancelJobTask.java"
        "src/com/android/bips/ipp/CapabilitiesCache.java"
        "src/com/android/bips/ipp/CertificateStore.java"
        "src/com/android/bips/ipp/GetCapabilitiesTask.java"
        "src/com/android/bips/ipp/JobStatus.java"
        "src/com/android/bips/ipp/StartJobTask.java"
        "src/com/android/bips/jni/BackendConstants.java"
        "src/com/android/bips/jni/JobCallback.java"
        "src/com/android/bips/jni/JobCallbackParams.java"
        "src/com/android/bips/jni/LocalJobParams.java"
        "src/com/android/bips/jni/LocalPrinterCapabilities.java"
        "src/com/android/bips/jni/MediaSizes.java"
        "src/com/android/bips/jni/PdfRender.java"
        "src/com/android/bips/jni/SizeD.java"
        "src/com/android/bips/p2p/P2pConnectionListener.java"
        "src/com/android/bips/p2p/P2pConnectionProcedure.java"
        "src/com/android/bips/p2p/P2pDiscoveryProcedure.java"
        "src/com/android/bips/p2p/P2pMonitor.java"
        "src/com/android/bips/p2p/P2pPeerListener.java"
        "src/com/android/bips/p2p/P2pPrinterConnection.java"
        "src/com/android/bips/p2p/P2pUtils.java"
        "src/com/android/bips/render/PdfRenderService.java"
        "src/com/android/bips/ui/AddManualPrinterDialog.java"
        "src/com/android/bips/ui/AddP2pPrinterDialog.java"
        "src/com/android/bips/ui/AddPrintersActivity.java"
        "src/com/android/bips/ui/AddPrintersFragment.java"
        "src/com/android/bips/ui/FindP2pPrintersFragment.java"
        "src/com/android/bips/ui/MoreOptionsActivity.java"
        "src/com/android/bips/ui/MoreOptionsFragment.java"
        "src/com/android/bips/ui/PrinterPreference.java"
        "src/com/android/bips/util/BroadcastMonitor.java"
        "src/com/android/bips/util/FileUtils.java"
        "src/com/android/bips/util/PriorityLock.java"
        "src/com/android/bips/util/WifiMonitor.java"
        "src/com/android/bips/render/IPdfRender.aidl"
    ];
    resource_dirs = ["res"];
    sdk_version = "system_current";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    jni_libs = [
        "libwfds"
        "libcups"
    ];
};

in { inherit BuiltInPrintService; }
