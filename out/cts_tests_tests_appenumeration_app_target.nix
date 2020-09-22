{ android_test_helper_app }:
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

CtsAppEnumerationForceQueryable = android_test_helper_app {
    name = "CtsAppEnumerationForceQueryable";
    manifest = "AndroidManifest-forceQueryable.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationFilters = android_test_helper_app {
    name = "CtsAppEnumerationFilters";
    manifest = "AndroidManifest-filters.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationNoApi = android_test_helper_app {
    name = "CtsAppEnumerationNoApi";
    manifest = "AndroidManifest-noapi.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationSharedUidTarget = android_test_helper_app {
    name = "CtsAppEnumerationSharedUidTarget";
    manifest = "AndroidManifest-noapi-sharedUser.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationContactsActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationContactsActivityTarget";
    manifest = "AndroidManifest-contactsActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationDocumentsActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationDocumentsActivityTarget";
    manifest = "AndroidManifest-documentEditorActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationShareActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationShareActivityTarget";
    manifest = "AndroidManifest-shareActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationWebActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationWebActivityTarget";
    manifest = "AndroidManifest-webActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationBrowserActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationBrowserActivityTarget";
    manifest = "AndroidManifest-browserActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsAppEnumerationBrowserWildcardActivityTarget = android_test_helper_app {
    name = "CtsAppEnumerationBrowserWildcardActivityTarget";
    manifest = "AndroidManifest-browserWildcardActivity.xml";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/appenumeration/testapp/DummyActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsAppEnumerationBrowserActivityTarget CtsAppEnumerationBrowserWildcardActivityTarget CtsAppEnumerationContactsActivityTarget CtsAppEnumerationDocumentsActivityTarget CtsAppEnumerationFilters CtsAppEnumerationForceQueryable CtsAppEnumerationNoApi CtsAppEnumerationShareActivityTarget CtsAppEnumerationSharedUidTarget CtsAppEnumerationWebActivityTarget; }
