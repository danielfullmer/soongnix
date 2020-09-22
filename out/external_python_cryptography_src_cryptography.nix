{ filegroup, python_library }:
let

#  Copyright 2019 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
py-cryptography = python_library {
    name = "py-cryptography";
    host_supported = true;
    srcs = [
        "__about__.py"
        "__init__.py"
        "exceptions.py"
        "fernet.py"
        "utils.py"
        "hazmat/__init__.py"
        "hazmat/_oid.py"
        "hazmat/backends/__init__.py"
        "hazmat/backends/interfaces.py"
        "hazmat/backends/openssl/__init__.py"
        "hazmat/backends/openssl/aead.py"
        "hazmat/backends/openssl/backend.py"
        "hazmat/backends/openssl/ciphers.py"
        "hazmat/backends/openssl/cmac.py"
        "hazmat/backends/openssl/decode_asn1.py"
        "hazmat/backends/openssl/dh.py"
        "hazmat/backends/openssl/dsa.py"
        "hazmat/backends/openssl/ec.py"
        "hazmat/backends/openssl/encode_asn1.py"
        "hazmat/backends/openssl/hashes.py"
        "hazmat/backends/openssl/hmac.py"
        "hazmat/backends/openssl/ocsp.py"
        "hazmat/backends/openssl/rsa.py"
        "hazmat/backends/openssl/utils.py"
        "hazmat/backends/openssl/x25519.py"
        "hazmat/backends/openssl/x448.py"
        "hazmat/backends/openssl/x509.py"
        "hazmat/primitives/__init__.py"
        "hazmat/primitives/cmac.py"
        "hazmat/primitives/constant_time.py"
        "hazmat/primitives/hashes.py"
        "hazmat/primitives/hmac.py"
        "hazmat/primitives/keywrap.py"
        "hazmat/primitives/mac.py"
        "hazmat/primitives/padding.py"
        "hazmat/primitives/twofactor/__init__.py"
        "hazmat/primitives/twofactor/hotp.py"
        "hazmat/primitives/twofactor/totp.py"
        "hazmat/primitives/twofactor/utils.py"
        "hazmat/primitives/serialization/__init__.py"
        "hazmat/primitives/serialization/base.py"
        "hazmat/primitives/serialization/pkcs12.py"
        "hazmat/primitives/serialization/ssh.py"
        "hazmat/primitives/kdf/__init__.py"
        "hazmat/primitives/kdf/concatkdf.py"
        "hazmat/primitives/kdf/hkdf.py"
        "hazmat/primitives/kdf/kbkdf.py"
        "hazmat/primitives/kdf/pbkdf2.py"
        "hazmat/primitives/kdf/scrypt.py"
        "hazmat/primitives/kdf/x963kdf.py"
        "hazmat/primitives/asymmetric/__init__.py"
        "hazmat/primitives/asymmetric/dh.py"
        "hazmat/primitives/asymmetric/dsa.py"
        "hazmat/primitives/asymmetric/ec.py"
        "hazmat/primitives/asymmetric/padding.py"
        "hazmat/primitives/asymmetric/rsa.py"
        "hazmat/primitives/asymmetric/utils.py"
        "hazmat/primitives/asymmetric/x25519.py"
        "hazmat/primitives/asymmetric/x448.py"
        "hazmat/primitives/ciphers/__init__.py"
        "hazmat/primitives/ciphers/aead.py"
        "hazmat/primitives/ciphers/algorithms.py"
        "hazmat/primitives/ciphers/base.py"
        "hazmat/primitives/ciphers/modes.py"
        "hazmat/bindings/__init__.py"
        "hazmat/bindings/openssl/__init__.py"
        "hazmat/bindings/openssl/_conditional.py"
        "hazmat/bindings/openssl/binding.py"
        "x509/__init__.py"
        "x509/base.py"
        "x509/certificate_transparency.py"
        "x509/extensions.py"
        "x509/general_name.py"
        "x509/name.py"
        "x509/ocsp.py"
        "x509/oid.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    libs = [
        "py-asn1crypto"
        "py-cffi"
        "py-enum34"
        "py-ipaddress"
        "py-six"
    ];
    data = [
        ":py-cryptography-libs"
    ];
    pkg_path = "cryptography";
};

py-cryptography-libs = filegroup {
    name = "py-cryptography-libs";
    srcs = [
        "hazmat/bindings/_constant_time.so"
        "hazmat/bindings/_openssl.so"
        "hazmat/bindings/_padding.so"
    ];
};

in { inherit py-cryptography py-cryptography-libs; }
