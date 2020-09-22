{ android_test_helper_app, java_defaults }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsAppEnumerationQueriesDefaults = java_defaults {
    name = "CtsAppEnumerationQueriesDefaults";
    srcs = [
        "src/android/appenumeration/cts/query/TestActivity.java"
        "src/android/appenumeration/cts/query/TestProvider.java"
    ];
    static_libs = ["CtsAppEnumerationTestLib"];
    sdk_version = "test_current";
};

CtsAppEnumerationQueriesNothing = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothing";
    manifest = "AndroidManifest-queriesNothing.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingReceivesUri = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingReceivesUri";
    manifest = "AndroidManifest-queriesNothing-receivesUri.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingReceivesPermissionProtectedUri = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingReceivesPermissionProtectedUri";
    manifest = "AndroidManifest-queriesNothing-receivesPermissionProtectedUri.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingSeesInstaller = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingSeesInstaller";
    manifest = "AndroidManifest-queriesNothing-seesInstaller.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesActivityViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesActivityViaAction";
    manifest = "AndroidManifest-queriesActivityAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesServiceViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesServiceViaAction";
    manifest = "AndroidManifest-queriesServiceAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesProviderViaAuthority = android_test_helper_app {
    name = "CtsAppEnumerationQueriesProviderViaAuthority";
    manifest = "AndroidManifest-queriesProviderAuthority.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesProviderViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesProviderViaAction";
    manifest = "AndroidManifest-queriesProviderAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesUnexportedActivityViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesUnexportedActivityViaAction";
    manifest = "AndroidManifest-queriesUnexportedActivityAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesUnexportedServiceViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesUnexportedServiceViaAction";
    manifest = "AndroidManifest-queriesUnexportedServiceAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesUnexportedProviderViaAuthority = android_test_helper_app {
    name = "CtsAppEnumerationQueriesUnexportedProviderViaAuthority";
    manifest = "AndroidManifest-queriesUnexportedProviderAuthority.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesUnexportedProviderViaAction = android_test_helper_app {
    name = "CtsAppEnumerationQueriesUnexportedProviderViaAction";
    manifest = "AndroidManifest-queriesUnexportedProviderAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesPackage = android_test_helper_app {
    name = "CtsAppEnumerationQueriesPackage";
    manifest = "AndroidManifest-queriesPackage.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingTargetsQ = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingTargetsQ";
    manifest = "AndroidManifest-queriesNothing-targetsQ.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingHasPermission = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingHasPermission";
    manifest = "AndroidManifest-queriesNothing-hasPermission.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationQueriesNothingHasProvider = android_test_helper_app {
    name = "CtsAppEnumerationQueriesNothingHasProvider";
    manifest = "AndroidManifest-queriesNothing-hasProvider.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationSharedUidSource = android_test_helper_app {
    name = "CtsAppEnumerationSharedUidSource";
    manifest = "AndroidManifest-queriesNothing-sharedUser.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardActionSource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardActionSource";
    manifest = "AndroidManifest-queriesWildcardAction.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardBrowsableActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardBrowsableActivitySource";
    manifest = "AndroidManifest-queriesWildcard-browsableActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardContactsActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardContactsActivitySource";
    manifest = "AndroidManifest-queriesWildcard-contactsActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardDocumentEditorActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardDocumentEditorActivitySource";
    manifest = "AndroidManifest-queriesWildcard-documentEditorActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardShareActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardShareActivitySource";
    manifest = "AndroidManifest-queriesWildcard-shareActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardWebActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardWebActivitySource";
    manifest = "AndroidManifest-queriesWildcard-webActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsAppEnumerationWildcardBrowserActivitySource = android_test_helper_app {
    name = "CtsAppEnumerationWildcardBrowserActivitySource";
    manifest = "AndroidManifest-queriesWildcard-browserActivity.xml";
    defaults = ["CtsAppEnumerationQueriesDefaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAppEnumerationQueriesActivityViaAction CtsAppEnumerationQueriesDefaults CtsAppEnumerationQueriesNothing CtsAppEnumerationQueriesNothingHasPermission CtsAppEnumerationQueriesNothingHasProvider CtsAppEnumerationQueriesNothingReceivesPermissionProtectedUri CtsAppEnumerationQueriesNothingReceivesUri CtsAppEnumerationQueriesNothingSeesInstaller CtsAppEnumerationQueriesNothingTargetsQ CtsAppEnumerationQueriesPackage CtsAppEnumerationQueriesProviderViaAction CtsAppEnumerationQueriesProviderViaAuthority CtsAppEnumerationQueriesServiceViaAction CtsAppEnumerationQueriesUnexportedActivityViaAction CtsAppEnumerationQueriesUnexportedProviderViaAction CtsAppEnumerationQueriesUnexportedProviderViaAuthority CtsAppEnumerationQueriesUnexportedServiceViaAction CtsAppEnumerationSharedUidSource CtsAppEnumerationWildcardActionSource CtsAppEnumerationWildcardBrowsableActivitySource CtsAppEnumerationWildcardBrowserActivitySource CtsAppEnumerationWildcardContactsActivitySource CtsAppEnumerationWildcardDocumentEditorActivitySource CtsAppEnumerationWildcardShareActivitySource CtsAppEnumerationWildcardWebActivitySource; }
