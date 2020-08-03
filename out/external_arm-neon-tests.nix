{ cc_defaults, cc_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

arm_neon_tests_defaults = cc_defaults {
    name = "arm_neon_tests_defaults";
    cflags = [
        "-DREFFILE=\"stm-arm-neon.gccarm\""
        "-DGCCTESTS_FILE=\"expected_input4gcc.txt\""

        "-Wall"
        "-Werror"
        "-Wno-format"
        "-Wno-ignored-qualifiers"
        "-Wno-uninitialized"
        "-Wno-unused-function"
        "-Wno-unused-variable"
    ];

    srcs = [
        "compute_ref.c"

        #  List of validated intrinsics (copy-pasted from Makefile)
        "ref_vld1.c"
        "ref_vadd.c"
        "ref_vld1_lane.c"
        "ref_vld1_dup.c"
        "ref_vdup.c"
        "ref_vget_high.c"
        "ref_vget_low.c"
        "ref_vqdmlal_lane.c"
        "ref_vqdmlsl_lane.c"
        "ref_vext.c"
        "ref_vshrn_n.c"
        "ref_vset_lane.c"
        "ref_vget_lane.c"
        "ref_vqsub.c"
        "ref_vqdmulh_lane.c"
        "ref_vqdmull.c"
        "ref_vqdmlal.c"
        "ref_vqdmlsl.c"
        "ref_vceq.c"
        "ref_vcge.c"
        "ref_vcle.c"
        "ref_vcgt.c"
        "ref_vclt.c"
        "ref_vbsl.c"
        "ref_vshl.c"
        "ref_vdup_lane.c"
        "ref_vrshrn_n.c"
        "ref_vqdmull_lane.c"
        "ref_vst1_lane.c"
        "ref_vqshl.c"
        "ref_vqshl_n.c"
        "ref_vqrshrn_n.c"
        "ref_vsub.c"
        "ref_vqadd.c"
        "ref_vabs.c"
        "ref_vqabs.c"
        "ref_vcombine.c"
        "ref_vmax.c"
        "ref_vmin.c"
        "ref_vneg.c"
        "ref_vqneg.c"
        "ref_vmlal.c"
        "ref_vmlal_lane.c"
        "ref_vmlsl.c"
        "ref_vmlsl_lane.c"
        "ref_vmovl.c"
        "ref_vmovn.c"
        "ref_vmull.c"
        "ref_vmull_lane.c"
        "ref_vrev.c"
        "ref_vrshl.c"
        "ref_vshl_n.c"
        "ref_vshr_n.c"
        "ref_vsra_n.c"
        "ref_vtrn.c"
        "ref_vuzp.c"
        "ref_vzip.c"
        "ref_vreinterpret.c"
        "ref_vqdmulh.c"
        "ref_vqrdmulh.c"
        "ref_vqrdmulh_lane.c"
        "ref_vqrshl.c"
        "ref_vaba.c"
        "ref_vabal.c"
        "ref_vabd.c"
        "ref_vabdl.c"
        "ref_vand.c"
        "ref_vorr.c"
        "ref_vorn.c"
        "ref_veor.c"
        "ref_vbic.c"
        "ref_vcreate.c"
        "ref_vldX_lane.c"
        "ref_vmla.c"
        "ref_vmls.c"
        "ref_vmul.c"
        "ref_vmul_lane.c"
        "ref_vmul_n.c"
        "ref_vmull_n.c"
        "ref_vqdmulh_n.c"
        "ref_vqdmull_n.c"
        "ref_vqrdmulh_n.c"
        "ref_vmla_lane.c"
        "ref_vmls_lane.c"
        "ref_vmla_n.c"
        "ref_vmls_n.c"
        "ref_vmlal_n.c"
        "ref_vmlsl_n.c"
        "ref_vqdmlal_n.c"
        "ref_vqdmlsl_n.c"
        "ref_vsri_n.c"
        "ref_vsli_n.c"
        "ref_vtst.c"
        "ref_vaddhn.c"
        "ref_vraddhn.c"
        "ref_vaddl.c"
        "ref_vaddw.c"
        "ref_vhadd.c"
        "ref_vrhadd.c"
        "ref_vhsub.c"
        "ref_vsubl.c"
        "ref_vsubw.c"
        "ref_vsubhn.c"
        "ref_vrsubhn.c"
        "ref_vmvn.c"
        "ref_vqmovn.c"
        "ref_vqmovun.c"
        "ref_vrshr_n.c"
        "ref_vrsra_n.c"
        "ref_vshll_n.c"
        "ref_vpaddl.c"
        "ref_vpadd.c"
        "ref_vpadal.c"
        "ref_vqshlu_n.c"
        "ref_vclz.c"
        "ref_vcls.c"
        "ref_vcnt.c"
        "ref_vqshrn_n.c"
        "ref_vpmax.c"
        "ref_vpmin.c"
        "ref_vqshrun_n.c"
        "ref_vqrshrun_n.c"
        "ref_vstX_lane.c"
        "ref_vtbX.c"
        "ref_vrecpe.c"
        "ref_vrsqrte.c"
        "ref_vcage.c"
        "ref_vcagt.c"
        "ref_vcale.c"
        "ref_vcalt.c"
        "ref_vrecps.c"
        "ref_vrsqrts.c"
        "ref_vcvt.c"
    ];
    stl = "none";

    enabled = false;
    arch = {
        arm = {
            neon = {
                enabled = true;
            };
        };
    };
};

arm_neon_tests_arm = cc_test {
    name = "arm_neon_tests_arm";
    defaults = ["arm_neon_tests_defaults"];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

arm_neon_tests_thumb = cc_test {
    name = "arm_neon_tests_thumb";
    arch = {
        arm = {
            instruction_set = "thumb";
        };
    };
};

in { inherit arm_neon_tests_arm arm_neon_tests_defaults arm_neon_tests_thumb; }
