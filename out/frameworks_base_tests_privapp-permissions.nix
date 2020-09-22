{ android_app, prebuilt_etc }:
let

PrivAppPermissionTest = android_app {
    name = "PrivAppPermissionTest";
    sdk_version = "current";
    privileged = true;
    manifest = "system/AndroidManifest.xml";
    required = ["privapp-permissions-test.xml"];
};

"privapp-permissions-test.xml" = prebuilt_etc {
    name = "privapp-permissions-test.xml";
    src = "system/privapp-permissions-test.xml";
    sub_dir = "permissions";
};

VendorPrivAppPermissionTest = android_app {
    name = "VendorPrivAppPermissionTest";
    sdk_version = "current";
    privileged = true;
    manifest = "vendor/AndroidManifest.xml";
    vendor = true;
    required = ["vendorprivapp-permissions-test.xml"];
};

"vendorprivapp-permissions-test.xml" = prebuilt_etc {
    name = "vendorprivapp-permissions-test.xml";
    src = "vendor/privapp-permissions-test.xml";
    sub_dir = "permissions";
    proprietary = true;
};

ProductPrivAppPermissionTest = android_app {
    name = "ProductPrivAppPermissionTest";
    sdk_version = "current";
    privileged = true;
    manifest = "product/AndroidManifest.xml";
    product_specific = true;
    required = ["productprivapp-permissions-test.xml"];
};

"productprivapp-permissions-test.xml" = prebuilt_etc {
    name = "productprivapp-permissions-test.xml";
    src = "product/privapp-permissions-test.xml";
    sub_dir = "permissions";
    product_specific = true;
};

SystemExtPrivAppPermissionTest = android_app {
    name = "SystemExtPrivAppPermissionTest";
    sdk_version = "current";
    privileged = true;
    manifest = "system_ext/AndroidManifest.xml";
    system_ext_specific = true;
    required = ["system_extprivapp-permissions-test.xml"];
};

"system_extprivapp-permissions-test.xml" = prebuilt_etc {
    name = "system_extprivapp-permissions-test.xml";
    src = "system_ext/privapp-permissions-test.xml";
    sub_dir = "permissions";
    system_ext_specific = true;
};

in { inherit "privapp-permissions-test.xml" "productprivapp-permissions-test.xml" "system_extprivapp-permissions-test.xml" "vendorprivapp-permissions-test.xml" PrivAppPermissionTest ProductPrivAppPermissionTest SystemExtPrivAppPermissionTest VendorPrivAppPermissionTest; }
