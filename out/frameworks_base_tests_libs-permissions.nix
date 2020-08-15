{ java_library, prebuilt_etc }:
let

"com.android.test.libs.product" = java_library {
    name = "com.android.test.libs.product";
    installable = true;
    product_specific = true;
    srcs = ["product/java/com/android/test/libs/product/LibsProductTest.java"];
    required = ["com.android.test.libs.product.xml"];
};

"com.android.test.libs.product.xml" = prebuilt_etc {
    name = "com.android.test.libs.product.xml";
    src = "product/com.android.test.libs.product.xml";
    sub_dir = "permissions";
    product_specific = true;
};

"com.android.test.libs.product_services" = java_library {
    name = "com.android.test.libs.product_services";
    installable = true;
    product_services_specific = true;
    srcs = ["product_services/java/com/android/test/libs/product_services/LibsProductServicesTest.java"];
    required = ["com.android.test.libs.product_services.xml"];
};

"com.android.test.libs.product_services.xml" = prebuilt_etc {
    name = "com.android.test.libs.product_services.xml";
    src = "product_services/com.android.test.libs.product_services.xml";
    sub_dir = "permissions";
    product_services_specific = true;
};

in { inherit "com.android.test.libs.product" "com.android.test.libs.product.xml" "com.android.test.libs.product_services" "com.android.test.libs.product_services.xml"; }
