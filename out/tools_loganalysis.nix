{ java_library_host }:
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

loganalysis = java_library_host {
    name = "loganalysis";
    defaults = ["tradefed_defaults"];

    srcs = [
        "src/com/android/loganalysis/LogAnalyzer.java"
        "src/com/android/loganalysis/item/ActivityServiceItem.java"
        "src/com/android/loganalysis/item/AnrItem.java"
        "src/com/android/loganalysis/item/AppVersionItem.java"
        "src/com/android/loganalysis/item/BatteryDischargeItem.java"
        "src/com/android/loganalysis/item/BatteryDischargeStatsInfoItem.java"
        "src/com/android/loganalysis/item/BatteryStatsDetailedInfoItem.java"
        "src/com/android/loganalysis/item/BatteryStatsSummaryInfoItem.java"
        "src/com/android/loganalysis/item/BatteryUsageItem.java"
        "src/com/android/loganalysis/item/BugreportItem.java"
        "src/com/android/loganalysis/item/CompactMemInfoItem.java"
        "src/com/android/loganalysis/item/ConflictingItemException.java"
        "src/com/android/loganalysis/item/CpuInfoItem.java"
        "src/com/android/loganalysis/item/DmesgActionInfoItem.java"
        "src/com/android/loganalysis/item/DmesgItem.java"
        "src/com/android/loganalysis/item/DmesgServiceInfoItem.java"
        "src/com/android/loganalysis/item/DmesgStageInfoItem.java"
        "src/com/android/loganalysis/item/DumpsysBatteryStatsItem.java"
        "src/com/android/loganalysis/item/DumpsysItem.java"
        "src/com/android/loganalysis/item/DumpsysPackageStatsItem.java"
        "src/com/android/loganalysis/item/DumpsysProcStatsItem.java"
        "src/com/android/loganalysis/item/DumpsysProcessMeminfoItem.java"
        "src/com/android/loganalysis/item/DumpsysWifiStatsItem.java"
        "src/com/android/loganalysis/item/DvmLockSampleItem.java"
        "src/com/android/loganalysis/item/GenericItem.java"
        "src/com/android/loganalysis/item/GenericMapItem.java"
        "src/com/android/loganalysis/item/GfxInfoItem.java"
        "src/com/android/loganalysis/item/IItem.java"
        "src/com/android/loganalysis/item/InterruptItem.java"
        "src/com/android/loganalysis/item/JavaCrashItem.java"
        "src/com/android/loganalysis/item/KernelLogItem.java"
        "src/com/android/loganalysis/item/LatencyItem.java"
        "src/com/android/loganalysis/item/LocationDumpsItem.java"
        "src/com/android/loganalysis/item/LogcatItem.java"
        "src/com/android/loganalysis/item/LowMemoryKillerItem.java"
        "src/com/android/loganalysis/item/MemInfoItem.java"
        "src/com/android/loganalysis/item/MemoryHealthItem.java"
        "src/com/android/loganalysis/item/MiscKernelLogItem.java"
        "src/com/android/loganalysis/item/MiscLogcatItem.java"
        "src/com/android/loganalysis/item/MonkeyLogItem.java"
        "src/com/android/loganalysis/item/NativeCrashItem.java"
        "src/com/android/loganalysis/item/PageAllocationFailureItem.java"
        "src/com/android/loganalysis/item/ProcessUsageItem.java"
        "src/com/android/loganalysis/item/ProcrankItem.java"
        "src/com/android/loganalysis/item/QtaguidItem.java"
        "src/com/android/loganalysis/item/SELinuxItem.java"
        "src/com/android/loganalysis/item/SmartMonkeyLogItem.java"
        "src/com/android/loganalysis/item/SystemPropsItem.java"
        "src/com/android/loganalysis/item/TopItem.java"
        "src/com/android/loganalysis/item/TraceFormatItem.java"
        "src/com/android/loganalysis/item/TracesItem.java"
        "src/com/android/loganalysis/item/TransitionDelayItem.java"
        "src/com/android/loganalysis/item/WakelockItem.java"
        "src/com/android/loganalysis/parser/AbstractSectionParser.java"
        "src/com/android/loganalysis/parser/ActivityServiceParser.java"
        "src/com/android/loganalysis/parser/AnrParser.java"
        "src/com/android/loganalysis/parser/BatteryDischargeStatsInfoParser.java"
        "src/com/android/loganalysis/parser/BatteryStatsDetailedInfoParser.java"
        "src/com/android/loganalysis/parser/BatteryStatsSummaryInfoParser.java"
        "src/com/android/loganalysis/parser/BatteryUsageParser.java"
        "src/com/android/loganalysis/parser/BugreportParser.java"
        "src/com/android/loganalysis/parser/CompactMemInfoParser.java"
        "src/com/android/loganalysis/parser/CpuInfoParser.java"
        "src/com/android/loganalysis/parser/DmesgParser.java"
        "src/com/android/loganalysis/parser/DumpsysBatteryStatsParser.java"
        "src/com/android/loganalysis/parser/DumpsysPackageStatsParser.java"
        "src/com/android/loganalysis/parser/DumpsysParser.java"
        "src/com/android/loganalysis/parser/DumpsysProcStatsParser.java"
        "src/com/android/loganalysis/parser/DumpsysProcessMeminfoParser.java"
        "src/com/android/loganalysis/parser/DumpsysWifiStatsParser.java"
        "src/com/android/loganalysis/parser/DvmLockSampleParser.java"
        "src/com/android/loganalysis/parser/EventsLogParser.java"
        "src/com/android/loganalysis/parser/GfxInfoParser.java"
        "src/com/android/loganalysis/parser/IParser.java"
        "src/com/android/loganalysis/parser/InterruptParser.java"
        "src/com/android/loganalysis/parser/JavaCrashParser.java"
        "src/com/android/loganalysis/parser/KernelLogParser.java"
        "src/com/android/loganalysis/parser/LocationServiceParser.java"
        "src/com/android/loganalysis/parser/LogcatParser.java"
        "src/com/android/loganalysis/parser/MemInfoParser.java"
        "src/com/android/loganalysis/parser/MemoryHealthParser.java"
        "src/com/android/loganalysis/parser/MonkeyLogParser.java"
        "src/com/android/loganalysis/parser/NativeCrashParser.java"
        "src/com/android/loganalysis/parser/NoopParser.java"
        "src/com/android/loganalysis/parser/ProcessUsageParser.java"
        "src/com/android/loganalysis/parser/ProcrankParser.java"
        "src/com/android/loganalysis/parser/QtaguidParser.java"
        "src/com/android/loganalysis/parser/SmartMonkeyLogParser.java"
        "src/com/android/loganalysis/parser/SystemPropsParser.java"
        "src/com/android/loganalysis/parser/TopParser.java"
        "src/com/android/loganalysis/parser/TraceFormatParser.java"
        "src/com/android/loganalysis/parser/TracesParser.java"
        "src/com/android/loganalysis/parser/WakelockParser.java"
        "src/com/android/loganalysis/rule/AbstractPowerRule.java"
        "src/com/android/loganalysis/rule/IRule.java"
        "src/com/android/loganalysis/rule/InterruptRule.java"
        "src/com/android/loganalysis/rule/LocationUsageRule.java"
        "src/com/android/loganalysis/rule/ProcessUsageRule.java"
        "src/com/android/loganalysis/rule/RuleEngine.java"
        "src/com/android/loganalysis/rule/WakelockRule.java"
        "src/com/android/loganalysis/rule/WifiStatsRule.java"
        "src/com/android/loganalysis/util/ArrayUtil.java"
        "src/com/android/loganalysis/util/LogPatternUtil.java"
        "src/com/android/loganalysis/util/LogTailUtil.java"
        "src/com/android/loganalysis/util/NumberFormattingUtil.java"
        "src/com/android/loganalysis/util/RegexTrie.java"
        "src/com/android/loganalysis/util/config/ArgsOptionParser.java"
        "src/com/android/loganalysis/util/config/ConfigurationException.java"
        "src/com/android/loganalysis/util/config/Option.java"
        "src/com/android/loganalysis/util/config/OptionClass.java"
        "src/com/android/loganalysis/util/config/OptionSetter.java"
        "src/com/android/loganalysis/util/config/OptionUpdateRule.java"
    ];

    libs = [
        "guava"
        "junit"
        "json-prebuilt"
    ];
};

in { inherit loganalysis; }
