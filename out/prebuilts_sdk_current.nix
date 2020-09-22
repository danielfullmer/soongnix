{ java_import, java_sdk_library_import }:
let

"android.test.base" = java_sdk_library_import {
    name = "android.test.base";
    public = {
        jars = ["public/android.test.base.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/android.test.base.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/android.test.base.jar"];
        sdk_version = "test_current";
    };
};

"android.test.runner" = java_sdk_library_import {
    name = "android.test.runner";
    public = {
        jars = ["public/android.test.runner.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/android.test.runner.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/android.test.runner.jar"];
        sdk_version = "test_current";
    };
    libs = [
        "android.test.base"
        "android.test.mock"
    ];
};

"android.test.mock" = java_sdk_library_import {
    name = "android.test.mock";
    public = {
        jars = ["public/android.test.mock.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/android.test.mock.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/android.test.mock.jar"];
        sdk_version = "test_current";
    };
};

"com.android.future.usb.accessory" = java_sdk_library_import {
    name = "com.android.future.usb.accessory";
    public = {
        jars = ["public/com.android.future.usb.accessory.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.future.usb.accessory.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.future.usb.accessory.jar"];
        sdk_version = "test_current";
    };
};

"com.android.location.provider" = java_sdk_library_import {
    name = "com.android.location.provider";
    public = {
        jars = ["public/com.android.location.provider.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.location.provider.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.location.provider.jar"];
        sdk_version = "test_current";
    };
};

"com.android.mediadrm.signer" = java_sdk_library_import {
    name = "com.android.mediadrm.signer";
    public = {
        jars = ["public/com.android.mediadrm.signer.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.mediadrm.signer.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.mediadrm.signer.jar"];
        sdk_version = "test_current";
    };
};

"com.android.media.remotedisplay" = java_sdk_library_import {
    name = "com.android.media.remotedisplay";
    public = {
        jars = ["public/com.android.media.remotedisplay.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.media.remotedisplay.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.media.remotedisplay.jar"];
        sdk_version = "test_current";
    };
};

"com.android.media.tv.remoteprovider" = java_sdk_library_import {
    name = "com.android.media.tv.remoteprovider";
    public = {
        jars = ["public/com.android.media.tv.remoteprovider.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.media.tv.remoteprovider.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.media.tv.remoteprovider.jar"];
        sdk_version = "test_current";
    };
};

"com.android.nfc_extras" = java_sdk_library_import {
    name = "com.android.nfc_extras";
    public = {
        jars = ["public/com.android.nfc_extras.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/com.android.nfc_extras.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/com.android.nfc_extras.jar"];
        sdk_version = "test_current";
    };
};

"javax.obex" = java_sdk_library_import {
    name = "javax.obex";
    public = {
        jars = ["public/javax.obex.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/javax.obex.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/javax.obex.jar"];
        sdk_version = "test_current";
    };
};

"org.apache.http.legacy" = java_sdk_library_import {
    name = "org.apache.http.legacy";
    public = {
        jars = ["public/org.apache.http.legacy.jar"];
        sdk_version = "current";
    };
    system = {
        jars = ["system/org.apache.http.legacy.jar"];
        sdk_version = "system_current";
    };
    test = {
        jars = ["test/org.apache.http.legacy.jar"];
        sdk_version = "test_current";
    };
};

android-support-multidex-instrumentation = java_import {
    name = "android-support-multidex-instrumentation";
    jars = ["multidex/instrumentation/android-support-multidex-instrumentation.jar"];
    sdk_version = "current";
};

android-support-multidex = java_import {
    name = "android-support-multidex";
    jars = ["multidex/library/android-support-multidex.jar"];
    sdk_version = "current";
};

in { inherit "android.test.base" "android.test.mock" "android.test.runner" "com.android.future.usb.accessory" "com.android.location.provider" "com.android.media.remotedisplay" "com.android.media.tv.remoteprovider" "com.android.mediadrm.signer" "com.android.nfc_extras" "javax.obex" "org.apache.http.legacy" android-support-multidex android-support-multidex-instrumentation; }
