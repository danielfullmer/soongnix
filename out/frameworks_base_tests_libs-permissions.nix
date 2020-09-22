{ java_library, prebuilt_etc }:
let

"com.android.test.libs.product" = java_library {
    name = "com.android.test.libs.product";
    installable = true;
    product_specific = true;
    sdk_version = "current";
    srcs = ["product/java/com/android/test/libs/product/LibsProductTest.java"];
    required = ["com.android.test.libs.product.xml"];
};

"com.android.test.libs.product.xml" = prebuilt_etc {
    name = "com.android.test.libs.product.xml";
    src = "product/com.android.test.libs.product.xml";
    sub_dir = "permissions";
    product_specific = true;
};

"com.android.test.libs.system_ext" = java_library {
    name = "com.android.test.libs.system_ext";
    installable = true;
    system_ext_specific = true;
    srcs = ["system_ext/java/com/android/test/libs/system_ext/LibsSystemExtTest.java"];
    required = ["com.android.test.libs.system_ext.xml"];
};

"com.android.test.libs.system_ext.xml" = prebuilt_etc {
    name = "com.android.test.libs.system_ext.xml";
    src = "system_ext/com.android.test.libs.system_ext.xml";
    sub_dir = "permissions";
    system_ext_specific = true;
};

in { inherit "com.android.test.libs.product" "com.android.test.libs.product.xml" "com.android.test.libs.system_ext" "com.android.test.libs.system_ext.xml"; }
