{ filegroup, java_defaults, java_library, java_library_host, java_library_static }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

bouncycastle-errorprone-defaults = java_defaults {
    name = "bouncycastle-errorprone-defaults";
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF" #  Ignore missing @Override.
        ];
    };
};

#  These cannot build in the PDK, because the PDK requires all libraries
#  compile against SDK versions.
bouncycastle-defaults = java_defaults {
    name = "bouncycastle-defaults";
    defaults = [
        "bouncycastle-errorprone-defaults"
    ];
    hostdex = true;
    target = {
        android = {
            product_variables = {
                pdk = {
                    enabled = false;
                };
            };
        };
    };
};

#  A bouncycastle library in the original org.bouncycastle package for use
#  outside of the platform. e.g. for host or in unbundled apps.
bouncycastle-unbundled = java_library_static {
    name = "bouncycastle-unbundled";
    defaults = ["bouncycastle-defaults"];
    host_supported = true;

    srcs = ["bcprov/src/main/java/**/*.java"];
    exclude_srcs = [
        "bcprov/src/main/java/org/bouncycastle/asn1/ocsp/**/*.java"
    ];

    sdk_version = "core_current";
    java_version = "1.7";
};

#  The src files for bouncycastle, used to generate core platform / intra-core
#  API stubs.
bouncycastle_java_files = filegroup {
    name = "bouncycastle_java_files";
    srcs = ["repackaged/bcprov/src/main/java/**/*.java"];
};

#  A bouncycastle library repackaged in com.android.org.bouncycastle for use
#  in the Android platform where it is important not to conflict with the
#  original org.bouncycastle package.
bouncycastle = java_library {
    name = "bouncycastle";
    defaults = ["bouncycastle-defaults"];
    installable = true;

    srcs = [":bouncycastle_java_files"];

    no_standard_libs = true;
    libs = [
        "core-all"
    ];
    system_modules = "core-all-system-modules";
};

#  A guaranteed unstripped version of bouncycastle.
#  The build system may or may not strip the bouncycastle jar, but this one will
#  not be stripped. See b/24535627.
bouncycastle-testdex = java_library {
    name = "bouncycastle-testdex";
    defaults = ["bouncycastle-defaults"];
    installable = true;

    srcs = [":bouncycastle_java_files"];

    no_standard_libs = true;
    libs = [
        "core-all"
    ];
    dex_preopt = {
        enabled = false;
    };
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

#  Bouncycastle PKIX classes in the original org.bouncycastle package for use
#  outside of the platform. e.g. for host or in unbundled apps / CTS tests.
bouncycastle-bcpkix-unbundled = java_library_static {
    name = "bouncycastle-bcpkix-unbundled";
    defaults = ["bouncycastle-defaults"];
    host_supported = true;

    srcs = ["bcpkix/src/main/java/**/*.java"];
    exclude_srcs = ["bcpkix/src/main/java/org/bouncycastle/cert/ocsp/**/*.java"];
    libs = ["bouncycastle-unbundled"];

    sdk_version = "core_current";
};

#  Bouncycastle OCSP classes in the original org.bouncycastle package for use
#  outside of the platform. e.g. for host or in unbundled apps / CTS tests.
bouncycastle-ocsp-unbundled = java_library_static {
    name = "bouncycastle-ocsp-unbundled";
    defaults = ["bouncycastle-defaults"];
    host_supported = true;

    srcs = [
        "bcpkix/src/main/java/org/bouncycastle/cert/ocsp/**/*.java"
        "bcprov/src/main/java/org/bouncycastle/asn1/ocsp/**/*.java"
    ];
    libs = [
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
    ];

    sdk_version = "core_current";
};

#  For compatibility with old bouncycastle-host name.
bouncycastle-host = java_library_host {
    name = "bouncycastle-host";
    static_libs = ["bouncycastle-unbundled"];
};

#  For compatibility with old bouncycastle-bcpkix-host name.
bouncycastle-bcpkix-host = java_library_host {
    name = "bouncycastle-bcpkix-host";
    static_libs = ["bouncycastle-bcpkix-unbundled"];
};

in { inherit bouncycastle bouncycastle-bcpkix-host bouncycastle-bcpkix-unbundled bouncycastle-defaults bouncycastle-errorprone-defaults bouncycastle-host bouncycastle-ocsp-unbundled bouncycastle-testdex bouncycastle-unbundled bouncycastle_java_files; }
