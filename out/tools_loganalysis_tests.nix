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

loganalysis-tests = java_library_host {
    name = "loganalysis-tests";
    defaults = ["tradefed_defaults"];

    #  Only compile source java files in this lib.
    srcs = [
        "src/com/android/loganalysis/FuncTests.java"
        "src/com/android/loganalysis/UnitTests.java"
        "src/com/android/loganalysis/item/BatteryDischargeItemTest.java"
        "src/com/android/loganalysis/item/BatteryUsageItemTest.java"
        "src/com/android/loganalysis/item/DumpsysPackageStatsItemTest.java"
        "src/com/android/loganalysis/item/DvmLockSampleItemTest.java"
        "src/com/android/loganalysis/item/GenericItemTest.java"
        "src/com/android/loganalysis/item/InterruptItemTest.java"
        "src/com/android/loganalysis/item/LocationDumpsItemTest.java"
        "src/com/android/loganalysis/item/MemInfoItemTest.java"
        "src/com/android/loganalysis/item/MonkeyLogItemTest.java"
        "src/com/android/loganalysis/item/ProcrankItemTest.java"
        "src/com/android/loganalysis/item/SmartMonkeyLogItemTest.java"
        "src/com/android/loganalysis/item/SystemPropsItemTest.java"
        "src/com/android/loganalysis/item/TopItemTest.java"
        "src/com/android/loganalysis/item/WakelockItemTest.java"
        "src/com/android/loganalysis/parser/AbstractSectionParserTest.java"
        "src/com/android/loganalysis/parser/ActivityServiceParserTest.java"
        "src/com/android/loganalysis/parser/AnrParserTest.java"
        "src/com/android/loganalysis/parser/BatteryDischargeStatsInfoParserTest.java"
        "src/com/android/loganalysis/parser/BatteryStatsDetailedInfoParserTest.java"
        "src/com/android/loganalysis/parser/BatteryStatsSummaryInfoParserTest.java"
        "src/com/android/loganalysis/parser/BatteryUsageParserTest.java"
        "src/com/android/loganalysis/parser/BugreportParserFuncTest.java"
        "src/com/android/loganalysis/parser/BugreportParserTest.java"
        "src/com/android/loganalysis/parser/CompactMemInfoParserTest.java"
        "src/com/android/loganalysis/parser/CpuInfoParserTest.java"
        "src/com/android/loganalysis/parser/DmesgParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysBatteryStatsParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysPackageStatsParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysProcStatsParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysProcessMeminfoParserTest.java"
        "src/com/android/loganalysis/parser/DumpsysWifiStatsParserTest.java"
        "src/com/android/loganalysis/parser/DvmLockSampleParserTest.java"
        "src/com/android/loganalysis/parser/EventsLogParserTest.java"
        "src/com/android/loganalysis/parser/GfxInfoParserTest.java"
        "src/com/android/loganalysis/parser/InterruptParserTest.java"
        "src/com/android/loganalysis/parser/JavaCrashParserTest.java"
        "src/com/android/loganalysis/parser/KernelLogParserTest.java"
        "src/com/android/loganalysis/parser/LocationServiceParserTest.java"
        "src/com/android/loganalysis/parser/LogcatParserFuncTest.java"
        "src/com/android/loganalysis/parser/LogcatParserTest.java"
        "src/com/android/loganalysis/parser/MemHealthParserTest.java"
        "src/com/android/loganalysis/parser/MemInfoParserTest.java"
        "src/com/android/loganalysis/parser/MonkeyLogParserFuncTest.java"
        "src/com/android/loganalysis/parser/MonkeyLogParserTest.java"
        "src/com/android/loganalysis/parser/NativeCrashParserTest.java"
        "src/com/android/loganalysis/parser/ProcessUsageParserTest.java"
        "src/com/android/loganalysis/parser/ProcrankParserTest.java"
        "src/com/android/loganalysis/parser/QtaguidParserTest.java"
        "src/com/android/loganalysis/parser/SmartMonkeyLogParserTest.java"
        "src/com/android/loganalysis/parser/SystemPropsParserTest.java"
        "src/com/android/loganalysis/parser/TimingsLogParserTest.java"
        "src/com/android/loganalysis/parser/TopParserTest.java"
        "src/com/android/loganalysis/parser/TraceFormatParserTest.java"
        "src/com/android/loganalysis/parser/TracesParserTest.java"
        "src/com/android/loganalysis/parser/WakelockParserTest.java"
        "src/com/android/loganalysis/rule/InterruptRuleTest.java"
        "src/com/android/loganalysis/rule/LocationUsageRuleTest.java"
        "src/com/android/loganalysis/rule/ProcessUsageRuleTest.java"
        "src/com/android/loganalysis/rule/WakelockRuleTest.java"
        "src/com/android/loganalysis/rule/WifiStatsRuleTest.java"
        "src/com/android/loganalysis/util/ArrayUtilTest.java"
        "src/com/android/loganalysis/util/LogPatternUtilTest.java"
        "src/com/android/loganalysis/util/LogTailUtilTest.java"
        "src/com/android/loganalysis/util/RegexTrieTest.java"
        "src/com/android/loganalysis/util/config/ArgsOptionParserTest.java"
        "src/com/android/loganalysis/util/config/OptionSetterTest.java"
        "src/com/android/loganalysis/util/config/OptionUpdateRuleTest.java"
    ];

    libs = [
        "loganalysis"
        "json-prebuilt"
        "junit-host"
        "easymock"
    ];
};

in { inherit loganalysis-tests; }
