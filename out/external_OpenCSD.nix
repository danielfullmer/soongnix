{ cc_library_static, package }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

_missingName = package {
    default_visibility = ["//visibility:private"];
};

libopencsd_decoder = cc_library_static {
    name = "libopencsd_decoder";
    host_supported = true;
    visibility = [
        "//cts/tests/tests/simpleperf"
        "//system/extras/simpleperf"
    ];
    export_include_dirs = ["decoder/include"];

    cppflags = [
        "-Wno-ignored-qualifiers"
        "-Wno-unused-parameter"
        "-Wno-switch"
        "-Wno-unused-private-field"
        "-Wno-implicit-fallthrough"
        "-Wno-constant-logical-operand"
        "-fexceptions"
    ];
    rtti = true;

    target = {
        windows = {
            enabled = true;
        };
    };

    srcs = [
        "decoder/source/ocsd_code_follower.cpp"
        "decoder/source/ocsd_dcd_tree.cpp"
        "decoder/source/ocsd_error.cpp"
        "decoder/source/ocsd_error_logger.cpp"
        "decoder/source/ocsd_gen_elem_list.cpp"
        "decoder/source/ocsd_gen_elem_stack.cpp"
        "decoder/source/ocsd_lib_dcd_register.cpp"
        "decoder/source/ocsd_msg_logger.cpp"
        "decoder/source/ocsd_version.cpp"
        "decoder/source/trc_component.cpp"
        "decoder/source/trc_core_arch_map.cpp"
        "decoder/source/trc_frame_deformatter.cpp"
        "decoder/source/trc_gen_elem.cpp"
        "decoder/source/trc_printable_elem.cpp"
        "decoder/source/trc_ret_stack.cpp"
        "decoder/source/etmv3/trc_cmp_cfg_etmv3.cpp"
        "decoder/source/etmv3/trc_pkt_decode_etmv3.cpp"
        "decoder/source/etmv3/trc_pkt_elem_etmv3.cpp"
        "decoder/source/etmv3/trc_pkt_proc_etmv3.cpp"
        "decoder/source/etmv3/trc_pkt_proc_etmv3_impl.cpp"
        "decoder/source/etmv4/trc_cmp_cfg_etmv4.cpp"
        "decoder/source/etmv4/trc_etmv4_stack_elem.cpp"
        "decoder/source/etmv4/trc_pkt_decode_etmv4i.cpp"
        "decoder/source/etmv4/trc_pkt_elem_etmv4i.cpp"
        "decoder/source/etmv4/trc_pkt_proc_etmv4i.cpp"
        "decoder/source/i_dec/trc_i_decode.cpp"
        "decoder/source/i_dec/trc_idec_arminst.cpp"
        "decoder/source/mem_acc/trc_mem_acc_base.cpp"
        "decoder/source/mem_acc/trc_mem_acc_bufptr.cpp"
        "decoder/source/mem_acc/trc_mem_acc_cache.cpp"
        "decoder/source/mem_acc/trc_mem_acc_cb.cpp"
        "decoder/source/mem_acc/trc_mem_acc_file.cpp"
        "decoder/source/mem_acc/trc_mem_acc_mapper.cpp"
        "decoder/source/pkt_printers/raw_frame_printer.cpp"
        "decoder/source/pkt_printers/trc_print_fact.cpp"
        "decoder/source/ptm/trc_cmp_cfg_ptm.cpp"
        "decoder/source/ptm/trc_pkt_decode_ptm.cpp"
        "decoder/source/ptm/trc_pkt_elem_ptm.cpp"
        "decoder/source/ptm/trc_pkt_proc_ptm.cpp"
        "decoder/source/stm/trc_pkt_decode_stm.cpp"
        "decoder/source/stm/trc_pkt_elem_stm.cpp"
        "decoder/source/stm/trc_pkt_proc_stm.cpp"
    ];
};

in { inherit _missingName libopencsd_decoder; }
