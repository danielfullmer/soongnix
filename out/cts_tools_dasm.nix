{ java_binary_host }:
let

#
#  Copyright (C) 2008 The Android Open Source Project
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

dasm = java_binary_host {
    name = "dasm";
    srcs = [
        "src/dasm/DAsm.java"
        "src/dasm/DasmCatchBuilder.java"
        "src/dasm/DasmError.java"
        "src/dasm/DopInfo.java"
        "src/dasm/Main.java"
        "src/dasm/ReservedWords.java"
        "src/dasm/Scanner.java"
        "src/dasm/Utils.java"
        "src/dasm/parser.java"
        "src/dasm/sym.java"
        "src/dasm/tokens/number_token.java"
        "src/dasm/tokens/relative_number_token.java"
        "src/dasm/tokens/variant_token.java"
        "src/java_cup/Main.java"
        "src/java_cup/action_part.java"
        "src/java_cup/action_production.java"
        "src/java_cup/emit.java"
        "src/java_cup/internal_error.java"
        "src/java_cup/lalr_item.java"
        "src/java_cup/lalr_item_set.java"
        "src/java_cup/lalr_state.java"
        "src/java_cup/lalr_transition.java"
        "src/java_cup/lexer.java"
        "src/java_cup/lr_item_core.java"
        "src/java_cup/non_terminal.java"
        "src/java_cup/parse_action.java"
        "src/java_cup/parse_action_row.java"
        "src/java_cup/parse_action_table.java"
        "src/java_cup/parse_reduce_row.java"
        "src/java_cup/parse_reduce_table.java"
        "src/java_cup/parser.java"
        "src/java_cup/production.java"
        "src/java_cup/production_part.java"
        "src/java_cup/reduce_action.java"
        "src/java_cup/shift_action.java"
        "src/java_cup/sym.java"
        "src/java_cup/symbol.java"
        "src/java_cup/symbol_part.java"
        "src/java_cup/symbol_set.java"
        "src/java_cup/terminal.java"
        "src/java_cup/terminal_set.java"
        "src/java_cup/version.java"
        "src/java_cup/runtime/char_token.java"
        "src/java_cup/runtime/double_token.java"
        "src/java_cup/runtime/float_token.java"
        "src/java_cup/runtime/int_token.java"
        "src/java_cup/runtime/long_token.java"
        "src/java_cup/runtime/lr_parser.java"
        "src/java_cup/runtime/str_token.java"
        "src/java_cup/runtime/symbol.java"
        "src/java_cup/runtime/token.java"
        "src/java_cup/runtime/virtual_parse_stack.java"
    ];
    static_libs = [
        "dx"
    ];
    manifest = "etc/manifest.txt";
    wrapper = "etc/dasm";
};

in { inherit dasm; }
