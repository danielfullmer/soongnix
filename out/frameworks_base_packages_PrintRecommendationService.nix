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

PrintRecommendationService = android_app {
    name = "PrintRecommendationService";
    srcs = [
        "src/com/android/printservice/recommendation/PrintServicePlugin.java"
        "src/com/android/printservice/recommendation/RecommendationServiceImpl.java"
        "src/com/android/printservice/recommendation/RemotePrintServicePlugin.java"
        "src/com/android/printservice/recommendation/plugin/google/CloudPrintPlugin.java"
        "src/com/android/printservice/recommendation/plugin/hp/HPRecommendationPlugin.java"
        "src/com/android/printservice/recommendation/plugin/hp/MDnsUtils.java"
        "src/com/android/printservice/recommendation/plugin/hp/ServiceListener.java"
        "src/com/android/printservice/recommendation/plugin/hp/ServiceRecommendationPlugin.java"
        "src/com/android/printservice/recommendation/plugin/hp/ServiceResolveQueue.java"
        "src/com/android/printservice/recommendation/plugin/hp/VendorInfo.java"
        "src/com/android/printservice/recommendation/plugin/mdnsFilter/MDNSFilterPlugin.java"
        "src/com/android/printservice/recommendation/plugin/mdnsFilter/VendorConfig.java"
        "src/com/android/printservice/recommendation/plugin/mopria/MopriaRecommendationPlugin.java"
        "src/com/android/printservice/recommendation/plugin/samsung/PrinterFilterMopria.java"
        "src/com/android/printservice/recommendation/plugin/samsung/PrinterFilterSamsung.java"
        "src/com/android/printservice/recommendation/plugin/samsung/SamsungRecommendationPlugin.java"
        "src/com/android/printservice/recommendation/plugin/xerox/MDnsUtils.java"
        "src/com/android/printservice/recommendation/plugin/xerox/ServiceResolver.java"
        "src/com/android/printservice/recommendation/plugin/xerox/VendorInfo.java"
        "src/com/android/printservice/recommendation/plugin/xerox/XeroxPrintServiceRecommendationPlugin.java"
        "src/com/android/printservice/recommendation/util/DiscoveryListenerMultiplexer.java"
        "src/com/android/printservice/recommendation/util/MDNSFilteredDiscovery.java"
        "src/com/android/printservice/recommendation/util/MDNSUtils.java"
        "src/com/android/printservice/recommendation/util/NsdResolveQueue.java"
        "src/com/android/printservice/recommendation/util/Preconditions.java"
        "src/com/android/printservice/recommendation/util/PrinterHashMap.java"
    ];
    sdk_version = "system_current";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

in { inherit PrintRecommendationService; }
