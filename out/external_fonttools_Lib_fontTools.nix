{ python_defaults, python_library_host }:
let

#  Copyright 2017 Google Inc. All rights reserved.
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
fonttools_default = python_defaults {
    name = "fonttools_default";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

fontTools = python_library_host {
    name = "fontTools";
    defaults = ["fonttools_default"];
    pkg_path = "fontTools";
    srcs = [
        "__init__.py"
        "__main__.py"
        "afmLib.py"
        "agl.py"
        "fontBuilder.py"
        "merge.py"
        "ttx.py"
        "unicode.py"
        "cffLib/__init__.py"
        "cffLib/specializer.py"
        "cffLib/width.py"
        "designspaceLib/__init__.py"
        "encodings/MacRoman.py"
        "encodings/StandardEncoding.py"
        "encodings/__init__.py"
        "encodings/codecs.py"
        "feaLib/__init__.py"
        "feaLib/__main__.py"
        "feaLib/ast.py"
        "feaLib/builder.py"
        "feaLib/error.py"
        "feaLib/lexer.py"
        "feaLib/parser.py"
        "misc/__init__.py"
        "misc/arrayTools.py"
        "misc/bezierTools.py"
        "misc/classifyTools.py"
        "misc/cliTools.py"
        "misc/dictTools.py"
        "misc/eexec.py"
        "misc/encodingTools.py"
        "misc/etree.py"
        "misc/filenames.py"
        "misc/fixedTools.py"
        "misc/intTools.py"
        "misc/loggingTools.py"
        "misc/macCreatorType.py"
        "misc/macRes.py"
        "misc/plistlib.py"
        "misc/psCharStrings.py"
        "misc/psLib.py"
        "misc/psOperators.py"
        "misc/py23.py"
        "misc/sstruct.py"
        "misc/symfont.py"
        "misc/testTools.py"
        "misc/textTools.py"
        "misc/timeTools.py"
        "misc/transform.py"
        "misc/xmlReader.py"
        "misc/xmlWriter.py"
        "mtiLib/__init__.py"
        "mtiLib/__main__.py"
        "otlLib/__init__.py"
        "otlLib/builder.py"
        "pens/__init__.py"
        "pens/areaPen.py"
        "pens/basePen.py"
        "pens/boundsPen.py"
        "pens/cocoaPen.py"
        "pens/filterPen.py"
        "pens/momentsPen.py"
        "pens/perimeterPen.py"
        "pens/pointInsidePen.py"
        "pens/pointPen.py"
        "pens/qtPen.py"
        "pens/recordingPen.py"
        "pens/reportLabPen.py"
        "pens/reverseContourPen.py"
        "pens/statisticsPen.py"
        "pens/svgPathPen.py"
        "pens/t2CharStringPen.py"
        "pens/teePen.py"
        "pens/transformPen.py"
        "pens/ttGlyphPen.py"
        "pens/wxPen.py"
        "subset/__init__.py"
        "subset/__main__.py"
        "subset/cff.py"
        "svgLib/__init__.py"
        "svgLib/path/__init__.py"
        "svgLib/path/arc.py"
        "svgLib/path/parser.py"
        "svgLib/path/shapes.py"
        "t1Lib/__init__.py"
        "ttLib/__init__.py"
        "ttLib/macUtils.py"
        "ttLib/sfnt.py"
        "ttLib/standardGlyphOrder.py"
        "ttLib/ttCollection.py"
        "ttLib/ttFont.py"
        "ttLib/woff2.py"
        "ttLib/tables/B_A_S_E_.py"
        "ttLib/tables/BitmapGlyphMetrics.py"
        "ttLib/tables/C_B_D_T_.py"
        "ttLib/tables/C_B_L_C_.py"
        "ttLib/tables/C_F_F_.py"
        "ttLib/tables/C_F_F__2.py"
        "ttLib/tables/C_O_L_R_.py"
        "ttLib/tables/C_P_A_L_.py"
        "ttLib/tables/D_S_I_G_.py"
        "ttLib/tables/DefaultTable.py"
        "ttLib/tables/E_B_D_T_.py"
        "ttLib/tables/E_B_L_C_.py"
        "ttLib/tables/F_F_T_M_.py"
        "ttLib/tables/F__e_a_t.py"
        "ttLib/tables/G_D_E_F_.py"
        "ttLib/tables/G_M_A_P_.py"
        "ttLib/tables/G_P_K_G_.py"
        "ttLib/tables/G_P_O_S_.py"
        "ttLib/tables/G_S_U_B_.py"
        "ttLib/tables/G__l_a_t.py"
        "ttLib/tables/G__l_o_c.py"
        "ttLib/tables/H_V_A_R_.py"
        "ttLib/tables/J_S_T_F_.py"
        "ttLib/tables/L_T_S_H_.py"
        "ttLib/tables/M_A_T_H_.py"
        "ttLib/tables/M_E_T_A_.py"
        "ttLib/tables/M_V_A_R_.py"
        "ttLib/tables/O_S_2f_2.py"
        "ttLib/tables/S_I_N_G_.py"
        "ttLib/tables/S_T_A_T_.py"
        "ttLib/tables/S_V_G_.py"
        "ttLib/tables/S__i_l_f.py"
        "ttLib/tables/S__i_l_l.py"
        "ttLib/tables/T_S_I_B_.py"
        "ttLib/tables/T_S_I_C_.py"
        "ttLib/tables/T_S_I_D_.py"
        "ttLib/tables/T_S_I_J_.py"
        "ttLib/tables/T_S_I_P_.py"
        "ttLib/tables/T_S_I_S_.py"
        "ttLib/tables/T_S_I_V_.py"
        "ttLib/tables/T_S_I__0.py"
        "ttLib/tables/T_S_I__1.py"
        "ttLib/tables/T_S_I__2.py"
        "ttLib/tables/T_S_I__3.py"
        "ttLib/tables/T_S_I__5.py"
        "ttLib/tables/T_T_F_A_.py"
        "ttLib/tables/TupleVariation.py"
        "ttLib/tables/V_D_M_X_.py"
        "ttLib/tables/V_O_R_G_.py"
        "ttLib/tables/V_V_A_R_.py"
        "ttLib/tables/__init__.py"
        "ttLib/tables/_a_n_k_r.py"
        "ttLib/tables/_a_v_a_r.py"
        "ttLib/tables/_b_s_l_n.py"
        "ttLib/tables/_c_i_d_g.py"
        "ttLib/tables/_c_m_a_p.py"
        "ttLib/tables/_c_v_a_r.py"
        "ttLib/tables/_c_v_t.py"
        "ttLib/tables/_f_e_a_t.py"
        "ttLib/tables/_f_p_g_m.py"
        "ttLib/tables/_f_v_a_r.py"
        "ttLib/tables/_g_a_s_p.py"
        "ttLib/tables/_g_c_i_d.py"
        "ttLib/tables/_g_l_y_f.py"
        "ttLib/tables/_g_v_a_r.py"
        "ttLib/tables/_h_d_m_x.py"
        "ttLib/tables/_h_e_a_d.py"
        "ttLib/tables/_h_h_e_a.py"
        "ttLib/tables/_h_m_t_x.py"
        "ttLib/tables/_k_e_r_n.py"
        "ttLib/tables/_l_c_a_r.py"
        "ttLib/tables/_l_o_c_a.py"
        "ttLib/tables/_l_t_a_g.py"
        "ttLib/tables/_m_a_x_p.py"
        "ttLib/tables/_m_e_t_a.py"
        "ttLib/tables/_m_o_r_t.py"
        "ttLib/tables/_m_o_r_x.py"
        "ttLib/tables/_n_a_m_e.py"
        "ttLib/tables/_o_p_b_d.py"
        "ttLib/tables/_p_o_s_t.py"
        "ttLib/tables/_p_r_e_p.py"
        "ttLib/tables/_p_r_o_p.py"
        "ttLib/tables/_s_b_i_x.py"
        "ttLib/tables/_t_r_a_k.py"
        "ttLib/tables/_v_h_e_a.py"
        "ttLib/tables/_v_m_t_x.py"
        "ttLib/tables/asciiTable.py"
        "ttLib/tables/grUtils.py"
        "ttLib/tables/otBase.py"
        "ttLib/tables/otConverters.py"
        "ttLib/tables/otData.py"
        "ttLib/tables/otTables.py"
        "ttLib/tables/sbixGlyph.py"
        "ttLib/tables/sbixStrike.py"
        "ttLib/tables/ttProgram.py"
        "ufoLib/__init__.py"
        "ufoLib/converters.py"
        "ufoLib/errors.py"
        "ufoLib/etree.py"
        "ufoLib/filenames.py"
        "ufoLib/glifLib.py"
        "ufoLib/kerning.py"
        "ufoLib/plistlib.py"
        "ufoLib/pointPen.py"
        "ufoLib/utils.py"
        "ufoLib/validators.py"
        "unicodedata/Blocks.py"
        "unicodedata/OTTags.py"
        "unicodedata/ScriptExtensions.py"
        "unicodedata/Scripts.py"
        "unicodedata/__init__.py"
        "varLib/__init__.py"
        "varLib/__main__.py"
        "varLib/builder.py"
        "varLib/cff.py"
        "varLib/featureVars.py"
        "varLib/interpolatable.py"
        "varLib/interpolate_layout.py"
        "varLib/iup.py"
        "varLib/merger.py"
        "varLib/models.py"
        "varLib/mutator.py"
        "varLib/mvar.py"
        "varLib/plot.py"
        "varLib/varStore.py"
        "voltLib/__init__.py"
        "voltLib/ast.py"
        "voltLib/error.py"
        "voltLib/lexer.py"
        "voltLib/parser.py"
    ];
};

in { inherit fontTools fonttools_default; }
