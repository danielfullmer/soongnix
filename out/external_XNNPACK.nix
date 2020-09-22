{ cc_benchmark, cc_defaults, cc_library_static, cc_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

OPERATOR_SRCS = [
    "src/add-nc.c"
    "src/argmax-pooling-nhwc.c"
    "src/average-pooling-nhwc.c"
    "src/binary-elementwise-nd.c"
    "src/channel-pad-nc.c"
    "src/channel-shuffle-nc.c"
    "src/clamp-nc.c"
    "src/convolution-nchw.c"
    "src/convolution-nhwc.c"
    "src/deconvolution-nhwc.c"
    "src/fully-connected-nc.c"
    "src/global-average-pooling-ncw.c"
    "src/global-average-pooling-nwc.c"
    "src/hardswish-nc.c"
    "src/leaky-relu-nc.c"
    "src/max-pooling-nhwc.c"
    "src/prelu-nc.c"
    "src/resize-bilinear-nhwc.c"
    "src/sigmoid-nc.c"
    "src/softmax-nc.c"
    "src/unpooling-nhwc.c"
];

TABLE_SRCS = [
    "src/tables/exp2-k-over-64.c"
    "src/tables/exp2-k-over-2048.c"
];

SCALAR_UKERNELS = [
    "src/f32-argmaxpool/4x-scalar-c1.c"
    "src/f32-argmaxpool/9p8x-scalar-c1.c"
    "src/f32-argmaxpool/9x-scalar-c1.c"
    "src/f32-avgpool/mp9p8q-scalar.c"
    "src/f32-avgpool/up9-scalar.c"
    "src/f32-bilinear/gen/scalar-c1.c"
    "src/f32-bilinear/gen/scalar-c2.c"
    "src/f32-bilinear/gen/scalar-c4.c"
    "src/f32-clamp/scalar.c"
    "src/f32-conv-hwc/3x3s2p0p1c3x4-scalar-1x1.c"
    "src/f32-conv-hwc/3x3s2p1c3x4-scalar-1x1.c"
    "src/f32-conv-hwc2spchw/3x3s2p1c3x4-scalar-1x1.c"
    "src/f32-dwconv-spchw/3x3p1-scalar.c"
    "src/f32-dwconv-spchw/3x3s2p1-scalar.c"
    "src/f32-dwconv-spchw/5x5p2-scalar.c"
    "src/f32-dwconv-spchw/5x5s2p2-scalar.c"
    "src/f32-dwconv/gen/up1x25-scalar-acc2.c"
    "src/f32-dwconv/gen/up1x25-scalar.c"
    "src/f32-dwconv/gen/up1x4-scalar-acc2.c"
    "src/f32-dwconv/gen/up1x4-scalar.c"
    "src/f32-dwconv/gen/up1x9-scalar-acc2.c"
    "src/f32-dwconv/gen/up1x9-scalar.c"
    "src/f32-dwconv/gen/up2x25-scalar-acc2.c"
    "src/f32-dwconv/gen/up2x25-scalar.c"
    "src/f32-dwconv/gen/up2x4-scalar-acc2.c"
    "src/f32-dwconv/gen/up2x4-scalar.c"
    "src/f32-dwconv/gen/up2x9-scalar-acc2.c"
    "src/f32-dwconv/gen/up2x9-scalar.c"
    "src/f32-gavgpool-spchw/scalar-x1.c"
    "src/f32-gavgpool/mp7p7q-scalar.c"
    "src/f32-gavgpool/up7-scalar.c"
    "src/f32-gemm/gen-inc/1x4-scalar.c"
    "src/f32-gemm/gen-inc/2x4-scalar.c"
    "src/f32-gemm/gen-inc/4x4-scalar.c"
    "src/f32-gemm/gen/1x4-scalar.c"
    "src/f32-gemm/gen/2x4-scalar.c"
    "src/f32-gemm/gen/4x2-scalar.c"
    "src/f32-gemm/gen/4x4-scalar.c"
    "src/f32-hswish/gen/scalar-x1.c"
    "src/f32-hswish/gen/scalar-x2.c"
    "src/f32-hswish/gen/scalar-x4.c"
    "src/f32-igemm/gen/1x4-scalar.c"
    "src/f32-igemm/gen/2x4-scalar.c"
    "src/f32-igemm/gen/4x2-scalar.c"
    "src/f32-igemm/gen/4x4-scalar.c"
    "src/f32-maxpool/9p8x-scalar-c1.c"
    "src/f32-pavgpool/mp9p8q-scalar.c"
    "src/f32-pavgpool/up9-scalar.c"
    "src/f32-ppmm/gen/2x4-scalar.c"
    "src/f32-ppmm/gen/3x3-scalar.c"
    "src/f32-ppmm/gen/4x2-scalar.c"
    "src/f32-ppmm/gen/4x4-scalar.c"
    "src/f32-prelu/gen/scalar-2x1.c"
    "src/f32-prelu/gen/scalar-2x4.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x1.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x2-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x4.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x4-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-lut64-p2-x4-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x1.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x2-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x4.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x4-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/scalar-p5-x4-acc4.c"
    "src/f32-rmax/scalar.c"
    "src/f32-sigmoid/gen/scalar-lut2048-p1-div-x1.c"
    "src/f32-sigmoid/gen/scalar-lut2048-p1-div-x2.c"
    "src/f32-sigmoid/gen/scalar-lut2048-p1-div-x4.c"
    "src/f32-sigmoid/gen/scalar-lut64-p2-div-x1.c"
    "src/f32-sigmoid/gen/scalar-lut64-p2-div-x2.c"
    "src/f32-sigmoid/gen/scalar-lut64-p2-div-x4.c"
    "src/f32-sigmoid/gen/scalar-p5-div-x1.c"
    "src/f32-sigmoid/gen/scalar-p5-div-x2.c"
    "src/f32-sigmoid/gen/scalar-p5-div-x4.c"
    "src/f32-spmm/gen/1x1-scalar-pipelined.c"
    "src/f32-spmm/gen/1x1-scalar.c"
    "src/f32-spmm/gen/2x1-scalar-pipelined.c"
    "src/f32-spmm/gen/2x1-scalar.c"
    "src/f32-spmm/gen/4x1-scalar-pipelined.c"
    "src/f32-spmm/gen/4x1-scalar.c"
    "src/f32-spmm/gen/8x1-scalar-pipelined.c"
    "src/f32-spmm/gen/8x1-scalar.c"
    "src/f32-spmm/gen/8x2-scalar.c"
    "src/f32-spmm/gen/8x4-scalar.c"
    "src/f32-vbinary/gen/vadd-scalar-x1.c"
    "src/f32-vbinary/gen/vadd-scalar-x2.c"
    "src/f32-vbinary/gen/vadd-scalar-x4.c"
    "src/f32-vbinary/gen/vaddc-scalar-x1.c"
    "src/f32-vbinary/gen/vaddc-scalar-x2.c"
    "src/f32-vbinary/gen/vaddc-scalar-x4.c"
    "src/f32-vbinary/gen/vdiv-scalar-x1.c"
    "src/f32-vbinary/gen/vdiv-scalar-x2.c"
    "src/f32-vbinary/gen/vdiv-scalar-x4.c"
    "src/f32-vbinary/gen/vdivc-scalar-x1.c"
    "src/f32-vbinary/gen/vdivc-scalar-x2.c"
    "src/f32-vbinary/gen/vdivc-scalar-x4.c"
    "src/f32-vbinary/gen/vmax-scalar-x1.c"
    "src/f32-vbinary/gen/vmax-scalar-x2.c"
    "src/f32-vbinary/gen/vmax-scalar-x4.c"
    "src/f32-vbinary/gen/vmaxc-scalar-x1.c"
    "src/f32-vbinary/gen/vmaxc-scalar-x2.c"
    "src/f32-vbinary/gen/vmaxc-scalar-x4.c"
    "src/f32-vbinary/gen/vmin-scalar-x1.c"
    "src/f32-vbinary/gen/vmin-scalar-x2.c"
    "src/f32-vbinary/gen/vmin-scalar-x4.c"
    "src/f32-vbinary/gen/vminc-scalar-x1.c"
    "src/f32-vbinary/gen/vminc-scalar-x2.c"
    "src/f32-vbinary/gen/vminc-scalar-x4.c"
    "src/f32-vbinary/gen/vmul-scalar-x1.c"
    "src/f32-vbinary/gen/vmul-scalar-x2.c"
    "src/f32-vbinary/gen/vmul-scalar-x4.c"
    "src/f32-vbinary/gen/vmulc-scalar-x1.c"
    "src/f32-vbinary/gen/vmulc-scalar-x2.c"
    "src/f32-vbinary/gen/vmulc-scalar-x4.c"
    "src/f32-vbinary/gen/vrdivc-scalar-x1.c"
    "src/f32-vbinary/gen/vrdivc-scalar-x2.c"
    "src/f32-vbinary/gen/vrdivc-scalar-x4.c"
    "src/f32-vbinary/gen/vrsubc-scalar-x1.c"
    "src/f32-vbinary/gen/vrsubc-scalar-x2.c"
    "src/f32-vbinary/gen/vrsubc-scalar-x4.c"
    "src/f32-vbinary/gen/vsub-scalar-x1.c"
    "src/f32-vbinary/gen/vsub-scalar-x2.c"
    "src/f32-vbinary/gen/vsub-scalar-x4.c"
    "src/f32-vbinary/gen/vsubc-scalar-x1.c"
    "src/f32-vbinary/gen/vsubc-scalar-x2.c"
    "src/f32-vbinary/gen/vsubc-scalar-x4.c"
    "src/f32-vmulcaddc/gen/c1-scalar-2x.c"
    "src/f32-vmulcaddc/gen/c2-scalar-2x.c"
    "src/f32-vmulcaddc/gen/c4-scalar-2x.c"
    "src/math/expminus-scalar-lut2048-p1.c"
    "src/math/expminus-scalar-lut64-p2.c"
    "src/math/expminus-scalar-p5.c"
    "src/math/sigmoid-scalar-lut2048-p1-div.c"
    "src/math/sigmoid-scalar-lut64-p2-div.c"
    "src/math/sigmoid-scalar-p5-div.c"
    "src/q8-avgpool/mp9p8q-scalar.c"
    "src/q8-avgpool/up9-scalar.c"
    "src/q8-dwconv/up1x9-scalar.c"
    "src/q8-gavgpool/mp7p7q-scalar.c"
    "src/q8-gavgpool/up7-scalar.c"
    "src/q8-gemm/2x2-scalar.c"
    "src/q8-igemm/2x2-scalar.c"
    "src/q8-vadd/scalar.c"
    "src/u8-clamp/scalar.c"
    "src/u8-lut32norm/scalar.c"
    "src/u8-maxpool/9p8x-scalar-c1.c"
    "src/u8-rmax/scalar.c"
    "src/x32-packx/x2-scalar.c"
    "src/x32-packx/x3-scalar.c"
    "src/x32-packx/x4-scalar.c"
    "src/x32-pad/x2-scalar.c"
    "src/x32-unpool/scalar.c"
    "src/x32-zip/x2-scalar.c"
    "src/x32-zip/x3-scalar.c"
    "src/x32-zip/x4-scalar.c"
    "src/x32-zip/xm-scalar.c"
    "src/x8-lut/scalar.c"
    "src/x8-zip/x2-scalar.c"
    "src/x8-zip/x3-scalar.c"
    "src/x8-zip/x4-scalar.c"
    "src/x8-zip/xm-scalar.c"
];

PSIMD_FASTMATH_UKERNELS = [
    "src/f32-argmaxpool/4x-psimd-c4.c"
    "src/f32-argmaxpool/9p8x-psimd-c4.c"
    "src/f32-argmaxpool/9x-psimd-c4.c"
    "src/f32-avgpool/mp9p8q-psimd.c"
    "src/f32-avgpool/up9-psimd.c"
    "src/f32-bilinear/gen/psimd-c4.c"
    "src/f32-bilinear/gen/psimd-c8.c"
    "src/f32-clamp/psimd.c"
    "src/f32-dwconv/gen/up4x25-psimd-acc2.c"
    "src/f32-dwconv/gen/up4x25-psimd.c"
    "src/f32-dwconv/gen/up4x4-psimd-acc2.c"
    "src/f32-dwconv/gen/up4x4-psimd.c"
    "src/f32-dwconv/gen/up4x9-psimd-acc2.c"
    "src/f32-dwconv/gen/up4x9-psimd.c"
    "src/f32-dwconv/gen/up8x25-psimd-acc2.c"
    "src/f32-dwconv/gen/up8x25-psimd.c"
    "src/f32-dwconv/gen/up8x4-psimd-acc2.c"
    "src/f32-dwconv/gen/up8x4-psimd.c"
    "src/f32-dwconv/gen/up8x9-psimd-acc2.c"
    "src/f32-dwconv/gen/up8x9-psimd.c"
    "src/f32-gavgpool/mp7p7q-psimd.c"
    "src/f32-gavgpool/up7-psimd.c"
    "src/f32-gemm/gen/1x8-psimd-loadsplat.c"
    "src/f32-gemm/gen/1x8-psimd-splat.c"
    "src/f32-gemm/gen/1x8s4-psimd.c"
    "src/f32-gemm/gen/4x8-psimd-loadsplat.c"
    "src/f32-gemm/gen/4x8-psimd-splat.c"
    "src/f32-gemm/gen/4x8s4-psimd.c"
    "src/f32-gemm/gen/6x8-psimd-loadsplat.c"
    "src/f32-gemm/gen/6x8-psimd-splat.c"
    "src/f32-gemm/gen/6x8s4-psimd.c"
    "src/f32-gemm/gen-inc/1x8-psimd-loadsplat.c"
    "src/f32-gemm/gen-inc/1x8-psimd-splat.c"
    "src/f32-gemm/gen-inc/1x8s4-psimd.c"
    "src/f32-gemm/gen-inc/4x8-psimd-loadsplat.c"
    "src/f32-gemm/gen-inc/4x8-psimd-splat.c"
    "src/f32-gemm/gen-inc/4x8s4-psimd.c"
    "src/f32-gemm/gen-inc/6x8-psimd-loadsplat.c"
    "src/f32-gemm/gen-inc/6x8-psimd-splat.c"
    "src/f32-gemm/gen-inc/6x8s4-psimd.c"
    "src/f32-hswish/gen/psimd-x4.c"
    "src/f32-hswish/gen/psimd-x8.c"
    "src/f32-igemm/gen/1x8-psimd-loadsplat.c"
    "src/f32-igemm/gen/1x8-psimd-splat.c"
    "src/f32-igemm/gen/1x8s4-psimd.c"
    "src/f32-igemm/gen/4x2c4-psimd.c"
    "src/f32-igemm/gen/4x8-psimd-loadsplat.c"
    "src/f32-igemm/gen/4x8-psimd-splat.c"
    "src/f32-igemm/gen/4x8s4-psimd.c"
    "src/f32-igemm/gen/6x8-psimd-loadsplat.c"
    "src/f32-igemm/gen/6x8-psimd-splat.c"
    "src/f32-igemm/gen/6x8s4-psimd.c"
    "src/f32-maxpool/9p8x-psimd-c4.c"
    "src/f32-pavgpool/mp9p8q-psimd.c"
    "src/f32-pavgpool/up9-psimd.c"
    "src/f32-ppmm/gen/4x8-psimd.c"
    "src/f32-prelu/gen/psimd-2x4.c"
    "src/f32-prelu/gen/psimd-2x8.c"
    "src/f32-rmax/psimd.c"
    "src/f32-vbinary/gen/vadd-psimd-x4.c"
    "src/f32-vbinary/gen/vadd-psimd-x8.c"
    "src/f32-vbinary/gen/vaddc-psimd-x4.c"
    "src/f32-vbinary/gen/vaddc-psimd-x8.c"
    "src/f32-vbinary/gen/vdiv-psimd-x4.c"
    "src/f32-vbinary/gen/vdiv-psimd-x8.c"
    "src/f32-vbinary/gen/vdivc-psimd-x4.c"
    "src/f32-vbinary/gen/vdivc-psimd-x8.c"
    "src/f32-vbinary/gen/vmax-psimd-x4.c"
    "src/f32-vbinary/gen/vmax-psimd-x8.c"
    "src/f32-vbinary/gen/vmaxc-psimd-x4.c"
    "src/f32-vbinary/gen/vmaxc-psimd-x8.c"
    "src/f32-vbinary/gen/vmin-psimd-x4.c"
    "src/f32-vbinary/gen/vmin-psimd-x8.c"
    "src/f32-vbinary/gen/vminc-psimd-x4.c"
    "src/f32-vbinary/gen/vminc-psimd-x8.c"
    "src/f32-vbinary/gen/vmul-psimd-x4.c"
    "src/f32-vbinary/gen/vmul-psimd-x8.c"
    "src/f32-vbinary/gen/vmulc-psimd-x4.c"
    "src/f32-vbinary/gen/vmulc-psimd-x8.c"
    "src/f32-vbinary/gen/vrdivc-psimd-x4.c"
    "src/f32-vbinary/gen/vrdivc-psimd-x8.c"
    "src/f32-vbinary/gen/vrsubc-psimd-x4.c"
    "src/f32-vbinary/gen/vrsubc-psimd-x8.c"
    "src/f32-vbinary/gen/vsub-psimd-x4.c"
    "src/f32-vbinary/gen/vsub-psimd-x8.c"
    "src/f32-vbinary/gen/vsubc-psimd-x4.c"
    "src/f32-vbinary/gen/vsubc-psimd-x8.c"
    "src/f32-vmulcaddc/gen/c4-psimd-2x.c"
    "src/f32-vmulcaddc/gen/c8-psimd-2x.c"
    "src/x32-packx/x4-psimd.c"
    "src/x32-pad/x2-psimd.c"
    "src/x32-unpool/psimd.c"
    "src/x32-zip/x2-psimd.c"
    "src/x32-zip/x3-psimd.c"
    "src/x32-zip/x4-psimd.c"
    "src/x32-zip/xm-psimd.c"
];

PSIMD_ACCMATH_UKERNELS = [
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x4.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x8.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x12.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x16.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x20.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/psimd-p5-x20-acc5.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x4.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x8.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x12.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x16.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x20.c"
    "src/f32-sigmoid/gen/psimd-p5-div-x24.c"
    "src/math/sigmoid-psimd-p5-div.c"
];

#  ISA-specific micro-kernels
NEON_UKERNELS = [
    "src/f32-avgpool/mp9p8q-neon.c"
    "src/f32-avgpool/up9-neon.c"
    "src/f32-bilinear/gen/neon-c4.c"
    "src/f32-bilinear/gen/neon-c8.c"
    "src/f32-clamp/neon.c"
    "src/f32-dwconv/gen/up4x9-neon.c"
    "src/f32-dwconv/gen/up4x9-neon-acc2.c"
    "src/f32-dwconv/gen/up8x9-neon.c"
    "src/f32-dwconv/gen/up8x9-neon-acc2.c"
    "src/f32-gavgpool-spchw/neon-x4.c"
    "src/f32-gavgpool/mp7p7q-neon.c"
    "src/f32-gavgpool/up7-neon.c"
    "src/f32-gemm/gen/1x8-neon-lane-ld64.c"
    "src/f32-gemm/gen/4x2-neon-lane-ld64.c"
    "src/f32-gemm/gen/4x8-neon-lane-ld128.c"
    "src/f32-gemm/gen/4x8-neon-lane-ld64.c"
    "src/f32-gemm/gen/5x8-neon-lane-ld64.c"
    "src/f32-gemm/gen/6x8-neon-lane-ld64.c"
    "src/f32-gemm/gen/6x8-neon-lane-ld128.c"
    "src/f32-gemm/gen/1x8-neon-dup-ld64.c"
    "src/f32-gemm/gen/4x8-neon-dup-ld128.c"
    "src/f32-gemm/gen/4x8-neon-dup-ld64.c"
    "src/f32-gemm/gen/6x8-neon-dup-ld64.c"
    "src/f32-gemm/gen/6x8-neon-dup-ld128.c"
    "src/f32-gemm/gen/1x8s4-neon.c"
    "src/f32-gemm/gen/4x8s4-neon.c"
    "src/f32-gemm/gen/6x8s4-neon.c"
    "src/f32-gemm/gen/8x8s4-neon.c"
    "src/f32-gemm/gen-inc/1x8-neon-lane-ld64.c"
    "src/f32-gemm/gen-inc/4x8-neon-lane-ld128.c"
    "src/f32-gemm/gen-inc/4x8-neon-lane-ld64.c"
    "src/f32-gemm/gen-inc/5x8-neon-lane-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neon-lane-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neon-lane-ld128.c"
    "src/f32-gemm/gen-inc/1x8-neon-dup-ld64.c"
    "src/f32-gemm/gen-inc/4x8-neon-dup-ld128.c"
    "src/f32-gemm/gen-inc/4x8-neon-dup-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neon-dup-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neon-dup-ld128.c"
    "src/f32-gemm/gen-inc/1x8s4-neon.c"
    "src/f32-gemm/gen-inc/4x8s4-neon.c"
    "src/f32-gemm/gen-inc/6x8s4-neon.c"
    "src/f32-gemm/gen-inc/8x8s4-neon.c"
    "src/f32-hswish/gen/neon-x4.c"
    "src/f32-hswish/gen/neon-x8.c"
    "src/f32-igemm/gen/1x8-neon-lane-ld64.c"
    "src/f32-igemm/gen/4x2-neon-lane-ld64.c"
    "src/f32-igemm/gen/4x4-neon-lane-ld64.c"
    "src/f32-igemm/gen/4x8-neon-lane-ld128.c"
    "src/f32-igemm/gen/4x8-neon-lane-ld64.c"
    "src/f32-igemm/gen/6x8-neon-lane-ld64.c"
    "src/f32-igemm/gen/6x8-neon-lane-ld128.c"
    "src/f32-igemm/gen/1x8-neon-dup-ld64.c"
    "src/f32-igemm/gen/4x8-neon-dup-ld128.c"
    "src/f32-igemm/gen/4x8-neon-dup-ld64.c"
    "src/f32-igemm/gen/6x8-neon-dup-ld64.c"
    "src/f32-igemm/gen/6x8-neon-dup-ld128.c"
    "src/f32-igemm/gen/1x8s4-neon.c"
    "src/f32-igemm/gen/4x8s4-neon.c"
    "src/f32-igemm/gen/6x8s4-neon.c"
    "src/f32-igemm/gen/8x8s4-neon.c"
    "src/f32-pavgpool/mp9p8q-neon.c"
    "src/f32-pavgpool/up9-neon.c"
    "src/f32-ppmm/gen/4x8-neon.c"
    "src/f32-ppmm/gen/8x8-neon.c"
    "src/f32-prelu/gen/neon-2x4.c"
    "src/f32-prelu/gen/neon-2x8.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x4.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x8.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x12.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x16.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x20.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-p5-x20-acc5.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x4.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x8.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x12.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x16.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x20.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neon-lut64-p2-x20-acc5.c"
    "src/f32-rmax/neon.c"
    "src/f32-sigmoid/gen/neon-frac-p9-p10-nr1recps-x16.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neon-rr2-p5-nr2recps-x24.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neon-rr2-lut64-p2-nr2recps-x24.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neon-rr2-lut2048-p1-nr2recps-x24.c"
    "src/f32-vbinary/gen/vadd-neon-x4.c"
    "src/f32-vbinary/gen/vadd-neon-x8.c"
    "src/f32-vbinary/gen/vaddc-neon-x4.c"
    "src/f32-vbinary/gen/vaddc-neon-x8.c"
    "src/f32-vbinary/gen/vmax-neon-x4.c"
    "src/f32-vbinary/gen/vmax-neon-x8.c"
    "src/f32-vbinary/gen/vmaxc-neon-x4.c"
    "src/f32-vbinary/gen/vmaxc-neon-x8.c"
    "src/f32-vbinary/gen/vmin-neon-x4.c"
    "src/f32-vbinary/gen/vmin-neon-x8.c"
    "src/f32-vbinary/gen/vminc-neon-x4.c"
    "src/f32-vbinary/gen/vminc-neon-x8.c"
    "src/f32-vbinary/gen/vmul-neon-x4.c"
    "src/f32-vbinary/gen/vmul-neon-x8.c"
    "src/f32-vbinary/gen/vmulc-neon-x4.c"
    "src/f32-vbinary/gen/vmulc-neon-x8.c"
    "src/f32-vbinary/gen/vrsubc-neon-x4.c"
    "src/f32-vbinary/gen/vrsubc-neon-x8.c"
    "src/f32-vbinary/gen/vsub-neon-x4.c"
    "src/f32-vbinary/gen/vsub-neon-x8.c"
    "src/f32-vbinary/gen/vsubc-neon-x4.c"
    "src/f32-vbinary/gen/vsubc-neon-x8.c"
    "src/f32-vmulcaddc/gen/c4-neon-2x.c"
    "src/f32-vmulcaddc/gen/c8-neon-2x.c"
    "src/q8-avgpool/mp9p8q-neon.c"
    "src/q8-avgpool/up9-neon.c"
    "src/q8-dwconv/up8x9-neon.c"
    "src/q8-gavgpool/mp7p7q-neon.c"
    "src/q8-gavgpool/up7-neon.c"
    "src/q8-gemm/4x8-neon.c"
    "src/q8-gemm/8x8-neon.c"
    "src/q8-igemm/4x8-neon.c"
    "src/q8-igemm/8x8-neon.c"
    "src/q8-vadd/neon.c"
    "src/u8-clamp/neon.c"
    "src/u8-maxpool/9p8x-neon-c16.c"
    "src/u8-rmax/neon.c"
    "src/x32-packx/x4-neon-st4.c"
    "src/x32-pad/x2-neon.c"
    "src/x32-zip/x2-neon.c"
    "src/x32-zip/x3-neon.c"
    "src/x32-zip/x4-neon.c"
    "src/x32-zip/xm-neon.c"
    "src/x8-zip/x2-neon.c"
    "src/x8-zip/x3-neon.c"
    "src/x8-zip/x4-neon.c"
    "src/x8-zip/xm-neon.c"
    "src/math/sigmoid-neon-frac-p9-p10-nr1recps.c"
    "src/math/sigmoid-neon-rr1-lut2048-p1-nr2recps.c"
    "src/math/sigmoid-neon-rr1-lut64-p2-nr2recps.c"
    "src/math/sigmoid-neon-rr1-p5-nr2recps.c"
    "src/math/sigmoid-neon-rr2-lut2048-p1-nr2recps.c"
    "src/math/sigmoid-neon-rr2-lut64-p2-nr2recps.c"
    "src/math/sigmoid-neon-rr2-p5-nr2recps.c"
];

NEONFMA_UKERNELS = [
    "src/f32-bilinear/gen/neonfma-c4.c"
    "src/f32-bilinear/gen/neonfma-c8.c"
    "src/f32-igemm/gen/1x8-neonfma-dup-ld64.c"
    "src/f32-igemm/gen/4x8-neonfma-dup-ld128.c"
    "src/f32-igemm/gen/4x8-neonfma-dup-ld64.c"
    "src/f32-igemm/gen/6x8-neonfma-dup-ld64.c"
    "src/f32-igemm/gen/6x8-neonfma-dup-ld128.c"
    "src/f32-igemm/gen/1x8s4-neonfma.c"
    "src/f32-igemm/gen/4x8s4-neonfma.c"
    "src/f32-igemm/gen/6x8s4-neonfma.c"
    "src/f32-igemm/gen/8x8s4-neonfma.c"
    "src/f32-dwconv/gen/up4x9-neonfma.c"
    "src/f32-dwconv/gen/up4x9-neonfma-acc2.c"
    "src/f32-dwconv/gen/up8x9-neonfma.c"
    "src/f32-dwconv/gen/up8x9-neonfma-acc2.c"
    "src/f32-gemm/gen/1x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen/4x8-neonfma-dup-ld128.c"
    "src/f32-gemm/gen/4x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen/6x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen/6x8-neonfma-dup-ld128.c"
    "src/f32-gemm/gen/1x8s4-neonfma.c"
    "src/f32-gemm/gen/4x8s4-neonfma.c"
    "src/f32-gemm/gen/6x8s4-neonfma.c"
    "src/f32-gemm/gen/8x8s4-neonfma.c"
    "src/f32-gemm/gen-inc/1x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen-inc/4x8-neonfma-dup-ld128.c"
    "src/f32-gemm/gen-inc/4x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neonfma-dup-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neonfma-dup-ld128.c"
    "src/f32-gemm/gen-inc/1x8s4-neonfma.c"
    "src/f32-gemm/gen-inc/4x8s4-neonfma.c"
    "src/f32-gemm/gen-inc/6x8s4-neonfma.c"
    "src/f32-gemm/gen-inc/8x8s4-neonfma.c"
    "src/f32-hswish/gen/neonfma-x4.c"
    "src/f32-hswish/gen/neonfma-x8.c"
    "src/f32-ppmm/gen/4x8-neonfma.c"
    "src/f32-ppmm/gen/8x8-neonfma.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x4.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x8.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x12.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x16.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x20.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-p5-x20-acc5.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x4.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x8.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x12.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x16.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x20.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/neonfma-lut64-p2-x20-acc5.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr1recps1fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-nr2recps-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr1recps1fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-nr2recps-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr1recps1fma-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-nr2recps-x24.c"
    "src/f32-vmulcaddc/gen/c4-neonfma-2x.c"
    "src/f32-vmulcaddc/gen/c8-neonfma-2x.c"
    "src/math/exp-neonfma-lut64-p2.c"
    "src/math/exp-neonfma-p5.c"
    "src/math/expminus-neonfma-lut2048-p1.c"
    "src/math/expminus-neonfma-lut64-p2.c"
    "src/math/expminus-neonfma-p5.c"
    "src/math/sigmoid-neonfma-rr1-lut2048-p1-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr1-lut2048-p1-nr2fma.c"
    "src/math/sigmoid-neonfma-rr1-lut2048-p1-nr2recps.c"
    "src/math/sigmoid-neonfma-rr1-lut64-p2-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr1-lut64-p2-nr2fma.c"
    "src/math/sigmoid-neonfma-rr1-lut64-p2-nr2recps.c"
    "src/math/sigmoid-neonfma-rr1-p5-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr1-p5-nr2fma.c"
    "src/math/sigmoid-neonfma-rr1-p5-nr2recps.c"
    "src/math/sigmoid-neonfma-rr2-lut2048-p1-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr2-lut2048-p1-nr2fma.c"
    "src/math/sigmoid-neonfma-rr2-lut2048-p1-nr2recps.c"
    "src/math/sigmoid-neonfma-rr2-lut64-p2-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr2-lut64-p2-nr2fma.c"
    "src/math/sigmoid-neonfma-rr2-lut64-p2-nr2recps.c"
    "src/math/sigmoid-neonfma-rr2-p5-nr1recps1fma.c"
    "src/math/sigmoid-neonfma-rr2-p5-nr2fma.c"
    "src/math/sigmoid-neonfma-rr2-p5-nr2recps.c"
];

AARCH64_NEONFMA_UKERNELS = [
    "src/f32-vbinary/gen/vdiv-neon-x4.c"
    "src/f32-vbinary/gen/vdiv-neon-x8.c"
    "src/f32-vbinary/gen/vdivc-neon-x4.c"
    "src/f32-vbinary/gen/vdivc-neon-x8.c"
    "src/f32-vbinary/gen/vrdivc-neon-x4.c"
    "src/f32-vbinary/gen/vrdivc-neon-x8.c"
    "src/f32-gemm/gen/1x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen/4x2-neonfma-lane-ld64.c"
    "src/f32-gemm/gen/4x8-neonfma-lane-ld128.c"
    "src/f32-gemm/gen/4x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen/5x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen/6x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen/6x8-neonfma-lane-ld128.c"
    "src/f32-gemm/gen-inc/1x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen-inc/4x8-neonfma-lane-ld128.c"
    "src/f32-gemm/gen-inc/4x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen-inc/5x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neonfma-lane-ld64.c"
    "src/f32-gemm/gen-inc/6x8-neonfma-lane-ld128.c"
    "src/f32-igemm/gen/1x8-neonfma-lane-ld64.c"
    "src/f32-igemm/gen/4x2-neonfma-lane-ld64.c"
    "src/f32-igemm/gen/4x4-neonfma-lane-ld64.c"
    "src/f32-igemm/gen/4x8-neonfma-lane-ld128.c"
    "src/f32-igemm/gen/4x8-neonfma-lane-ld64.c"
    "src/f32-igemm/gen/6x8-neonfma-lane-ld64.c"
    "src/f32-igemm/gen/6x8-neonfma-lane-ld128.c"
    "src/f32-conv-hwc/3x3s2p1c3x4-neonfma-2x2.c"
    "src/f32-conv-hwc/3x3s2p1c3x8-neonfma-2x2.c"
    "src/f32-conv-hwc2spchw/3x3s2p1c3x4-neonfma-2x2.c"
    "src/f32-dwconv-spchw/3x3p1-neonfma.c"
    "src/f32-dwconv-spchw/5x5p2-neonfma.c"
    "src/f32-dwconv-spchw/3x3s2p1-neonfma.c"
    "src/f32-dwconv-spchw/5x5s2p2-neonfma.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-p5-div-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut64-p2-div-x24.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x4.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x8.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x12.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x16.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x20.c"
    "src/f32-sigmoid/gen/neonfma-rr1-lut2048-p1-div-x24.c"
    "src/f32-spmm/gen/12x1-neonfma.c"
    "src/f32-spmm/gen/12x2-neonfma.c"
    "src/f32-spmm/gen/12x4-neonfma.c"
    "src/f32-spmm/gen/16x1-neonfma-pipelined.c"
    "src/f32-spmm/gen/16x1-neonfma-unroll2.c"
    "src/f32-spmm/gen/16x1-neonfma.c"
    "src/f32-spmm/gen/16x2-neonfma.c"
    "src/f32-spmm/gen/16x4-neonfma.c"
    "src/f32-spmm/gen/4x1-neonfma-pipelined.c"
    "src/f32-spmm/gen/4x1-neonfma-unroll2.c"
    "src/f32-spmm/gen/4x1-neonfma.c"
    "src/f32-spmm/gen/4x2-neonfma.c"
    "src/f32-spmm/gen/4x4-neonfma.c"
    "src/f32-spmm/gen/8x1-neonfma-pipelined.c"
    "src/f32-spmm/gen/8x1-neonfma-unroll2.c"
    "src/f32-spmm/gen/8x1-neonfma.c"
    "src/f32-spmm/gen/8x2-neonfma.c"
    "src/f32-spmm/gen/8x4-neonfma.c"
    "src/math/sigmoid-neonfma-rr1-lut2048-p1-div.c"
    "src/math/sigmoid-neonfma-rr1-lut64-p2-div.c"
    "src/math/sigmoid-neonfma-rr1-p5-div.c"
    "src/math/sigmoid-neonfma-rr2-lut2048-p1-div.c"
    "src/math/sigmoid-neonfma-rr2-lut64-p2-div.c"
    "src/math/sigmoid-neonfma-rr2-p5-div.c"
];

AARCH64_NEONFP16ARITH_UKERNELS = [
    "src/f16-gemm/gen/4x8-neonfp16arith-ld64.c"
    "src/f16-gemm/gen/6x8-neonfp16arith-ld64.c"
    "src/f16-gemm/gen/8x8-neonfp16arith-ld64.c"
];

SSE_UKERNELS = [
    "src/f32-avgpool/mp9p8q-sse.c"
    "src/f32-avgpool/up9-sse.c"
    "src/f32-bilinear/gen/sse-c4.c"
    "src/f32-bilinear/gen/sse-c8.c"
    "src/f32-clamp/sse.c"
    "src/f32-dwconv-spchw/3x3p1-sse.c"
    "src/f32-dwconv-spchw/3x3s2p1-sse.c"
    "src/f32-dwconv/gen/up4x25-sse-acc2.c"
    "src/f32-dwconv/gen/up4x25-sse.c"
    "src/f32-dwconv/gen/up4x4-sse-acc2.c"
    "src/f32-dwconv/gen/up4x4-sse.c"
    "src/f32-dwconv/gen/up4x9-sse-acc2.c"
    "src/f32-dwconv/gen/up4x9-sse.c"
    "src/f32-dwconv/gen/up8x25-sse-acc2.c"
    "src/f32-dwconv/gen/up8x25-sse.c"
    "src/f32-dwconv/gen/up8x4-sse-acc2.c"
    "src/f32-dwconv/gen/up8x4-sse.c"
    "src/f32-dwconv/gen/up8x9-sse-acc2.c"
    "src/f32-dwconv/gen/up8x9-sse.c"
    "src/f32-gavgpool-spchw/sse-x4.c"
    "src/f32-gavgpool/mp7p7q-sse.c"
    "src/f32-gavgpool/up7-sse.c"
    "src/f32-gemm/gen/1x8-sse-dup.c"
    "src/f32-gemm/gen/1x8-sse-load1.c"
    "src/f32-gemm/gen/1x8s4-sse.c"
    "src/f32-gemm/gen/4x8-sse-dup.c"
    "src/f32-gemm/gen/4x8-sse-load1.c"
    "src/f32-gemm/gen/4x8s4-sse.c"
    "src/f32-gemm/gen-inc/1x8-sse-dup.c"
    "src/f32-gemm/gen-inc/1x8-sse-load1.c"
    "src/f32-gemm/gen-inc/1x8s4-sse.c"
    "src/f32-gemm/gen-inc/4x8-sse-dup.c"
    "src/f32-gemm/gen-inc/4x8-sse-load1.c"
    "src/f32-gemm/gen-inc/4x8s4-sse.c"
    "src/f32-hswish/gen/sse-x4.c"
    "src/f32-hswish/gen/sse-x8.c"
    "src/f32-igemm/gen/1x8-sse-dup.c"
    "src/f32-igemm/gen/1x8-sse-load1.c"
    "src/f32-igemm/gen/1x8s4-sse.c"
    "src/f32-igemm/gen/4x2c4-sse.c"
    "src/f32-igemm/gen/4x8-sse-dup.c"
    "src/f32-igemm/gen/4x8-sse-load1.c"
    "src/f32-igemm/gen/4x8s4-sse.c"
    "src/f32-maxpool/9p8x-sse-c4.c"
    "src/f32-pavgpool/mp9p8q-sse.c"
    "src/f32-pavgpool/up9-sse.c"
    "src/f32-ppmm/gen/4x8-sse.c"
    "src/f32-rmax/sse.c"
    "src/f32-spmm/gen/4x1-sse.c"
    "src/f32-spmm/gen/8x1-sse.c"
    "src/f32-vbinary/gen/vadd-sse-x4.c"
    "src/f32-vbinary/gen/vadd-sse-x8.c"
    "src/f32-vbinary/gen/vaddc-sse-x4.c"
    "src/f32-vbinary/gen/vaddc-sse-x8.c"
    "src/f32-vbinary/gen/vdiv-sse-x4.c"
    "src/f32-vbinary/gen/vdiv-sse-x8.c"
    "src/f32-vbinary/gen/vdivc-sse-x4.c"
    "src/f32-vbinary/gen/vdivc-sse-x8.c"
    "src/f32-vbinary/gen/vmax-sse-x4.c"
    "src/f32-vbinary/gen/vmax-sse-x8.c"
    "src/f32-vbinary/gen/vmaxc-sse-x4.c"
    "src/f32-vbinary/gen/vmaxc-sse-x8.c"
    "src/f32-vbinary/gen/vmin-sse-x4.c"
    "src/f32-vbinary/gen/vmin-sse-x8.c"
    "src/f32-vbinary/gen/vminc-sse-x4.c"
    "src/f32-vbinary/gen/vminc-sse-x8.c"
    "src/f32-vbinary/gen/vmul-sse-x4.c"
    "src/f32-vbinary/gen/vmul-sse-x8.c"
    "src/f32-vbinary/gen/vmulc-sse-x4.c"
    "src/f32-vbinary/gen/vmulc-sse-x8.c"
    "src/f32-vbinary/gen/vrdivc-sse-x4.c"
    "src/f32-vbinary/gen/vrdivc-sse-x8.c"
    "src/f32-vbinary/gen/vrsubc-sse-x4.c"
    "src/f32-vbinary/gen/vrsubc-sse-x8.c"
    "src/f32-vbinary/gen/vsub-sse-x4.c"
    "src/f32-vbinary/gen/vsub-sse-x8.c"
    "src/f32-vbinary/gen/vsubc-sse-x4.c"
    "src/f32-vbinary/gen/vsubc-sse-x8.c"
    "src/f32-vmulcaddc/gen/c4-sse-2x.c"
    "src/f32-vmulcaddc/gen/c8-sse-2x.c"
    "src/x32-packx/x4-sse.c"
];

SSE2_UKERNELS = [
    "src/f32-argmaxpool/9p8x-sse2-c4.c"
    "src/f32-argmaxpool/4x-sse2-c4.c"
    "src/f32-argmaxpool/9x-sse2-c4.c"
    "src/f32-prelu/gen/sse2-2x4.c"
    "src/f32-prelu/gen/sse2-2x8.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x4.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x8.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x8-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x12.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x12-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x12-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x16.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x16-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x16-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x20.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x20-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/sse2-p5-x20-acc5.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x4.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x8.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x12.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x16.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x20.c"
    "src/f32-sigmoid/gen/sse2-p5-div-x24.c"
    "src/q8-avgpool/mp9p8q-sse2.c"
    "src/q8-avgpool/up9-sse2.c"
    "src/q8-igemm/4x4c2-sse2.c"
    "src/q8-dwconv/up8x9-sse2.c"
    "src/q8-gavgpool/mp7p7q-sse2.c"
    "src/q8-gavgpool/up7-sse2.c"
    "src/q8-gemm/2x4c8-sse2.c"
    "src/q8-gemm/4x4c2-sse2.c"
    "src/q8-vadd/sse2.c"
    "src/u8-clamp/sse2.c"
    "src/u8-maxpool/9p8x-sse2-c16.c"
    "src/u8-rmax/sse2.c"
    "src/x32-pad/x2-sse2.c"
    "src/x32-zip/x2-sse2.c"
    "src/x32-zip/x3-sse2.c"
    "src/x32-zip/x4-sse2.c"
    "src/x32-zip/xm-sse2.c"
    "src/x8-zip/x2-sse2.c"
    "src/x8-zip/x3-sse2.c"
    "src/x8-zip/x4-sse2.c"
    "src/x8-zip/xm-sse2.c"
    "src/math/exp-sse2-p5.c"
    "src/math/expminus-sse2-p5.c"
    "src/math/sigmoid-sse2-p5-div.c"
];

SSE41_UKERNELS = [
    "src/f32-prelu/gen/sse41-2x4.c"
    "src/f32-prelu/gen/sse41-2x8.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x4.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x8.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x12.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x16.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x20.c"
    "src/f32-sigmoid/gen/sse41-p5-div-x24.c"
];

AVX_UKERNELS = [
    "src/f32-clamp/avx.c"
    "src/f32-dwconv/gen/up16x4-avx-acc2.c"
    "src/f32-dwconv/gen/up16x4-avx.c"
    "src/f32-dwconv/gen/up8x4-avx-acc2.c"
    "src/f32-dwconv/gen/up8x4-avx.c"
    "src/f32-dwconv/gen/up16x9-avx-acc2.c"
    "src/f32-dwconv/gen/up16x9-avx.c"
    "src/f32-dwconv/gen/up8x9-avx-acc2.c"
    "src/f32-dwconv/gen/up8x9-avx.c"
    "src/f32-dwconv/gen/up16x25-avx-acc2.c"
    "src/f32-dwconv/gen/up16x25-avx.c"
    "src/f32-dwconv/gen/up8x25-avx-acc2.c"
    "src/f32-dwconv/gen/up8x25-avx.c"
    "src/f32-gemm/gen/1x8-avx-broadcast.c"
    "src/f32-gemm/gen/4x8-avx-broadcast.c"
    "src/f32-gemm/gen/5x8-avx-broadcast.c"
    "src/f32-gemm/gen/6x8-avx-broadcast.c"
    "src/f32-gemm/gen/7x8-avx-broadcast.c"
    "src/f32-gemm/gen/1x16-avx-broadcast.c"
    "src/f32-gemm/gen/3x16-avx-broadcast.c"
    "src/f32-gemm/gen/4x16-avx-broadcast.c"
    "src/f32-gemm/gen/5x16-avx-broadcast.c"
    "src/f32-gemm/gen-inc/1x8-avx-broadcast.c"
    "src/f32-gemm/gen-inc/4x8-avx-broadcast.c"
    "src/f32-gemm/gen-inc/5x8-avx-broadcast.c"
    "src/f32-gemm/gen-inc/6x8-avx-broadcast.c"
    "src/f32-gemm/gen-inc/7x8-avx-broadcast.c"
    "src/f32-gemm/gen-inc/1x16-avx-broadcast.c"
    "src/f32-gemm/gen-inc/3x16-avx-broadcast.c"
    "src/f32-gemm/gen-inc/4x16-avx-broadcast.c"
    "src/f32-gemm/gen-inc/5x16-avx-broadcast.c"
    "src/f32-hswish/gen/avx-x8.c"
    "src/f32-hswish/gen/avx-x16.c"
    "src/f32-igemm/gen/1x8-avx-broadcast.c"
    "src/f32-igemm/gen/4x8-avx-broadcast.c"
    "src/f32-igemm/gen/5x8-avx-broadcast.c"
    "src/f32-igemm/gen/6x8-avx-broadcast.c"
    "src/f32-igemm/gen/7x8-avx-broadcast.c"
    "src/f32-igemm/gen/1x16-avx-broadcast.c"
    "src/f32-igemm/gen/3x16-avx-broadcast.c"
    "src/f32-igemm/gen/4x16-avx-broadcast.c"
    "src/f32-igemm/gen/5x16-avx-broadcast.c"
    "src/f32-rmax/avx.c"
    "src/f32-vbinary/gen/vadd-avx-x8.c"
    "src/f32-vbinary/gen/vadd-avx-x16.c"
    "src/f32-vbinary/gen/vaddc-avx-x8.c"
    "src/f32-vbinary/gen/vaddc-avx-x16.c"
    "src/f32-vbinary/gen/vdiv-avx-x8.c"
    "src/f32-vbinary/gen/vdiv-avx-x16.c"
    "src/f32-vbinary/gen/vdivc-avx-x8.c"
    "src/f32-vbinary/gen/vdivc-avx-x16.c"
    "src/f32-vbinary/gen/vmax-avx-x8.c"
    "src/f32-vbinary/gen/vmax-avx-x16.c"
    "src/f32-vbinary/gen/vmaxc-avx-x8.c"
    "src/f32-vbinary/gen/vmaxc-avx-x16.c"
    "src/f32-vbinary/gen/vmin-avx-x8.c"
    "src/f32-vbinary/gen/vmin-avx-x16.c"
    "src/f32-vbinary/gen/vminc-avx-x8.c"
    "src/f32-vbinary/gen/vminc-avx-x16.c"
    "src/f32-vbinary/gen/vmul-avx-x8.c"
    "src/f32-vbinary/gen/vmul-avx-x16.c"
    "src/f32-vbinary/gen/vmulc-avx-x8.c"
    "src/f32-vbinary/gen/vmulc-avx-x16.c"
    "src/f32-vbinary/gen/vrdivc-avx-x8.c"
    "src/f32-vbinary/gen/vrdivc-avx-x16.c"
    "src/f32-vbinary/gen/vrsubc-avx-x8.c"
    "src/f32-vbinary/gen/vrsubc-avx-x16.c"
    "src/f32-vbinary/gen/vsub-avx-x8.c"
    "src/f32-vbinary/gen/vsub-avx-x16.c"
    "src/f32-vbinary/gen/vsubc-avx-x8.c"
    "src/f32-vbinary/gen/vsubc-avx-x16.c"
    "src/f32-vscale/avx-unroll32.c"
];

FMA3_UKERNELS = [
    "src/f32-dwconv/gen/up16x4-fma3-acc2.c"
    "src/f32-dwconv/gen/up16x4-fma3.c"
    "src/f32-dwconv/gen/up8x4-fma3-acc2.c"
    "src/f32-dwconv/gen/up8x4-fma3.c"
    "src/f32-dwconv/gen/up16x9-fma3-acc2.c"
    "src/f32-dwconv/gen/up16x9-fma3.c"
    "src/f32-dwconv/gen/up8x9-fma3-acc2.c"
    "src/f32-dwconv/gen/up8x9-fma3.c"
    "src/f32-dwconv/gen/up16x25-fma3-acc2.c"
    "src/f32-dwconv/gen/up16x25-fma3.c"
    "src/f32-dwconv/gen/up8x25-fma3-acc2.c"
    "src/f32-dwconv/gen/up8x25-fma3.c"
    "src/f32-gemm/gen/1x8-fma3-broadcast.c"
    "src/f32-gemm/gen/4x8-fma3-broadcast.c"
    "src/f32-gemm/gen/5x8-fma3-broadcast.c"
    "src/f32-gemm/gen/6x8-fma3-broadcast.c"
    "src/f32-gemm/gen/7x8-fma3-broadcast.c"
    "src/f32-gemm/gen/8x8-fma3-broadcast.c"
    "src/f32-gemm/gen/1x16-fma3-broadcast.c"
    "src/f32-gemm/gen/3x16-fma3-broadcast.c"
    "src/f32-gemm/gen/4x16-fma3-broadcast.c"
    "src/f32-gemm/gen/5x16-fma3-broadcast.c"
    "src/f32-gemm/gen/1x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen/3x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen/4x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen/5x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/1x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/4x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/5x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/6x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/7x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/8x8-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/1x16-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/3x16-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/4x16-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/5x16-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/1x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/3x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/4x16s4-fma3-broadcast.c"
    "src/f32-gemm/gen-inc/5x16s4-fma3-broadcast.c"
    "src/f32-hswish/gen/fma3-x8.c"
    "src/f32-hswish/gen/fma3-x16.c"
    "src/f32-igemm/gen/1x8-fma3-broadcast.c"
    "src/f32-igemm/gen/4x8-fma3-broadcast.c"
    "src/f32-igemm/gen/5x8-fma3-broadcast.c"
    "src/f32-igemm/gen/6x8-fma3-broadcast.c"
    "src/f32-igemm/gen/7x8-fma3-broadcast.c"
    "src/f32-igemm/gen/8x8-fma3-broadcast.c"
    "src/f32-igemm/gen/1x16-fma3-broadcast.c"
    "src/f32-igemm/gen/3x16-fma3-broadcast.c"
    "src/f32-igemm/gen/4x16-fma3-broadcast.c"
    "src/f32-igemm/gen/5x16-fma3-broadcast.c"
    "src/f32-igemm/gen/1x16s4-fma3-broadcast.c"
    "src/f32-igemm/gen/3x16s4-fma3-broadcast.c"
    "src/f32-igemm/gen/4x16s4-fma3-broadcast.c"
    "src/f32-igemm/gen/5x16s4-fma3-broadcast.c"
];

AVX2_UKERNELS = [
    "src/f32-raddexpminusmax/gen/avx2-p5-x64.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x64-acc2.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x64-acc4.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x72.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x72-acc3.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x80.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x80-acc2.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x80-acc5.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x96.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x96-acc2.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x96-acc3.c"
    "src/f32-raddexpminusmax/gen/avx2-p5-x96-acc6.c"
    "src/f32-raddextexp/gen/avx2-p5-x64.c"
    "src/f32-raddextexp/gen/avx2-p5-x64-acc2.c"
    "src/f32-raddextexp/gen/avx2-p5-x64-acc4.c"
    "src/f32-raddextexp/gen/avx2-p5-x72.c"
    "src/f32-raddextexp/gen/avx2-p5-x72-acc3.c"
    "src/f32-raddextexp/gen/avx2-p5-x80.c"
    "src/f32-raddextexp/gen/avx2-p5-x80-acc2.c"
    "src/f32-raddextexp/gen/avx2-p5-x80-acc5.c"
    "src/f32-raddextexp/gen/avx2-p5-x96.c"
    "src/f32-raddextexp/gen/avx2-p5-x96-acc2.c"
    "src/f32-raddextexp/gen/avx2-p5-x96-acc3.c"
    "src/f32-raddextexp/gen/avx2-p5-x96-acc6.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x64.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x64-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x64-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x72.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x72-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x80.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x80-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x80-acc5.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x96.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x96-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x96-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/avx2-p5-x96-acc6.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x8.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x16.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x24.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x32.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x40.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x48.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x56.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x64.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x72.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-div-x80.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x8.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x16.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x24.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x32.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x40.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x48.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x56.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x64.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x72.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr1fma-x80.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x8.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x16.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x24.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x32.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x40.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x48.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x56.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x64.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x72.c"
    "src/f32-sigmoid/gen/avx2-rr1-p5-nr2fma-x80.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x8.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x16.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x24.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x32.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x40.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x48.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x56.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x64.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x72.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x80.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x88.c"
    "src/f32-vscaleexpminusmax/gen/avx2-p5-x96.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x8.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x16.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x24.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x32.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x40.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x48.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x56.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x64.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x72.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x80.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x88.c"
    "src/f32-vscaleextexp/gen/avx2-p5-x96.c"
    "src/math/exp-avx2-p5.c"
    "src/math/exp-avx2-perm-p3.c"
    "src/math/exp-avx2-perm-p4.c"
    "src/math/expminus-avx2-p5.c"
    "src/math/extexp-avx2-p5.c"
    "src/math/sigmoid-avx2-rr2-p5-div.c"
    "src/math/sigmoid-avx2-rr1-p5-div.c"
    "src/math/sigmoid-avx2-rr2-p5-nr2fma.c"
    "src/math/sigmoid-avx2-rr1-p5-nr2fma.c"
    "src/math/sigmoid-avx2-rr2-p5-nr1fma.c"
    "src/math/sigmoid-avx2-rr1-p5-nr1fma.c"
];

AVX512F_UKERNELS = [
    "src/f32-clamp/avx512f.c"
    "src/f32-dwconv/gen/up32x4-avx512f-acc2.c"
    "src/f32-dwconv/gen/up32x4-avx512f.c"
    "src/f32-dwconv/gen/up16x4-avx512f-acc2.c"
    "src/f32-dwconv/gen/up16x4-avx512f.c"
    "src/f32-dwconv/gen/up32x9-avx512f-acc2.c"
    "src/f32-dwconv/gen/up32x9-avx512f.c"
    "src/f32-dwconv/gen/up16x9-avx512f-acc2.c"
    "src/f32-dwconv/gen/up16x9-avx512f.c"
    "src/f32-dwconv/gen/up32x25-avx512f-acc2.c"
    "src/f32-dwconv/gen/up32x25-avx512f.c"
    "src/f32-dwconv/gen/up16x25-avx512f-acc2.c"
    "src/f32-dwconv/gen/up16x25-avx512f.c"
    "src/f32-gemm/gen/1x16-avx512f-broadcast.c"
    "src/f32-gemm/gen/4x16-avx512f-broadcast.c"
    "src/f32-gemm/gen/5x16-avx512f-broadcast.c"
    "src/f32-gemm/gen/6x16-avx512f-broadcast.c"
    "src/f32-gemm/gen/7x16-avx512f-broadcast.c"
    "src/f32-gemm/gen/8x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/1x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/4x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/5x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/6x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/7x16-avx512f-broadcast.c"
    "src/f32-gemm/gen-inc/8x16-avx512f-broadcast.c"
    "src/f32-hswish/gen/avx512f-x16.c"
    "src/f32-hswish/gen/avx512f-x32.c"
    "src/f32-igemm/gen/1x16-avx512f-broadcast.c"
    "src/f32-igemm/gen/4x16-avx512f-broadcast.c"
    "src/f32-igemm/gen/5x16-avx512f-broadcast.c"
    "src/f32-igemm/gen/6x16-avx512f-broadcast.c"
    "src/f32-igemm/gen/7x16-avx512f-broadcast.c"
    "src/f32-igemm/gen/8x16-avx512f-broadcast.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x128.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x128-acc2.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x128-acc4.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x144.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x144-acc3.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x160.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x160-acc2.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x160-acc5.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x192.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x192-acc2.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x192-acc3.c"
    "src/f32-raddexpminusmax/gen/avx512f-p5-scalef-x192-acc6.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x128.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x128-acc2.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x128-acc4.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x144.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x144-acc3.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x160.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x160-acc2.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x160-acc5.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x192.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x192-acc2.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x192-acc3.c"
    "src/f32-raddextexp/gen/avx512f-p5-scalef-x192-acc6.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x128.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x128-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x128-acc4.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x144.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x144-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x160.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x160-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x160-acc5.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x192.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x192-acc2.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x192-acc3.c"
    "src/f32-raddstoreexpminusmax/gen/avx512f-p5-scalef-x192-acc6.c"
    "src/f32-rmax/avx512f.c"
    "src/f32-vbinary/gen/vadd-avx512f-x16.c"
    "src/f32-vbinary/gen/vadd-avx512f-x32.c"
    "src/f32-vbinary/gen/vaddc-avx512f-x16.c"
    "src/f32-vbinary/gen/vaddc-avx512f-x32.c"
    "src/f32-vbinary/gen/vdiv-avx512f-x16.c"
    "src/f32-vbinary/gen/vdiv-avx512f-x32.c"
    "src/f32-vbinary/gen/vdivc-avx512f-x16.c"
    "src/f32-vbinary/gen/vdivc-avx512f-x32.c"
    "src/f32-vbinary/gen/vmax-avx512f-x16.c"
    "src/f32-vbinary/gen/vmax-avx512f-x32.c"
    "src/f32-vbinary/gen/vmaxc-avx512f-x16.c"
    "src/f32-vbinary/gen/vmaxc-avx512f-x32.c"
    "src/f32-vbinary/gen/vmin-avx512f-x16.c"
    "src/f32-vbinary/gen/vmin-avx512f-x32.c"
    "src/f32-vbinary/gen/vminc-avx512f-x16.c"
    "src/f32-vbinary/gen/vminc-avx512f-x32.c"
    "src/f32-vbinary/gen/vmul-avx512f-x16.c"
    "src/f32-vbinary/gen/vmul-avx512f-x32.c"
    "src/f32-vbinary/gen/vmulc-avx512f-x16.c"
    "src/f32-vbinary/gen/vmulc-avx512f-x32.c"
    "src/f32-vbinary/gen/vrdivc-avx512f-x16.c"
    "src/f32-vbinary/gen/vrdivc-avx512f-x32.c"
    "src/f32-vbinary/gen/vrsubc-avx512f-x16.c"
    "src/f32-vbinary/gen/vrsubc-avx512f-x32.c"
    "src/f32-vbinary/gen/vsub-avx512f-x16.c"
    "src/f32-vbinary/gen/vsub-avx512f-x32.c"
    "src/f32-vbinary/gen/vsubc-avx512f-x16.c"
    "src/f32-vbinary/gen/vsubc-avx512f-x32.c"
    "src/f32-vscale/avx512f-unroll64.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x16.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x32.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x48.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x64.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x80.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x96.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x112.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x128.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x144.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x160.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x176.c"
    "src/f32-vscaleexpminusmax/gen/avx512f-p5-scalef-x192.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x16.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x32.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x48.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x64.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x80.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x96.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x112.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x128.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x144.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x160.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x176.c"
    "src/f32-vscaleextexp/gen/avx512f-p5-scalef-x192.c"
    "src/math/exp-avx512f-p5-scalef.c"
    "src/math/exp-avx512f-p5.c"
    "src/math/exp-avx512f-perm-p3.c"
    "src/math/exp-avx512f-perm2-p2.c"
    "src/math/extexp-avx512f-p5.c"
];

AARCH32_ASM_UKERNELS = [
    "src/q8-dwconv/up8x9-aarch32-neon.S"
    "src/f32-gemm/4x8-aarch32-neon-cortex-a53.S"
    "src/f32-gemm/gen/4x8-aarch32-neon-cortex-a75.S"
    "src/f32-gemm/gen/4x8-aarch32-neon-pld-cortex-a75.S"
    "src/f32-gemm/4x8-aarch32-neon-ld64.S"
    "src/f32-igemm/4x8-aarch32-neon-ld64.S"
    "src/f32-igemm/gen/4x8-aarch32-neon-cortex-a75.S"
    "src/f32-igemm/gen/4x8-aarch32-neon-pld-cortex-a75.S"
];

AARCH64_ASM_UKERNELS = [
    "src/f32-dwconv/up4x9-aarch64-neonfma-cortex-a55.S"
    "src/f32-dwconv/up4x9-aarch64-neonfma.S"
    "src/f32-gemm/gen/1x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen/1x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen/1x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen/1x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen/4x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen/4x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen/4x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen/4x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen/4x8-aarch64-neonfma-ld128.S"
    "src/f32-gemm/gen/4x8-aarch64-neonfma-ld64.S"
    "src/f32-gemm/gen/5x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen/5x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-cortex-a73.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-ld128.S"
    "src/f32-gemm/gen/6x8-aarch64-neonfma-ld64.S"
    "src/f32-gemm/gen-inc/1x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen-inc/1x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen-inc/1x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen-inc/1x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen-inc/4x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen-inc/4x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen-inc/4x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen-inc/4x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen-inc/4x8-aarch64-neonfma-ld128.S"
    "src/f32-gemm/gen-inc/4x8-aarch64-neonfma-ld64.S"
    "src/f32-gemm/gen-inc/5x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen-inc/5x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-cortex-a73.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-ld128.S"
    "src/f32-gemm/gen-inc/6x8-aarch64-neonfma-ld64.S"
    "src/f32-igemm/1x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-igemm/1x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-igemm/gen/1x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-igemm/gen/1x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-igemm/4x12-aarch64-neonfma-cortex-a53.S"
    "src/f32-igemm/4x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-igemm/gen/4x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-igemm/gen/4x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-igemm/gen/5x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-igemm/gen/5x8-aarch64-neonfma-cortex-a75.S"
    "src/f32-igemm/6x8-aarch64-neonfma-cortex-a53.S"
    "src/f32-igemm/6x8-aarch64-neonfma-cortex-a73.S"
    "src/f32-igemm/gen/6x8-aarch64-neonfma-cortex-a57.S"
    "src/f32-igemm/gen/6x8-aarch64-neonfma-cortex-a75.S"
];

xnnpack_internal_default = cc_defaults {
    name = "xnnpack_internal_default";
    vendor_available = true;
    sdk_version = "current";
    local_include_dirs = [
        "include"
        "src"
    ];
    cflags = [
        "-std=c99"
        "-DXNN_LOG_LEVEL=2"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-Wno-pointer-arith"
    ];
    stl = "libc++_static";
};

xnnpack_tables = cc_library_static {
    name = "xnnpack_tables";
    defaults = ["xnnpack_internal_default"];
    srcs = TABLE_SRCS;
};

xnnpack_im2col = cc_library_static {
    name = "xnnpack_im2col";
    defaults = ["xnnpack_internal_default"];
    srcs = [
        "src/im2col.c"
    ];
};

xnnpack_indirection = cc_library_static {
    name = "xnnpack_indirection";
    defaults = ["xnnpack_internal_default"];
    srcs = [
        "src/indirection.c"
    ];
    header_libs = [
        "fp16_headers"
        "fxdiv_headers"
    ];
    static_libs = [
        "libpthreadpool"
    ];
};

xnnpack_operator_run = cc_library_static {
    name = "xnnpack_operator_run";
    defaults = ["xnnpack_internal_default"];
    srcs = [
        "src/operator-run.c"
    ];
    cflags = [
        "-Wno-vla"
    ];
    header_libs = [
        "fp16_headers"
        "fxdiv_headers"
    ];
    static_libs = [
        "libclog"
        "libpthreadpool"
    ];
};

xnnpack_operators = cc_library_static {
    name = "xnnpack_operators";
    defaults = ["xnnpack_internal_default"];
    srcs = OPERATOR_SRCS ++ [
        "src/memory.c"
        "src/operator-delete.c"
    ];
    header_libs = [
        "fp16_headers"
        "fxdiv_headers"
    ];
    static_libs = [
        "libclog"
        "libpthreadpool"
    ];
    whole_static_libs = [
        "xnnpack_indirection"
    ];
};

xnnpack_scalar_ukernels = cc_library_static {
    name = "xnnpack_scalar_ukernels";
    defaults = ["xnnpack_internal_default"];
    srcs = SCALAR_UKERNELS;
    header_libs = [
        "fp16_headers"
        "fxdiv_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_psimd_fastmath_ukernels = cc_library_static {
    name = "xnnpack_psimd_fastmath_ukernels";
    defaults = ["xnnpack_internal_default"];
    srcs = PSIMD_FASTMATH_UKERNELS;
    cflags = [
        "-O3"
        "-ffast-math"
    ];
    arch = {
        arm = {
            cflags = [
                "-marm"
                "-mfpu=neon"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
        "psimd_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_psimd_accmath_ukernels = cc_library_static {
    name = "xnnpack_psimd_accmath_ukernels";
    defaults = ["xnnpack_internal_default"];
    srcs = PSIMD_ACCMATH_UKERNELS;
    cflags = [
        "-O3"
    ];
    arch = {
        arm = {
            cflags = [
                "-marm"
                "-mfpu=neon"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
        "psimd_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_neon_ukernels = cc_library_static {
    name = "xnnpack_neon_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            srcs = NEON_UKERNELS;
            cflags = [
                "-marm"
                "-mfpu=neon"
            ];
        };
        arm64 = {
            srcs = NEON_UKERNELS;
        };
        x86 = {
            enabled = false;
        };
        x86_64 = {
            enabled = false;
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_neonfma_ukernels = cc_library_static {
    name = "xnnpack_neonfma_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            srcs = NEONFMA_UKERNELS;
            cflags = [
                "-marm"
                "-mfpu=neon-vfpv4"
            ];
        };
        arm64 = {
            srcs = NEONFMA_UKERNELS ++ AARCH64_NEONFMA_UKERNELS;
        };
        x86 = {
            enabled = false;
        };
        x86_64 = {
            enabled = false;
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_neonfp16arith_ukernels = cc_library_static {
    name = "xnnpack_neonfp16arith_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            srcs = AARCH64_NEONFP16ARITH_UKERNELS;
            cflags = [
                "-march=armv8.2-a+fp16"
            ];
        };
        x86 = {
            enabled = false;
        };
        x86_64 = {
            enabled = false;
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_asm_ukernels = cc_library_static {
    name = "xnnpack_asm_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            srcs = AARCH32_ASM_UKERNELS;
        };
        arm64 = {
            srcs = AARCH64_ASM_UKERNELS;
        };
        x86 = {
            enabled = false;
        };
        x86_64 = {
            enabled = false;
        };
    };
};

xnnpack_sse2_ukernels = cc_library_static {
    name = "xnnpack_sse2_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = SSE_UKERNELS ++ SSE2_UKERNELS;
            cflags = [
                "-msse2"
            ];
        };
        x86_64 = {
            srcs = SSE_UKERNELS ++ SSE2_UKERNELS;
            cflags = [
                "-msse2"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_sse41_ukernels = cc_library_static {
    name = "xnnpack_sse41_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = SSE41_UKERNELS;
            cflags = [
                "-msse4.1"
            ];
        };
        x86_64 = {
            srcs = SSE41_UKERNELS;
            cflags = [
                "-msse4.1"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_avx_ukernels = cc_library_static {
    name = "xnnpack_avx_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = AVX_UKERNELS;
            cflags = [
                "-mavx"
            ];
        };
        x86_64 = {
            srcs = AVX_UKERNELS;
            cflags = [
                "-mavx"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_fma3_ukernels = cc_library_static {
    name = "xnnpack_fma3_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = FMA3_UKERNELS;
            cflags = [
                "-mfma"
            ];
        };
        x86_64 = {
            srcs = FMA3_UKERNELS;
            cflags = [
                "-mfma"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_avx2_ukernels = cc_library_static {
    name = "xnnpack_avx2_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = AVX2_UKERNELS;
            cflags = [
                "-mfma"
                "-mavx2"
            ];
        };
        x86_64 = {
            srcs = AVX2_UKERNELS;
            cflags = [
                "-mfma"
                "-mavx2"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_avx512f_ukernels = cc_library_static {
    name = "xnnpack_avx512f_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            enabled = false;
        };
        arm64 = {
            enabled = false;
        };
        x86 = {
            srcs = AVX512F_UKERNELS;
            cflags = [
                "-mavx512f"
            ];
        };
        x86_64 = {
            srcs = AVX512F_UKERNELS;
            cflags = [
                "-mavx512f"
            ];
        };
    };
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libpthreadpool"
        "xnnpack_tables"
    ];
};

xnnpack_ukernels = cc_library_static {
    name = "xnnpack_ukernels";
    defaults = ["xnnpack_internal_default"];
    arch = {
        arm = {
            whole_static_libs = [
                "xnnpack_psimd_fastmath_ukernels"
                "xnnpack_psimd_accmath_ukernels"
                "xnnpack_neon_ukernels"
                "xnnpack_neonfma_ukernels"
                "xnnpack_asm_ukernels"
            ];
        };
        arm64 = {
            whole_static_libs = [
                "xnnpack_psimd_fastmath_ukernels"
                "xnnpack_psimd_accmath_ukernels"
                "xnnpack_neon_ukernels"
                "xnnpack_neonfma_ukernels"
                "xnnpack_neonfp16arith_ukernels"
                "xnnpack_asm_ukernels"
            ];
        };
        x86 = {
            whole_static_libs = [
                "xnnpack_psimd_fastmath_ukernels"
                "xnnpack_psimd_accmath_ukernels"
                "xnnpack_sse2_ukernels"
                "xnnpack_sse41_ukernels"
                "xnnpack_avx_ukernels"
                "xnnpack_fma3_ukernels"
                "xnnpack_avx2_ukernels"
                "xnnpack_avx512f_ukernels"
            ];
        };
        x86_64 = {
            whole_static_libs = [
                "xnnpack_psimd_fastmath_ukernels"
                "xnnpack_psimd_accmath_ukernels"
                "xnnpack_sse2_ukernels"
                "xnnpack_sse41_ukernels"
                "xnnpack_avx_ukernels"
                "xnnpack_fma3_ukernels"
                "xnnpack_avx2_ukernels"
                "xnnpack_avx512f_ukernels"
            ];
        };
    };
    whole_static_libs = [
        "xnnpack_scalar_ukernels"
        "xnnpack_tables"
    ];
};

libXNNPACK = cc_library_static {
    name = "libXNNPACK";
    defaults = ["xnnpack_internal_default"];
    export_include_dirs = ["include"];
    srcs = [
        "src/init.c"
        "src/runtime.c"
        "src/subgraph.c"
        "src/tensor.c"
    ];
    whole_static_libs = [
        "libclog"
        "libcpuinfo"
        "libpthreadpool"
        "xnnpack_ukernels"
        "xnnpack_operator_run"
        "xnnpack_operators"
    ];
};

#  Tests and benchmarks
xnnpack_tests_default = cc_defaults {
    name = "xnnpack_tests_default";
    vendor_available = true;
    stl = "libc++_static";
    local_include_dirs = [
        "bench"
        "models"
        "test"
        "src"
    ];
    cflags = [
        "-Wno-unused-function"
    ];
    header_libs = [
        "fp16_headers"
    ];
    static_libs = [
        "libXNNPACK"
        "libpthreadpool"
        "libgmock"
    ];
    shared_libs = [
        "liblog"
    ];
};

xnnpack_mobilenet_v1 = cc_library_static {
    name = "xnnpack_mobilenet_v1";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "models/mobilenet-v1.cc"
    ];
};

xnnpack_mobilenet_v2 = cc_library_static {
    name = "xnnpack_mobilenet_v2";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "models/mobilenet-v2.cc"
    ];
};

xnnpack_mobilenet_v3_large = cc_library_static {
    name = "xnnpack_mobilenet_v3_large";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "models/mobilenet-v3-large.cc"
    ];
};

xnnpack_mobilenet_v3_small = cc_library_static {
    name = "xnnpack_mobilenet_v3_small";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "models/mobilenet-v3-small.cc"
    ];
};

xnnpack_end2end_bench = cc_benchmark {
    name = "xnnpack_end2end_bench";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "bench/end2end.cc"
        "bench/utils.cc"
    ];
    cflags = [
        "-Wno-unused-result"
    ];
    static_libs = [
        "libcpuinfo"
        "libgoogle-benchmark"
        "xnnpack_mobilenet_v1"
        "xnnpack_mobilenet_v2"
        "xnnpack_mobilenet_v3_large"
        "xnnpack_mobilenet_v3_small"
    ];
};

xnnpack_add_nc_test = cc_test {
    name = "xnnpack_add_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/add-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_add_nd_test = cc_test {
    name = "xnnpack_add_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/add-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_argmax_pooling_nhwc_test = cc_test {
    name = "xnnpack_argmax_pooling_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/argmax-pooling-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_average_pooling_nhwc_test = cc_test {
    name = "xnnpack_average_pooling_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/average-pooling-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_channel_pad_nc_test = cc_test {
    name = "xnnpack_channel_pad_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/channel-pad-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_channel_shuffle_nc_test = cc_test {
    name = "xnnpack_channel_shuffle_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/channel-shuffle-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_clamp_nc_test = cc_test {
    name = "xnnpack_clamp_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/clamp-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_convolution_nhwc_test = cc_test {
    name = "xnnpack_convolution_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/convolution-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_convolution_nchw_test = cc_test {
    name = "xnnpack_convolution_nchw_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/convolution-nchw.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_deconvolution_nhwc_test = cc_test {
    name = "xnnpack_deconvolution_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/deconvolution-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_divide_nd_test = cc_test {
    name = "xnnpack_divide_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/divide-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_fully_connected_nc_test = cc_test {
    name = "xnnpack_fully_connected_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/fully-connected-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_global_average_pooling_nwc_test = cc_test {
    name = "xnnpack_global_average_pooling_nwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/global-average-pooling-nwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_global_average_pooling_ncw_test = cc_test {
    name = "xnnpack_global_average_pooling_ncw_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/global-average-pooling-ncw.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_hardswish_nc_test = cc_test {
    name = "xnnpack_hardswish_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/hardswish-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_leaky_relu_nc_test = cc_test {
    name = "xnnpack_leaky_relu_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/leaky-relu-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_max_pooling_nhwc_test = cc_test {
    name = "xnnpack_max_pooling_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/max-pooling-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_maximum_nd_test = cc_test {
    name = "xnnpack_maximum_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/maximum-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_minimum_nd_test = cc_test {
    name = "xnnpack_minimum_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/minimum-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_multiply_nd_test = cc_test {
    name = "xnnpack_multiply_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/multiply-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_prelu_nc_test = cc_test {
    name = "xnnpack_prelu_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/prelu-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_resize_bilinear_nhwc_test = cc_test {
    name = "xnnpack_resize_bilinear_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/resize-bilinear-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_sigmoid_nc_test = cc_test {
    name = "xnnpack_sigmoid_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/sigmoid-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_softmax_nc_test = cc_test {
    name = "xnnpack_softmax_nc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/softmax-nc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_subtract_nd_test = cc_test {
    name = "xnnpack_subtract_nd_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/subtract-nd.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

xnnpack_unpooling_nhwc_test = cc_test {
    name = "xnnpack_unpooling_nhwc_test";
    defaults = ["xnnpack_tests_default"];
    srcs = [
        "test/unpooling-nhwc.cc"
    ];
    test_suites = [
        "general-tests"
    ];
};

in { inherit libXNNPACK xnnpack_add_nc_test xnnpack_add_nd_test xnnpack_argmax_pooling_nhwc_test xnnpack_asm_ukernels xnnpack_average_pooling_nhwc_test xnnpack_avx2_ukernels xnnpack_avx512f_ukernels xnnpack_avx_ukernels xnnpack_channel_pad_nc_test xnnpack_channel_shuffle_nc_test xnnpack_clamp_nc_test xnnpack_convolution_nchw_test xnnpack_convolution_nhwc_test xnnpack_deconvolution_nhwc_test xnnpack_divide_nd_test xnnpack_end2end_bench xnnpack_fma3_ukernels xnnpack_fully_connected_nc_test xnnpack_global_average_pooling_ncw_test xnnpack_global_average_pooling_nwc_test xnnpack_hardswish_nc_test xnnpack_im2col xnnpack_indirection xnnpack_internal_default xnnpack_leaky_relu_nc_test xnnpack_max_pooling_nhwc_test xnnpack_maximum_nd_test xnnpack_minimum_nd_test xnnpack_mobilenet_v1 xnnpack_mobilenet_v2 xnnpack_mobilenet_v3_large xnnpack_mobilenet_v3_small xnnpack_multiply_nd_test xnnpack_neon_ukernels xnnpack_neonfma_ukernels xnnpack_neonfp16arith_ukernels xnnpack_operator_run xnnpack_operators xnnpack_prelu_nc_test xnnpack_psimd_accmath_ukernels xnnpack_psimd_fastmath_ukernels xnnpack_resize_bilinear_nhwc_test xnnpack_scalar_ukernels xnnpack_sigmoid_nc_test xnnpack_softmax_nc_test xnnpack_sse2_ukernels xnnpack_sse41_ukernels xnnpack_subtract_nd_test xnnpack_tables xnnpack_tests_default xnnpack_ukernels xnnpack_unpooling_nhwc_test; }
