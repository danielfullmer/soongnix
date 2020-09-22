{ python_library }:
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
py-pycparser = python_library {
    name = "py-pycparser";
    host_supported = true;
    srcs = [
        "__init__.py"
        "_ast_gen.py"
        "_build_tables.py"
        "ast_transforms.py"
        "c_ast.py"
        "c_generator.py"
        "c_lexer.py"
        "c_parser.py"
        "plyparser.py"
        "ply/__init__.py"
        "ply/cpp.py"
        "ply/ctokens.py"
        "ply/lex.py"
        "ply/yacc.py"
        "ply/ygen.py"
    ];
    data = [
        "_c_ast.cfg"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "pycparser";
};

in { inherit py-pycparser; }