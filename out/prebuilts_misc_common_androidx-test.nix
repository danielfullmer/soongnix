{ android_library, android_library_import }:
let

#  Automatically generated with:
#  pom2bp -rewrite 'androidx.test:=androidx.test.' -rewrite 'androidx.test.ext:=androidx.test.ext.' -rewrite 'androidx.test.espresso:espresso-=androidx.test.espresso.' -rewrite 'androidx.test.janktesthelper:janktesthelper=androidx.test.janktesthelper' -rewrite 'androidx.test.uiautomator:uiautomator=androidx.test.uiautomator' -rewrite 'com.google.truth:truth=truth-prebuilt' -rewrite 'net.sf.kxml:kxml2=kxml2-android' -rewrite 'androidx.lifecycle:lifecycle-common=androidx.lifecycle_lifecycle-common' -rewrite 'androidx.annotation:annotation=androidx.annotation_annotation' -rewrite 'org.hamcrest:hamcrest-integration=hamcrest' -rewrite 'javax.inject:javax.inject=jsr330' -rewrite 'com.google.android.material:material=com.google.android.material_material' -rewrite 'androidx.drawerlayout:drawerlayout=androidx.drawerlayout_drawerlayout' -rewrite 'androidx.viewpager:viewpager=androidx.viewpager_viewpager' -rewrite 'androidx.recyclerview:recyclerview=androidx.recyclerview_recyclerview' -rewrite 'androidx.core:core=androidx.core_core' -rewrite 'androidx.legacy:legacy-support-core-utils=androidx.legacy_legacy-support-core-utils' -sdk-version current .

"androidx.test.core-nodeps" = android_library_import {
    name = "androidx.test.core-nodeps";
    aars = ["androidx/test/core/1.2.0-alpha03/core-1.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.monitor"
    ];
};

"androidx.test.core" = android_library {
    name = "androidx.test.core";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.core/AndroidManifest.xml";
    static_libs = [
        "androidx.test.core-nodeps"
        "androidx.annotation_annotation"
        "androidx.lifecycle_lifecycle-common"
        "androidx.test.monitor"
    ];
    java_version = "1.7";
};

"androidx.test.espresso.contrib-nodeps" = android_library_import {
    name = "androidx.test.espresso.contrib-nodeps";
    aars = ["androidx/test/espresso/espresso-contrib/3.2.0-alpha03/espresso-contrib-3.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.espresso.core"
        "androidx.test.espresso.idling-resource"
    ];
};

"androidx.test.espresso.contrib" = android_library {
    name = "androidx.test.espresso.contrib";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.espresso.contrib/AndroidManifest.xml";
    static_libs = [
        "androidx.test.espresso.contrib-nodeps"
        "com.google.android.material_material"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
        "androidx.drawerlayout_drawerlayout"
        "androidx.viewpager_viewpager"
        "androidx.legacy_legacy-support-core-utils"
        "accessibility-test-framework"
        "androidx.test.espresso.core"
        "androidx.test.espresso.idling-resource"
    ];
    java_version = "1.7";
};

"androidx.test.espresso.core-nodeps" = android_library_import {
    name = "androidx.test.espresso.core-nodeps";
    aars = ["androidx/test/espresso/espresso-core/3.2.0-alpha03/espresso-core-3.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.runner"
        "androidx.test.espresso.idling-resource"
    ];
};

"androidx.test.espresso.core" = android_library {
    name = "androidx.test.espresso.core";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.espresso.core/AndroidManifest.xml";
    static_libs = [
        "androidx.test.espresso.core-nodeps"
        "javawriter"
        "jsr330"
        "hamcrest-library"
        "hamcrest"
        "jsr305"
        "androidx.test.runner"
        "androidx.test.espresso.idling-resource"
    ];
    java_version = "1.7";
};

"androidx.test.espresso.idling-resource-nodeps" = android_library_import {
    name = "androidx.test.espresso.idling-resource-nodeps";
    aars = ["androidx/test/espresso/espresso-idling-resource/3.2.0-alpha03/espresso-idling-resource-3.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

"androidx.test.espresso.idling-resource" = android_library {
    name = "androidx.test.espresso.idling-resource";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.espresso.idling-resource/AndroidManifest.xml";
    static_libs = [
        "androidx.test.espresso.idling-resource-nodeps"
    ];
    java_version = "1.7";
};

"androidx.test.espresso.intents-nodeps" = android_library_import {
    name = "androidx.test.espresso.intents-nodeps";
    aars = ["androidx/test/espresso/espresso-intents/3.2.0-alpha03/espresso-intents-3.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.espresso.core"
        "androidx.test.core"
        "androidx.test.rules"
    ];
};

"androidx.test.espresso.intents" = android_library {
    name = "androidx.test.espresso.intents";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.espresso.intents/AndroidManifest.xml";
    static_libs = [
        "androidx.test.espresso.intents-nodeps"
        "androidx.test.espresso.core"
        "androidx.test.core"
        "androidx.test.rules"
    ];
    java_version = "1.7";
};

"androidx.test.espresso.web-nodeps" = android_library_import {
    name = "androidx.test.espresso.web-nodeps";
    aars = ["androidx/test/espresso/espresso-web/3.2.0-alpha03/espresso-web-3.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.espresso.core"
    ];
};

"androidx.test.espresso.web" = android_library {
    name = "androidx.test.espresso.web";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.espresso.web/AndroidManifest.xml";
    static_libs = [
        "androidx.test.espresso.web-nodeps"
        "androidx.annotation_annotation"
        "tagsoup"
        "androidx.test.espresso.core"
    ];
    java_version = "1.7";
};

"androidx.test.ext.junit-nodeps" = android_library_import {
    name = "androidx.test.ext.junit-nodeps";
    aars = ["androidx/test/ext/junit/1.1.1-alpha03/junit-1.1.1-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.core"
        "androidx.test.monitor"
    ];
};

"androidx.test.ext.junit" = android_library {
    name = "androidx.test.ext.junit";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.ext.junit/AndroidManifest.xml";
    static_libs = [
        "androidx.test.ext.junit-nodeps"
        "junit"
        "androidx.annotation_annotation"
        "androidx.test.core"
        "androidx.test.monitor"
    ];
    java_version = "1.7";
};

"androidx.test.ext.truth-nodeps" = android_library_import {
    name = "androidx.test.ext.truth-nodeps";
    aars = ["androidx/test/ext/truth/1.2.0-alpha03/truth-1.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.core"
    ];
};

"androidx.test.ext.truth" = android_library {
    name = "androidx.test.ext.truth";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.ext.truth/AndroidManifest.xml";
    static_libs = [
        "androidx.test.ext.truth-nodeps"
        "guava"
        "truth-prebuilt"
        "androidx.annotation_annotation"
        "androidx.test.core"
    ];
    java_version = "1.7";
};

"androidx.test.janktesthelper-nodeps" = android_library_import {
    name = "androidx.test.janktesthelper-nodeps";
    aars = ["androidx/test/janktesthelper/janktesthelper/1.0.1/janktesthelper-1.0.1.aar"];
    sdk_version = "current";
    min_sdk_version = "23";
    static_libs = [
        "androidx.test.runner"
        "androidx.test.rules"
    ];
};

"androidx.test.janktesthelper" = android_library {
    name = "androidx.test.janktesthelper";
    sdk_version = "current";
    min_sdk_version = "23";
    manifest = "manifests/androidx.test.janktesthelper/AndroidManifest.xml";
    static_libs = [
        "androidx.test.janktesthelper-nodeps"
        "androidx.test.runner"
        "androidx.test.rules"
    ];
    java_version = "1.7";
};

"androidx.test.monitor-nodeps" = android_library_import {
    name = "androidx.test.monitor-nodeps";
    aars = ["androidx/test/monitor/1.2.0-alpha03/monitor-1.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

"androidx.test.monitor" = android_library {
    name = "androidx.test.monitor";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.monitor/AndroidManifest.xml";
    static_libs = [
        "androidx.test.monitor-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.test.rules-nodeps" = android_library_import {
    name = "androidx.test.rules-nodeps";
    aars = ["androidx/test/rules/1.2.0-alpha03/rules-1.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.runner"
    ];
};

"androidx.test.rules" = android_library {
    name = "androidx.test.rules";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.rules/AndroidManifest.xml";
    static_libs = [
        "androidx.test.rules-nodeps"
        "androidx.test.runner"
    ];
    java_version = "1.7";
};

"androidx.test.runner-nodeps" = android_library_import {
    name = "androidx.test.runner-nodeps";
    aars = ["androidx/test/runner/1.2.0-alpha03/runner-1.2.0-alpha03.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "androidx.test.monitor"
    ];
};

"androidx.test.runner" = android_library {
    name = "androidx.test.runner";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.test.runner/AndroidManifest.xml";
    static_libs = [
        "androidx.test.runner-nodeps"
        "androidx.annotation_annotation"
        "junit"
        "kxml2-android"
        "androidx.test.monitor"
    ];
    java_version = "1.7";
};

"androidx.test.uiautomator-nodeps" = android_library_import {
    name = "androidx.test.uiautomator-nodeps";
    aars = ["androidx/test/uiautomator/uiautomator/2.2.0/uiautomator-2.2.0.aar"];
    sdk_version = "current";
    min_sdk_version = "18";
    static_libs = [
    ];
};

"androidx.test.uiautomator" = android_library {
    name = "androidx.test.uiautomator";
    sdk_version = "current";
    min_sdk_version = "18";
    manifest = "manifests/androidx.test.uiautomator/AndroidManifest.xml";
    static_libs = [
        "androidx.test.uiautomator-nodeps"
    ];
    java_version = "1.7";
};

in { inherit "androidx.test.core" "androidx.test.core-nodeps" "androidx.test.espresso.contrib" "androidx.test.espresso.contrib-nodeps" "androidx.test.espresso.core" "androidx.test.espresso.core-nodeps" "androidx.test.espresso.idling-resource" "androidx.test.espresso.idling-resource-nodeps" "androidx.test.espresso.intents" "androidx.test.espresso.intents-nodeps" "androidx.test.espresso.web" "androidx.test.espresso.web-nodeps" "androidx.test.ext.junit" "androidx.test.ext.junit-nodeps" "androidx.test.ext.truth" "androidx.test.ext.truth-nodeps" "androidx.test.janktesthelper" "androidx.test.janktesthelper-nodeps" "androidx.test.monitor" "androidx.test.monitor-nodeps" "androidx.test.rules" "androidx.test.rules-nodeps" "androidx.test.runner" "androidx.test.runner-nodeps" "androidx.test.uiautomator" "androidx.test.uiautomator-nodeps"; }
