{ bootstrap_go_package }:
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

soong-symbol_inject = bootstrap_go_package {
    name = "soong-symbol_inject";
    pkgPath = "android/soong/symbol_inject";
    srcs = [
        "symbol_inject.go"
        "elf.go"
        "macho.go"
        "pe.go"
    ];
    testSrcs = [
        "elf_symboldata_test.go"
        "elf_test.go"
        "macho_symboldata_test.go"
        "macho_test.go"
        "pe_symboldata_test.go"
        "pe_test.go"
        "symbol_inject_test.go"
    ];
};

in { inherit soong-symbol_inject; }
