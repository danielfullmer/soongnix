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

ProductServicesPrivAppPermissionTest = android_app {
    name = "ProductServicesPrivAppPermissionTest";
    sdk_version = "current";
    privileged = true;
    manifest = "product_services/AndroidManifest.xml";
    product_services_specific = true;
    required = ["product_servicesprivapp-permissions-test.xml"];
};

"product_servicesprivapp-permissions-test.xml" = prebuilt_etc {
    name = "product_servicesprivapp-permissions-test.xml";
    src = "product_services/privapp-permissions-test.xml";
    sub_dir = "permissions";
    product_services_specific = true;
};

in { inherit "privapp-permissions-test.xml" "product_servicesprivapp-permissions-test.xml" "productprivapp-permissions-test.xml" "vendorprivapp-permissions-test.xml" PrivAppPermissionTest ProductPrivAppPermissionTest ProductServicesPrivAppPermissionTest VendorPrivAppPermissionTest; }
