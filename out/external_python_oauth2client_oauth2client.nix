{ python_library }:
let

#  Copyright 2018 Google Inc. All rights reserved.
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
py-oauth2client = python_library {
    name = "py-oauth2client";
    host_supported = true;
    srcs = [
        "__init__.py"
        "_helpers.py"
        "_openssl_crypt.py"
        "_pure_python_crypt.py"
        "_pycrypto_crypt.py"
        "client.py"
        "clientsecrets.py"
        "crypt.py"
        "file.py"
        "service_account.py"
        "tools.py"
        "transport.py"
        "util.py"
        "contrib/__init__.py"
        "contrib/_appengine_ndb.py"
        "contrib/_fcntl_opener.py"
        "contrib/_metadata.py"
        "contrib/_win32_opener.py"
        "contrib/appengine.py"
        "contrib/devshell.py"
        "contrib/dictionary_storage.py"
        "contrib/flask_util.py"
        "contrib/gce.py"
        "contrib/keyring_storage.py"
        "contrib/locked_file.py"
        "contrib/multiprocess_file_storage.py"
        "contrib/multistore_file.py"
        "contrib/sqlalchemy.py"
        "contrib/xsrfutil.py"
        "contrib/django_util/__init__.py"
        "contrib/django_util/apps.py"
        "contrib/django_util/decorators.py"
        "contrib/django_util/models.py"
        "contrib/django_util/signals.py"
        "contrib/django_util/site.py"
        "contrib/django_util/storage.py"
        "contrib/django_util/views.py"
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
        "py-httplib2"
        "py-pyasn1"
        "py-pyasn1-modules"
        "py-rsa"
        "py-six"
    ];
    pkg_path = "oauth2client";
};

in { inherit py-oauth2client; }
