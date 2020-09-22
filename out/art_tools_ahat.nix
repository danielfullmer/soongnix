{ droiddoc_host, java_binary_host, java_test_helper_library }:
let

#  Copyright 2018 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

ahat-docs = droiddoc_host {
    name = "ahat-docs";
    srcs = [
        "src/main/com/android/ahat/AhatHandler.java"
        "src/main/com/android/ahat/AhatHttpHandler.java"
        "src/main/com/android/ahat/AsciiProgress.java"
        "src/main/com/android/ahat/BitmapHandler.java"
        "src/main/com/android/ahat/Column.java"
        "src/main/com/android/ahat/Doc.java"
        "src/main/com/android/ahat/DocString.java"
        "src/main/com/android/ahat/DominatedList.java"
        "src/main/com/android/ahat/HeapTable.java"
        "src/main/com/android/ahat/HtmlDoc.java"
        "src/main/com/android/ahat/HtmlEscaper.java"
        "src/main/com/android/ahat/Main.java"
        "src/main/com/android/ahat/Menu.java"
        "src/main/com/android/ahat/ObjectHandler.java"
        "src/main/com/android/ahat/ObjectsHandler.java"
        "src/main/com/android/ahat/OverviewHandler.java"
        "src/main/com/android/ahat/Query.java"
        "src/main/com/android/ahat/RootedHandler.java"
        "src/main/com/android/ahat/SiteHandler.java"
        "src/main/com/android/ahat/SitePrinter.java"
        "src/main/com/android/ahat/SizeTable.java"
        "src/main/com/android/ahat/StaticHandler.java"
        "src/main/com/android/ahat/SubsetSelector.java"
        "src/main/com/android/ahat/Summarizer.java"
        "src/main/com/android/ahat/dominators/Dominators.java"
        "src/main/com/android/ahat/dominators/DominatorsComputation.java"
        "src/main/com/android/ahat/heapdump/AhatArrayInstance.java"
        "src/main/com/android/ahat/heapdump/AhatClassInstance.java"
        "src/main/com/android/ahat/heapdump/AhatClassObj.java"
        "src/main/com/android/ahat/heapdump/AhatHeap.java"
        "src/main/com/android/ahat/heapdump/AhatInstance.java"
        "src/main/com/android/ahat/heapdump/AhatPlaceHolderClassObj.java"
        "src/main/com/android/ahat/heapdump/AhatPlaceHolderInstance.java"
        "src/main/com/android/ahat/heapdump/AhatSnapshot.java"
        "src/main/com/android/ahat/heapdump/Diff.java"
        "src/main/com/android/ahat/heapdump/DiffFields.java"
        "src/main/com/android/ahat/heapdump/Diffable.java"
        "src/main/com/android/ahat/heapdump/DiffedFieldValue.java"
        "src/main/com/android/ahat/heapdump/DominatorReferenceIterator.java"
        "src/main/com/android/ahat/heapdump/Field.java"
        "src/main/com/android/ahat/heapdump/FieldValue.java"
        "src/main/com/android/ahat/heapdump/HprofFormatException.java"
        "src/main/com/android/ahat/heapdump/Instances.java"
        "src/main/com/android/ahat/heapdump/Parser.java"
        "src/main/com/android/ahat/heapdump/PathElement.java"
        "src/main/com/android/ahat/heapdump/Reachability.java"
        "src/main/com/android/ahat/heapdump/Reference.java"
        "src/main/com/android/ahat/heapdump/RootType.java"
        "src/main/com/android/ahat/heapdump/Site.java"
        "src/main/com/android/ahat/heapdump/Size.java"
        "src/main/com/android/ahat/heapdump/SkipNullsIterator.java"
        "src/main/com/android/ahat/heapdump/Sort.java"
        "src/main/com/android/ahat/heapdump/SuperRoot.java"
        "src/main/com/android/ahat/heapdump/Type.java"
        "src/main/com/android/ahat/heapdump/Value.java"
        "src/main/com/android/ahat/progress/NullProgress.java"
        "src/main/com/android/ahat/progress/Progress.java"
        "src/main/com/android/ahat/proguard/ProguardMap.java"
    ];
    custom_template = "droiddoc-templates-sdk";
    args = "-stubpackages com.android.ahat:com.android.ahat.*";
    check_api = {
        current = {
            api_file = "etc/ahat_api.txt";
            removed_api_file = "etc/ahat_removed_api.txt";
        };
    };
};

#  --- ahat.jar ----------------
ahat = java_binary_host {
    name = "ahat";
    visibility = [
        "//libcore/metrictests/memory/host"
    ];
    wrapper = "ahat";
    srcs = [
        "src/main/com/android/ahat/AhatHandler.java"
        "src/main/com/android/ahat/AhatHttpHandler.java"
        "src/main/com/android/ahat/AsciiProgress.java"
        "src/main/com/android/ahat/BitmapHandler.java"
        "src/main/com/android/ahat/Column.java"
        "src/main/com/android/ahat/Doc.java"
        "src/main/com/android/ahat/DocString.java"
        "src/main/com/android/ahat/DominatedList.java"
        "src/main/com/android/ahat/HeapTable.java"
        "src/main/com/android/ahat/HtmlDoc.java"
        "src/main/com/android/ahat/HtmlEscaper.java"
        "src/main/com/android/ahat/Main.java"
        "src/main/com/android/ahat/Menu.java"
        "src/main/com/android/ahat/ObjectHandler.java"
        "src/main/com/android/ahat/ObjectsHandler.java"
        "src/main/com/android/ahat/OverviewHandler.java"
        "src/main/com/android/ahat/Query.java"
        "src/main/com/android/ahat/RootedHandler.java"
        "src/main/com/android/ahat/SiteHandler.java"
        "src/main/com/android/ahat/SitePrinter.java"
        "src/main/com/android/ahat/SizeTable.java"
        "src/main/com/android/ahat/StaticHandler.java"
        "src/main/com/android/ahat/SubsetSelector.java"
        "src/main/com/android/ahat/Summarizer.java"
        "src/main/com/android/ahat/dominators/Dominators.java"
        "src/main/com/android/ahat/dominators/DominatorsComputation.java"
        "src/main/com/android/ahat/heapdump/AhatArrayInstance.java"
        "src/main/com/android/ahat/heapdump/AhatClassInstance.java"
        "src/main/com/android/ahat/heapdump/AhatClassObj.java"
        "src/main/com/android/ahat/heapdump/AhatHeap.java"
        "src/main/com/android/ahat/heapdump/AhatInstance.java"
        "src/main/com/android/ahat/heapdump/AhatPlaceHolderClassObj.java"
        "src/main/com/android/ahat/heapdump/AhatPlaceHolderInstance.java"
        "src/main/com/android/ahat/heapdump/AhatSnapshot.java"
        "src/main/com/android/ahat/heapdump/Diff.java"
        "src/main/com/android/ahat/heapdump/DiffFields.java"
        "src/main/com/android/ahat/heapdump/Diffable.java"
        "src/main/com/android/ahat/heapdump/DiffedFieldValue.java"
        "src/main/com/android/ahat/heapdump/DominatorReferenceIterator.java"
        "src/main/com/android/ahat/heapdump/Field.java"
        "src/main/com/android/ahat/heapdump/FieldValue.java"
        "src/main/com/android/ahat/heapdump/HprofFormatException.java"
        "src/main/com/android/ahat/heapdump/Instances.java"
        "src/main/com/android/ahat/heapdump/Parser.java"
        "src/main/com/android/ahat/heapdump/PathElement.java"
        "src/main/com/android/ahat/heapdump/Reachability.java"
        "src/main/com/android/ahat/heapdump/Reference.java"
        "src/main/com/android/ahat/heapdump/RootType.java"
        "src/main/com/android/ahat/heapdump/Site.java"
        "src/main/com/android/ahat/heapdump/Size.java"
        "src/main/com/android/ahat/heapdump/SkipNullsIterator.java"
        "src/main/com/android/ahat/heapdump/Sort.java"
        "src/main/com/android/ahat/heapdump/SuperRoot.java"
        "src/main/com/android/ahat/heapdump/Type.java"
        "src/main/com/android/ahat/heapdump/Value.java"
        "src/main/com/android/ahat/progress/NullProgress.java"
        "src/main/com/android/ahat/progress/Progress.java"
        "src/main/com/android/ahat/proguard/ProguardMap.java"
    ];
    manifest = "etc/ahat.mf";
    java_resources = ["etc/style.css"];
    javacflags = ["-Xdoclint:all/protected"];
};

#  --- ahat-test-dump.jar --------------
ahat-test-dump = java_test_helper_library {
    name = "ahat-test-dump";
    srcs = [
        "src/test-dump/DumpedStuff.java"
        "src/test-dump/Main.java"
        "src/test-dump/SuperDumpedStuff.java"
        "src/test-dump/android/os/Binder.java"
        "src/test-dump/android/os/BinderProxy.java"
        "src/test-dump/android/os/IBinder.java"
    ];
    sdk_version = "core_platform";
    optimize = {
        obfuscate = true;
        enabled = true;
        proguard_flags_files = ["etc/test-dump.pro"];
    };
};

#  --- ahat-ri-test-dump.jar -------
ahat-ri-test-dump = java_test_helper_library {
    host_supported = true;
    device_supported = false;
    name = "ahat-ri-test-dump";
    srcs = [
        "src/ri-test-dump/DumpedStuff.java"
        "src/ri-test-dump/Main.java"
    ];
};

in { inherit ahat ahat-docs ahat-ri-test-dump ahat-test-dump; }
