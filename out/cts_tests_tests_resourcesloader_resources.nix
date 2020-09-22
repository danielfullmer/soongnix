{ android_test_helper_app, genrule }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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
#

CtsResourcesLoaderTests_ProviderOne = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderOne";
    manifest = "AndroidManifestApp.xml";
    asset_dirs = ["provider1/assets"];
    resource_dirs = [
        "provider1/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderTwo = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderTwo";
    manifest = "AndroidManifestApp.xml";
    asset_dirs = ["provider2/assets"];
    resource_dirs = [
        "provider2/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderThree = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderThree";
    manifest = "AndroidManifestApp.xml";
    asset_dirs = ["provider3/assets"];
    resource_dirs = [
        "provider3/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderFour = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderFour";
    manifest = "AndroidManifestApp.xml";
    asset_dirs = ["provider4/assets"];
    resource_dirs = [
        "provider4/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

#  Resources.arsc(s)

CtsResourcesLoaderTests_ProviderOne_ARSC = genrule {
    name = "CtsResourcesLoaderTests_ProviderOne_ARSC";
    srcs = [":CtsResourcesLoaderTests_ProviderOne"];
    cmd = "unzip $(in) resources.arsc -d $(genDir) && " +
        " mv $(genDir)/resources.arsc $(genDir)/CtsResourcesLoaderTests_ProviderOne.arsc";
    out = ["CtsResourcesLoaderTests_ProviderOne.arsc"];
};

CtsResourcesLoaderTests_ProviderTwo_ARSC = genrule {
    name = "CtsResourcesLoaderTests_ProviderTwo_ARSC";
    srcs = [":CtsResourcesLoaderTests_ProviderTwo"];
    cmd = "unzip $(in) resources.arsc -d $(genDir) && " +
        " mv $(genDir)/resources.arsc $(genDir)/CtsResourcesLoaderTests_ProviderTwo.arsc";
    out = ["CtsResourcesLoaderTests_ProviderTwo.arsc"];
};

CtsResourcesLoaderTests_ProviderThree_ARSC = genrule {
    name = "CtsResourcesLoaderTests_ProviderThree_ARSC";
    srcs = [":CtsResourcesLoaderTests_ProviderThree"];
    cmd = "unzip $(in) resources.arsc -d $(genDir) && " +
        " mv $(genDir)/resources.arsc $(genDir)/CtsResourcesLoaderTests_ProviderThree.arsc";
    out = ["CtsResourcesLoaderTests_ProviderThree.arsc"];
};

CtsResourcesLoaderTests_ProviderFour_ARSC = genrule {
    name = "CtsResourcesLoaderTests_ProviderFour_ARSC";
    srcs = [":CtsResourcesLoaderTests_ProviderFour"];
    cmd = "unzip $(in) resources.arsc -d $(genDir) && " +
        " mv $(genDir)/resources.arsc $(genDir)/CtsResourcesLoaderTests_ProviderFour.arsc";
    out = ["CtsResourcesLoaderTests_ProviderFour.arsc"];
};

#  Split APKs

CtsResourcesLoaderTests_ProviderOne_Split = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderOne_Split";
    manifest = "AndroidManifestSplit1.xml";
    asset_dirs = ["provider1/assets"];
    resource_dirs = [
        "provider1/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderTwo_Split = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderTwo_Split";
    manifest = "AndroidManifestSplit2.xml";
    asset_dirs = ["provider2/assets"];
    resource_dirs = [
        "provider2/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderThree_Split = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderThree_Split";
    manifest = "AndroidManifestSplit3.xml";
    asset_dirs = ["provider3/assets"];
    resource_dirs = [
        "provider3/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

CtsResourcesLoaderTests_ProviderFour_Split = android_test_helper_app {
    name = "CtsResourcesLoaderTests_ProviderFour_Split";
    manifest = "AndroidManifestSplit4.xml";
    asset_dirs = ["provider4/assets"];
    resource_dirs = [
        "provider4/res"
        "provider_stable/res"
    ];
    aaptflags = ["-0 .txt"];
};

in { inherit CtsResourcesLoaderTests_ProviderFour CtsResourcesLoaderTests_ProviderFour_ARSC CtsResourcesLoaderTests_ProviderFour_Split CtsResourcesLoaderTests_ProviderOne CtsResourcesLoaderTests_ProviderOne_ARSC CtsResourcesLoaderTests_ProviderOne_Split CtsResourcesLoaderTests_ProviderThree CtsResourcesLoaderTests_ProviderThree_ARSC CtsResourcesLoaderTests_ProviderThree_Split CtsResourcesLoaderTests_ProviderTwo CtsResourcesLoaderTests_ProviderTwo_ARSC CtsResourcesLoaderTests_ProviderTwo_Split; }
