{ cc_binary, cc_defaults, cc_library, cc_test }:
let

epid_cflags = cc_defaults {
    name = "epid_cflags";
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-Wno-missing-braces"
        "-Wno-unknown-pragmas"
        "-Wno-typedef-redefinition"
        "-Wno-missing-field-initializers"
        "-Wno-for-loop-analysis"
        "-Wno-unused-const-variable"
        "-Wno-null-pointer-arithmetic"
        "-fexceptions"
        "-fPIC"
        "-O2"
    ];
};

libippcp = cc_library {
    name = "libippcp";
    defaults = ["epid_cflags"];
    srcs = [
        "ext/ipp/sources/ippcp/cpinit.c"
        "ext/ipp/sources/ippcp/gsmod_almmontinv.c"
        "ext/ipp/sources/ippcp/gsmod_almmontinv_ct.c"
        "ext/ipp/sources/ippcp/gsmod_enginegetsize.c"
        "ext/ipp/sources/ippcp/gsmod_engineinit.c"
        "ext/ipp/sources/ippcp/gsmod_getpool.c"
        "ext/ipp/sources/ippcp/gsmod_inv.c"
        "ext/ipp/sources/ippcp/gsmod_montfactor.c"
        "ext/ipp/sources/ippcp/gsmod_montinv.c"
        "ext/ipp/sources/ippcp/gsmod_packctx.c"
        "ext/ipp/sources/ippcp/gsmod_unpackctx.c"
        "ext/ipp/sources/ippcp/gsmodmethod.c"
        "ext/ipp/sources/ippcp/gsmodmethod_dlp.c"
        "ext/ipp/sources/ippcp/gsmodmethod_gfp.c"
        "ext/ipp/sources/ippcp/gsmodmethod_mont.c"
        "ext/ipp/sources/ippcp/gsmodmethod_rsa.c"
        "ext/ipp/sources/ippcp/gsscramble.c"
        "ext/ipp/sources/ippcp/pcpbn_pack.c"
        "ext/ipp/sources/ippcp/pcpbn_unpack.c"
        "ext/ipp/sources/ippcp/pcpbn_val1.c"
        "ext/ipp/sources/ippcp/pcpbn_val2.c"
        "ext/ipp/sources/ippcp/pcpbn_val3.c"
        "ext/ipp/sources/ippcp/pcpbnarithadd.c"
        "ext/ipp/sources/ippcp/pcpbnarithcmp.c"
        "ext/ipp/sources/ippcp/pcpbnarithcmpz.c"
        "ext/ipp/sources/ippcp/pcpbnarithdiv.c"
        "ext/ipp/sources/ippcp/pcpbnarithgcd.c"
        "ext/ipp/sources/ippcp/pcpbnarithmac.c"
        "ext/ipp/sources/ippcp/pcpbnarithminv.c"
        "ext/ipp/sources/ippcp/pcpbnarithmod.c"
        "ext/ipp/sources/ippcp/pcpbnarithmul.c"
        "ext/ipp/sources/ippcp/pcpbnarithsub.c"
        "ext/ipp/sources/ippcp/pcpbngetext.c"
        "ext/ipp/sources/ippcp/pcpbngetlen.c"
        "ext/ipp/sources/ippcp/pcpbngetoctstr.c"
        "ext/ipp/sources/ippcp/pcpbngetref.c"
        "ext/ipp/sources/ippcp/pcpbngetsize.c"
        "ext/ipp/sources/ippcp/pcpbngetwords.c"
        "ext/ipp/sources/ippcp/pcpbninit.c"
        "ext/ipp/sources/ippcp/pcpbnresourceca.c"
        "ext/ipp/sources/ippcp/pcpbnsetoctstr.c"
        "ext/ipp/sources/ippcp/pcpbnsetwords.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_add.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_dec.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_div.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_inc.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_muldigit.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_sub.c"
        "ext/ipp/sources/ippcp/pcpbnu32_arith_submuldigit.c"
        "ext/ipp/sources/ippcp/pcpbnu32_getoctstr.c"
        "ext/ipp/sources/ippcp/pcpbnu32_nlz.c"
        "ext/ipp/sources/ippcp/pcpbnu32_setoctstr.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_add.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_addmuldigit.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_dec.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_gcd.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_inc.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_minv.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_mul_adc.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_sqr_adc.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_sub.c"
        "ext/ipp/sources/ippcp/pcpbnu_arith_submuldigit.c"
        "ext/ipp/sources/ippcp/pcpbnu_getoctstr.c"
        "ext/ipp/sources/ippcp/pcpbnu_lsr.c"
        "ext/ipp/sources/ippcp/pcpbnu_msbit.c"
        "ext/ipp/sources/ippcp/pcpbnu_nlz.c"
        "ext/ipp/sources/ippcp/pcpbnu_ntz.c"
        "ext/ipp/sources/ippcp/pcpbnu_setoctstr.c"
        "ext/ipp/sources/ippcp/pcpecc_psetdp.c"
        "ext/ipp/sources/ippcp/pcpeccpaddpoint.c"
        "ext/ipp/sources/ippcp/pcpeccpbindgxytblstd192r1.c"
        "ext/ipp/sources/ippcp/pcpeccpbindgxytblstd224r1.c"
        "ext/ipp/sources/ippcp/pcpeccpbindgxytblstd256r1.c"
        "ext/ipp/sources/ippcp/pcpeccpbindgxytblstd384r1.c"
        "ext/ipp/sources/ippcp/pcpeccpbindgxytblstd521r1.c"
        "ext/ipp/sources/ippcp/pcpeccpcheckpoint.c"
        "ext/ipp/sources/ippcp/pcpeccpcomparepoint.c"
        "ext/ipp/sources/ippcp/pcpeccpgenkeyca.c"
        "ext/ipp/sources/ippcp/pcpeccpget.c"
        "ext/ipp/sources/ippcp/pcpeccpgetorderbitsize.c"
        "ext/ipp/sources/ippcp/pcpeccpgetpoint.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsize.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd128r1.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd128r2.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd192r1.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd224r1.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd256r1.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd384r1.c"
        "ext/ipp/sources/ippcp/pcpeccpgetsizestd521r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinit.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd128r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd128r2.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd192r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd224r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd256r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd384r1.c"
        "ext/ipp/sources/ippcp/pcpeccpinitstd521r1.c"
        "ext/ipp/sources/ippcp/pcpeccpmulpointscalar.c"
        "ext/ipp/sources/ippcp/pcpeccpnegativepoint.c"
        "ext/ipp/sources/ippcp/pcpeccppointgetsize.c"
        "ext/ipp/sources/ippcp/pcpeccppointinit.c"
        "ext/ipp/sources/ippcp/pcpeccppublickeyca.c"
        "ext/ipp/sources/ippcp/pcpeccpsecretdhca.c"
        "ext/ipp/sources/ippcp/pcpeccpsecretdhcca.c"
        "ext/ipp/sources/ippcp/pcpeccpset.c"
        "ext/ipp/sources/ippcp/pcpeccpsetkeyca.c"
        "ext/ipp/sources/ippcp/pcpeccpsetpoint.c"
        "ext/ipp/sources/ippcp/pcpeccpsetpointatinfinity.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd128r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd128r2.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd192r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd224r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd256r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd384r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsetstd521r1.c"
        "ext/ipp/sources/ippcp/pcpeccpsigndsaca.c"
        "ext/ipp/sources/ippcp/pcpeccpsignnrca.c"
        "ext/ipp/sources/ippcp/pcpeccpsignsm2ca.c"
        "ext/ipp/sources/ippcp/pcpeccpstdca.c"
        "ext/ipp/sources/ippcp/pcpeccpvalidateca.c"
        "ext/ipp/sources/ippcp/pcpeccpvalidatekeyca.c"
        "ext/ipp/sources/ippcp/pcpeccpverifydsaca.c"
        "ext/ipp/sources/ippcp/pcpeccpverifynrca.c"
        "ext/ipp/sources/ippcp/pcpeccpverifysm2ca.c"
        "ext/ipp/sources/ippcp/pcpeccresultca.c"
        "ext/ipp/sources/ippcp/pcpgfp.c"
        "ext/ipp/sources/ippcp/pcpgfp_exp.c"
        "ext/ipp/sources/ippcp/pcpgfp_get.c"
        "ext/ipp/sources/ippcp/pcpgfp_getoctstring.c"
        "ext/ipp/sources/ippcp/pcpgfp_gfeqnr.c"
        "ext/ipp/sources/ippcp/pcpgfp_inv.c"
        "ext/ipp/sources/ippcp/pcpgfp_rand.c"
        "ext/ipp/sources/ippcp/pcpgfp_set.c"
        "ext/ipp/sources/ippcp/pcpgfp_setgfp.c"
        "ext/ipp/sources/ippcp/pcpgfp_setoctstring.c"
        "ext/ipp/sources/ippcp/pcpgfp_sqrt.c"
        "ext/ipp/sources/ippcp/pcpgfpadd.c"
        "ext/ipp/sources/ippcp/pcpgfpaddpe.c"
        "ext/ipp/sources/ippcp/pcpgfpbufsize.c"
        "ext/ipp/sources/ippcp/pcpgfpcmpelem.c"
        "ext/ipp/sources/ippcp/pcpgfpconj.c"
        "ext/ipp/sources/ippcp/pcpgfpcpyelem.c"
        "ext/ipp/sources/ippcp/pcpgfpec.c"
        "ext/ipp/sources/ippcp/pcpgfpec_add.c"
        "ext/ipp/sources/ippcp/pcpgfpec_addaffine.c"
        "ext/ipp/sources/ippcp/pcpgfpec_baseprod.c"
        "ext/ipp/sources/ippcp/pcpgfpec_comppont.c"
        "ext/ipp/sources/ippcp/pcpgfpec_dblpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpec_getpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpec_makepoint.c"
        "ext/ipp/sources/ippcp/pcpgfpec_mul.c"
        "ext/ipp/sources/ippcp/pcpgfpec_mul1.c"
        "ext/ipp/sources/ippcp/pcpgfpec_mulbase.c"
        "ext/ipp/sources/ippcp/pcpgfpec_mulbase1.c"
        "ext/ipp/sources/ippcp/pcpgfpec_negpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpec_prod.c"
        "ext/ipp/sources/ippcp/pcpgfpec_selectp192r1w7.c"
        "ext/ipp/sources/ippcp/pcpgfpec_selectp224r1w7.c"
        "ext/ipp/sources/ippcp/pcpgfpec_selectp256r1w7.c"
        "ext/ipp/sources/ippcp/pcpgfpec_selectp384r1w5.c"
        "ext/ipp/sources/ippcp/pcpgfpec_selectp521r1w5.c"
        "ext/ipp/sources/ippcp/pcpgfpec_setpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpec_setuptable.c"
        "ext/ipp/sources/ippcp/pcpgfpecaddpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecbindstd192r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecbindstd224r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecbindstd256r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecbindstd384r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecbindstd521r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecbufsize.c"
        "ext/ipp/sources/ippcp/pcpgfpeccmppoint.c"
        "ext/ipp/sources/ippcp/pcpgfpeccpypoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecdh.c"
        "ext/ipp/sources/ippcp/pcpgfpecdhc.c"
        "ext/ipp/sources/ippcp/pcpgfpecget.c"
        "ext/ipp/sources/ippcp/pcpgfpecgetpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecgetpointoctstring.c"
        "ext/ipp/sources/ippcp/pcpgfpecgetpointreg.c"
        "ext/ipp/sources/ippcp/pcpgfpecgetsize.c"
        "ext/ipp/sources/ippcp/pcpgfpecgetsubgroup.c"
        "ext/ipp/sources/ippcp/pcpgfpecinit.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd128r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd128r2.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd192r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd224r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd256r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd384r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstd521r1.c"
        "ext/ipp/sources/ippcp/pcpgfpecinitstdbn256.c"
        "ext/ipp/sources/ippcp/pcpgfpeckeys.c"
        "ext/ipp/sources/ippcp/pcpgfpecmakepoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecmulpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecnegpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecpointstuff.c"
        "ext/ipp/sources/ippcp/pcpgfpecprivatekey.c"
        "ext/ipp/sources/ippcp/pcpgfpecpublickey.c"
        "ext/ipp/sources/ippcp/pcpgfpecset.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointatinf.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointhash.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointhash_rmf.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointoctstring.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointrand.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetpointreg.c"
        "ext/ipp/sources/ippcp/pcpgfpecsetsubgroup.c"
        "ext/ipp/sources/ippcp/pcpgfpecsigndsa.c"
        "ext/ipp/sources/ippcp/pcpgfpecsignnr.c"
        "ext/ipp/sources/ippcp/pcpgfpectstpoint.c"
        "ext/ipp/sources/ippcp/pcpgfpectstpointinsubgroup.c"
        "ext/ipp/sources/ippcp/pcpgfpecverify.c"
        "ext/ipp/sources/ippcp/pcpgfpecverifydsa.c"
        "ext/ipp/sources/ippcp/pcpgfpecverifynr.c"
        "ext/ipp/sources/ippcp/pcpgfpelemgetsize.c"
        "ext/ipp/sources/ippcp/pcpgfpeleminit.c"
        "ext/ipp/sources/ippcp/pcpgfpexp.c"
        "ext/ipp/sources/ippcp/pcpgfpgetelem.c"
        "ext/ipp/sources/ippcp/pcpgfpgetelemoctstr.c"
        "ext/ipp/sources/ippcp/pcpgfpgetsize.c"
        "ext/ipp/sources/ippcp/pcpgfpinit.c"
        "ext/ipp/sources/ippcp/pcpgfpinitarbitrary.c"
        "ext/ipp/sources/ippcp/pcpgfpinitfixed.c"
        "ext/ipp/sources/ippcp/pcpgfpinv.c"
        "ext/ipp/sources/ippcp/pcpgfpisunityelem.c"
        "ext/ipp/sources/ippcp/pcpgfpiszeroelem.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_192r1.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_224r1.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_256.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_256bn.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_256r1.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_384r1.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_521r1.c"
        "ext/ipp/sources/ippcp/pcpgfpmethod_com.c"
        "ext/ipp/sources/ippcp/pcpgfpmul.c"
        "ext/ipp/sources/ippcp/pcpgfpmulexp.c"
        "ext/ipp/sources/ippcp/pcpgfpmulpe.c"
        "ext/ipp/sources/ippcp/pcpgfpneg.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelem.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelemhash.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelemhashrmf.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelemoctstr.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelemrand.c"
        "ext/ipp/sources/ippcp/pcpgfpsetelemreg.c"
        "ext/ipp/sources/ippcp/pcpgfpsqr.c"
        "ext/ipp/sources/ippcp/pcpgfpsqrt.c"
        "ext/ipp/sources/ippcp/pcpgfpsub.c"
        "ext/ipp/sources/ippcp/pcpgfpsubpe.c"
        "ext/ipp/sources/ippcp/pcpgfpx.c"
        "ext/ipp/sources/ippcp/pcpgfpx_add_gfe.c"
        "ext/ipp/sources/ippcp/pcpgfpx_conj.c"
        "ext/ipp/sources/ippcp/pcpgfpx_exp.c"
        "ext/ipp/sources/ippcp/pcpgfpx_get.c"
        "ext/ipp/sources/ippcp/pcpgfpx_getpolyterm.c"
        "ext/ipp/sources/ippcp/pcpgfpx_inv.c"
        "ext/ipp/sources/ippcp/pcpgfpx_mul_gfe.c"
        "ext/ipp/sources/ippcp/pcpgfpx_multiexp.c"
        "ext/ipp/sources/ippcp/pcpgfpx_neg.c"
        "ext/ipp/sources/ippcp/pcpgfpx_rand.c"
        "ext/ipp/sources/ippcp/pcpgfpx_set.c"
        "ext/ipp/sources/ippcp/pcpgfpx_setpolyterm.c"
        "ext/ipp/sources/ippcp/pcpgfpx_sub_gfe.c"
        "ext/ipp/sources/ippcp/pcpgfpxgetsize.c"
        "ext/ipp/sources/ippcp/pcpgfpxinit.c"
        "ext/ipp/sources/ippcp/pcpgfpxinitbinomial.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_binom.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_binom2.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_binom3.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_binom3_epid2.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_binom_epid2.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_add.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_decode.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_div2.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_encode.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_mul.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_mul2.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_mul3.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_neg.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_sqr.c"
        "ext/ipp/sources/ippcp/pcpgfpxmethod_com_sub.c"
        "ext/ipp/sources/ippcp/pcpgfpxstuff.c"
        "ext/ipp/sources/ippcp/pcphash_digest.c"
        "ext/ipp/sources/ippcp/pcphash_init.c"
        "ext/ipp/sources/ippcp/pcphash_reinit.c"
        "ext/ipp/sources/ippcp/pcphashca_rmf.c"
        "ext/ipp/sources/ippcp/pcphashcnt.c"
        "ext/ipp/sources/ippcp/pcphashduplicate.c"
        "ext/ipp/sources/ippcp/pcphashduplicate_rmf.c"
        "ext/ipp/sources/ippcp/pcphashfinal.c"
        "ext/ipp/sources/ippcp/pcphashfinal_rmf.c"
        "ext/ipp/sources/ippcp/pcphashgetsize.c"
        "ext/ipp/sources/ippcp/pcphashgetsize_rmf.c"
        "ext/ipp/sources/ippcp/pcphashgettag.c"
        "ext/ipp/sources/ippcp/pcphashgettag_rmf.c"
        "ext/ipp/sources/ippcp/pcphashinit.c"
        "ext/ipp/sources/ippcp/pcphashinit_rmf.c"
        "ext/ipp/sources/ippcp/pcphashmd5px.c"
        "ext/ipp/sources/ippcp/pcphashmessage.c"
        "ext/ipp/sources/ippcp/pcphashmessage_rmf.c"
        "ext/ipp/sources/ippcp/pcphashmethod_md5.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha1.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha1_ni.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha1_tt.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha224.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha224_ni.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha224_tt.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha256.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha256_ni.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha256_tt.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha384.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha512.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha512_224.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sha512_256.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sm3.c"
        "ext/ipp/sources/ippcp/pcphashpack.c"
        "ext/ipp/sources/ippcp/pcphashpack_rmf.c"
        "ext/ipp/sources/ippcp/pcphashsha1px.c"
        "ext/ipp/sources/ippcp/pcphashsha256px.c"
        "ext/ipp/sources/ippcp/pcphashsha512px.c"
        "ext/ipp/sources/ippcp/pcphashsm3px.c"
        "ext/ipp/sources/ippcp/pcphashunpack.c"
        "ext/ipp/sources/ippcp/pcphashunpack_rmf.c"
        "ext/ipp/sources/ippcp/pcphashupdate.c"
        "ext/ipp/sources/ippcp/pcphashupdate_rmf.c"
        "ext/ipp/sources/ippcp/pcpmgf1ca_rmf.c"
        "ext/ipp/sources/ippcp/pcpmgf2ca_rmf.c"
        "ext/ipp/sources/ippcp/pcpmont_expbinbnu.c"
        "ext/ipp/sources/ippcp/pcpmont_expsafebinary.c"
        "ext/ipp/sources/ippcp/pcpmont_getsize.c"
        "ext/ipp/sources/ippcp/pcpmont_init.c"
        "ext/ipp/sources/ippcp/pcpmont_multiexp_fast.c"
        "ext/ipp/sources/ippcp/pcpmont_multiexpinitarray.c"
        "ext/ipp/sources/ippcp/pcpmont_packctx.c"
        "ext/ipp/sources/ippcp/pcpmont_set.c"
        "ext/ipp/sources/ippcp/pcpmont_unpackctx.c"
        "ext/ipp/sources/ippcp/pcpmontexp.c"
        "ext/ipp/sources/ippcp/pcpmontexp_winsize.c"
        "ext/ipp/sources/ippcp/pcpmontform.c"
        "ext/ipp/sources/ippcp/pcpmontget.c"
        "ext/ipp/sources/ippcp/pcpmontgetsize.c"
        "ext/ipp/sources/ippcp/pcpmontinit.c"
        "ext/ipp/sources/ippcp/pcpmontmul.c"
        "ext/ipp/sources/ippcp/pcpmontred.c"
        "ext/ipp/sources/ippcp/pcpmontset.c"
        "ext/ipp/sources/ippcp/pcpp192r1precomca.c"
        "ext/ipp/sources/ippcp/pcpp224r1precomca.c"
        "ext/ipp/sources/ippcp/pcpp256r1precomca.c"
        "ext/ipp/sources/ippcp/pcpp384r1precomca.c"
        "ext/ipp/sources/ippcp/pcpp521r1precomca.c"
        "ext/ipp/sources/ippcp/pcpprng_gen.c"
        "ext/ipp/sources/ippcp/pcpprngen_bn.c"
        "ext/ipp/sources/ippcp/pcpprngen_pattern.c"
        "ext/ipp/sources/ippcp/pcpprngen_range.c"
        "ext/ipp/sources/ippcp/pcpprngenca.c"
        "ext/ipp/sources/ippcp/pcpprngenhw_bn.c"
        "ext/ipp/sources/ippcp/pcpprngenhwca.c"
        "ext/ipp/sources/ippcp/pcpprnggetseed.c"
        "ext/ipp/sources/ippcp/pcpprnggetsize.c"
        "ext/ipp/sources/ippcp/pcpprnginitca.c"
        "ext/ipp/sources/ippcp/pcpprngsetaugment.c"
        "ext/ipp/sources/ippcp/pcpprngsetca.c"
        "ext/ipp/sources/ippcp/pcpprngsetmodulus.c"
        "ext/ipp/sources/ippcp/pcpprngsetseed.c"
        "ext/ipp/sources/ippcp/pcpsha1duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha1final.c"
        "ext/ipp/sources/ippcp/pcpsha1getsize.c"
        "ext/ipp/sources/ippcp/pcpsha1gettag.c"
        "ext/ipp/sources/ippcp/pcpsha1init.c"
        "ext/ipp/sources/ippcp/pcpsha1messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha1pack.c"
        "ext/ipp/sources/ippcp/pcpsha1unpack.c"
        "ext/ipp/sources/ippcp/pcpsha1update.c"
        "ext/ipp/sources/ippcp/pcpsha224duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha224final.c"
        "ext/ipp/sources/ippcp/pcpsha224getsize.c"
        "ext/ipp/sources/ippcp/pcpsha224gettag.c"
        "ext/ipp/sources/ippcp/pcpsha224init.c"
        "ext/ipp/sources/ippcp/pcpsha224messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha224pack.c"
        "ext/ipp/sources/ippcp/pcpsha224unpack.c"
        "ext/ipp/sources/ippcp/pcpsha224update.c"
        "ext/ipp/sources/ippcp/pcpsha256_messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha256ca.c"
        "ext/ipp/sources/ippcp/pcpsha256duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha256final.c"
        "ext/ipp/sources/ippcp/pcpsha256getsize.c"
        "ext/ipp/sources/ippcp/pcpsha256gettag.c"
        "ext/ipp/sources/ippcp/pcpsha256init.c"
        "ext/ipp/sources/ippcp/pcpsha256messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha256pack.c"
        "ext/ipp/sources/ippcp/pcpsha256unpack.c"
        "ext/ipp/sources/ippcp/pcpsha256update.c"
        "ext/ipp/sources/ippcp/pcpsha384duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha384final.c"
        "ext/ipp/sources/ippcp/pcpsha384getsize.c"
        "ext/ipp/sources/ippcp/pcpsha384gettag.c"
        "ext/ipp/sources/ippcp/pcpsha384init.c"
        "ext/ipp/sources/ippcp/pcpsha384messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha384pack.c"
        "ext/ipp/sources/ippcp/pcpsha384unpack.c"
        "ext/ipp/sources/ippcp/pcpsha384update.c"
        "ext/ipp/sources/ippcp/pcpsha512_init.c"
        "ext/ipp/sources/ippcp/pcpsha512_messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha512duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha512final.c"
        "ext/ipp/sources/ippcp/pcpsha512getsize.c"
        "ext/ipp/sources/ippcp/pcpsha512gettag.c"
        "ext/ipp/sources/ippcp/pcpsha512init.c"
        "ext/ipp/sources/ippcp/pcpsha512messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha512pack.c"
        "ext/ipp/sources/ippcp/pcpsha512unpack.c"
        "ext/ipp/sources/ippcp/pcpsha512update.c"
        "ext/ipp/sources/ippcp/pcpshsmgfca.c"
        "ext/ipp/sources/ippcp/pcpsm2pprecomca.c"
        "ext/ipp/sources/ippcp/pcptrngenhwca.c"
        "ext/ipp/sources/ippcp/pcpver.c"
    ];
    exclude_srcs = [
        "ext/ipp/sources/ippcp/pcphashmethod_md5.c"
        "ext/ipp/sources/ippcp/pcpeccpsignsm2ca.c"
        "ext/ipp/sources/ippcp/pcpeccpverifysm2ca.c"
        "ext/ipp/sources/ippcp/pcpsm2pprecomca.c"
        "ext/ipp/sources/ippcp/pcphashmethod_sm3.c"
        "ext/ipp/sources/ippcp/cpinit.c"

        "ext/ipp/sources/ippcp/pcpmain.c"

        "ext/ipp/sources/ippcp/pcpmont_expbinbnu_sscm.c"
        "ext/ipp/sources/ippcp/pcpmont_expwinbnu.c"
        "ext/ipp/sources/ippcp/pcpmont_expwinbnu_sscm.c"

        "ext/ipp/sources/ippcp/pcpsha1duplicate.c"
        "ext/ipp/sources/ippcp/pcpsha1final.c"
        "ext/ipp/sources/ippcp/pcpsha1getsize.c"
        "ext/ipp/sources/ippcp/pcpsha1gettag.c"
        "ext/ipp/sources/ippcp/pcpsha1init.c"
        "ext/ipp/sources/ippcp/pcpsha1messagedigest.c"
        "ext/ipp/sources/ippcp/pcpsha1pack.c"
        "ext/ipp/sources/ippcp/pcpsha1unpack.c"
        "ext/ipp/sources/ippcp/pcpsha1update.c"

    ];
    cflags = [
        "-D_IPP_DEBUG"
        "-D_IPP_C99"
        "-D_IPP_v50_"
        "-D_PX"
        "-D_DISABLE_ECP_SM2_"
        "-D_DISABLE_ALG_SHA224_"
        "-D_DISABLE_ALG_SHA512_224_"
        "-D_DISABLE_ALG_MD5_"
        "-D_DISABLE_ALG_SM3_"
        "-Wno-unused-function"
        "-Wno-date-time"
        "-Wno-#pragma-messages"
    ];
    local_include_dirs = [
        "ext/ipp/sources/ippcp/"
        "ext/ipp/sources/include/"
    ];
    export_include_dirs = [
        "ext/ipp/include/"
    ];
};

libepid_common = cc_library {
    name = "libepid_common";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common/1.1/src/commitment.c"
        "epid/common/1.1/src/epid11params.c"
        "epid/common/1.1/src/file_parser.c"
        "epid/common/1.1/src/grouppubkey.c"
        "epid/common/math/src/bignum.c"
        "epid/common/math/src/ecdsa_sign.c"
        "epid/common/math/src/ecdsa_verify.c"
        "epid/common/math/src/ecgroup.c"
        "epid/common/math/src/finitefield.c"
        "epid/common/math/src/pairing.c"
        "epid/common/math/src/printutils.c"
        "epid/common/math/src/sha256.c"
        "epid/common/math/src/tatepairing.c"
        "epid/common/src/commitment.c"
        "epid/common/src/epid2params.c"
        "epid/common/src/errors.c"
        "epid/common/src/file_parser.c"
        "epid/common/src/grouppubkey.c"
        "epid/common/src/hashsize.c"
        "epid/common/src/memory.c"
        "epid/common/src/sigrlvalid.c"
        "epid/common/src/stack.c"
    ];
    local_include_dirs = [
        "epid/common/math/src"
        "epid/common/math/"
        "epid/common/src"
    ];
    static_libs = [
        "libippcp"
    ];
};

libepid_member = cc_library {
    name = "libepid_member";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/src/allowed_basenames.c"
        "epid/member/src/context.c"
        "epid/member/src/decompress_privkey.c"
        "epid/member/src/get_sigsize.c"
        "epid/member/src/hash_basename.c"
        "epid/member/src/join.c"
        "epid/member/src/join_commitment.c"
        "epid/member/src/nrprove.c"
        "epid/member/src/nrprove_commitment.c"
        "epid/member/src/precomp.c"
        "epid/member/src/presig.c"
        "epid/member/src/privateexp.c"
        "epid/member/src/provision_bulk.c"
        "epid/member/src/provision_compressed.c"
        "epid/member/src/provision_join.c"
        "epid/member/src/resize.c"
        "epid/member/src/sign.c"
        "epid/member/src/sign_commitment.c"
        "epid/member/src/signbasic.c"
        "epid/member/src/startup.c"
        "epid/member/src/storage.c"
        "epid/member/src/validatekey.c"
        "epid/member/src/write_precomp.c"
        "epid/member/tpm2/src/commit.c"
        "epid/member/tpm2/src/context.c"
        "epid/member/tpm2/src/createprimary.c"
        "epid/member/tpm2/src/getrandom.c"
        "epid/member/tpm2/src/load_external.c"
        "epid/member/tpm2/src/nv.c"
        "epid/member/tpm2/src/sign.c"
    ];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "libepid_common"
        "libippcp"
    ];
};

libepid_verifier = cc_library {
    name = "libepid_verifier";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/verifier/1.1/src/check_privrl_entry.c"
        "epid/verifier/1.1/src/context.c"
        "epid/verifier/1.1/src/nrverify.c"
        "epid/verifier/1.1/src/sigs_linked.c"
        "epid/verifier/1.1/src/verify.c"
        "epid/verifier/1.1/src/verifybasic.c"
        "epid/verifier/src/check_privrl_entry.c"
        "epid/verifier/src/context.c"
        "epid/verifier/src/nrverify.c"
        "epid/verifier/src/sigs_linked.c"
        "epid/verifier/src/verify.c"
        "epid/verifier/src/verifybasic.c"
    ];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "libepid_common"
        "libippcp"
    ];
};

libepid_util = cc_library {
    name = "libepid_util";
    defaults = ["epid_cflags"];
    srcs = [
        "example/util/src/bufutil.c"
        "example/util/src/convutil.c"
        "example/util/src/envutil.c"
        "example/util/src/strutil.c"
    ];
    export_include_dirs = [
        "example"
    ];
    static_libs = [
        "libepid_common"
    ];
};

libargtable3 = cc_library {
    name = "libargtable3";
    defaults = ["epid_cflags"];
    srcs = [
        "ext/argtable3/argtable3.c"
    ];
    export_include_dirs = [
        "ext/argtable3"
    ];
};

libepid_common_testhelper = cc_library {
    name = "libepid_common_testhelper";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common-testhelper/bignum_wrapper-testhelper.cc"
        "epid/common-testhelper/ecgroup_wrapper-testhelper.cc"
        "epid/common-testhelper/ecpoint_wrapper-testhelper.cc"
        "epid/common-testhelper/epid2params_wrapper-testhelper.cc"
        "epid/common-testhelper/epid_gtest-testhelper.cc"
        "epid/common-testhelper/epid_params-testhelper.cc"
        "epid/common-testhelper/ffelement_wrapper-testhelper.cc"
        "epid/common-testhelper/finite_field_wrapper-testhelper.cc"
        "epid/common-testhelper/mem_params-testhelper.cc"
        "epid/common-testhelper/member_wrapper-testhelper.cc"
        "epid/common-testhelper/octstr-testhelper.cc"
        "epid/common-testhelper/testapp-testhelper.cc"
        "epid/common-testhelper/verifier_wrapper-testhelper.cc"
        "epid/common-testhelper/1.1/epid_params-testhelper.cc"
        "epid/common-testhelper/1.1/verifier_wrapper-testhelper.cc"
    ];
    local_include_dirs = [
        "ext"
        "epid/common-testhelper/"
        "epid/common-testhelper/1.1"
    ];
    static_libs = [
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
        "libgtest"
    ];
};

epid_verifysig = cc_binary {
    name = "epid_verifysig";
    defaults = ["epid_cflags"];
    srcs = [
        "example/verifysig/src/main.c"
        "example/verifysig/src/verifysig.c"
        "example/verifysig/src/verifysig11.c"
    ];
    local_include_dirs = [
        "example/verifysig"
    ];
    static_libs = [
        "libepid_verifier"
        "libepid_common"
        "libepid_util"
        "libippcp"
        "libargtable3"
    ];
};

epid_signmsg = cc_binary {
    name = "epid_signmsg";
    defaults = ["epid_cflags"];
    srcs = [
        "example/signmsg/src/main.c"
        "example/signmsg/src/prng.c"
        "example/signmsg/src/signmsg.c"
    ];
    local_include_dirs = [
        "example/signmsg"
    ];
    static_libs = [
        "libepid_member"
        "libepid_common"
        "libepid_util"
        "libippcp"
        "libargtable3"
    ];
};

epid_common_testhelper_utest = cc_test {
    name = "epid_common_testhelper_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common-testhelper/unittests/bignum_wrapper-test.cc"
        "epid/common-testhelper/unittests/ecgroup_wrapper-test.cc"
        "epid/common-testhelper/unittests/ecpoint_wrapper-test.cc"
        "epid/common-testhelper/unittests/ffelement_wrapper-test.cc"
        "epid/common-testhelper/unittests/finite_field_wrapper-test.cc"
        "epid/common-testhelper/unittests/main-test.cc"
    ];
    local_include_dirs = [
        "ext"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
    ];
};

epid_common_utest = cc_test {
    name = "epid_common_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/common/math/unittests/bignum-test.cc"
        "epid/common/math/unittests/ecdsa_sign-test.cc"
        "epid/common/math/unittests/ecdsa_verify-test.cc"
        "epid/common/math/unittests/ecgroup-test.cc"
        "epid/common/math/unittests/ffelement-test.cc"
        "epid/common/math/unittests/finitefield-test.cc"
        "epid/common/math/unittests/hash-test.cc"
        "epid/common/math/unittests/main-test.cc"
        "epid/common/math/unittests/octstrconvert-test.cc"
        "epid/common/math/unittests/pairing-test.cc"
        "epid/common/math/unittests/printutils-test.cc"
        "epid/common/math/unittests/tatepairing-test.cc"
        "epid/common/unittests/file_parser-test.cc"
        "epid/common/1.1/unittests/file_parser-test.cc"
    ];
    local_include_dirs = [
        "epid/common/unittests/"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_member"
        "libepid_verifier"
        "libepid_common"
        "libippcp"
    ];
};

epid_member_utest = cc_test {
    name = "epid_member_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/unittests/context-test.cc"
        "epid/member/unittests/decompress_privkey-test.cc"
        "epid/member/unittests/get_sigsize-test.cc"
        "epid/member/unittests/iskeyvalid-test.cc"
        "epid/member/unittests/join_request-test.cc"
        "epid/member/unittests/main-test.cc"
        "epid/member/unittests/member-testhelper.cc"
        "epid/member/unittests/nr_prove-test.cc"
        "epid/member/unittests/presig-test.cc"
        "epid/member/unittests/privateexp-test.cc"
        "epid/member/unittests/provision_compressed-test.cc"
        "epid/member/unittests/provision_credential-test.cc"
        "epid/member/unittests/provision_key-test.cc"
        "epid/member/unittests/resize-test.cc"
        "epid/member/unittests/sign-test.cc"
        "epid/member/unittests/signbasic-test.cc"
        "epid/member/unittests/storage-test.cc"
        "epid/member/tpm2/unittests/tpm2_wrapper-testhelper.cc"
    ];
    local_include_dirs = [
        "ext"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"
    ];
};

epid_member_tpm2_utest = cc_test {
    name = "epid_member_tpm2_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/member/tpm2/unittests/commit-simulator-test.cc"
        "epid/member/tpm2/unittests/commit-test.cc"
        "epid/member/tpm2/unittests/context-test.cc"
        "epid/member/tpm2/unittests/conversion-tss-test.cc"
        "epid/member/tpm2/unittests/createprimary-test.cc"
        "epid/member/tpm2/unittests/getrandom-simulator-test.cc"
        "epid/member/tpm2/unittests/getrandom-test.cc"
        "epid/member/tpm2/unittests/getrandom-tss-test.cc"
        "epid/member/tpm2/unittests/load_external-simulator-test.cc"
        "epid/member/tpm2/unittests/load_external-test.cc"
        "epid/member/tpm2/unittests/main-testhelper.cc"
        "epid/member/tpm2/unittests/nv-test.cc"
        "epid/member/tpm2/unittests/sign-simulator-test.cc"
        "epid/member/tpm2/unittests/sign-test.cc"
        "epid/member/tpm2/unittests/tpm2-testhelper.cc"
        "epid/member/tpm2/unittests/tpm2_wrapper-testhelper.cc"
    ];
    exclude_srcs = [
        "epid/member/tpm2/unittests/conversion-tss-test.cc"
        "epid/member/tpm2/unittests/getrandom-tss-test.cc"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"

    ];
};

epid_verifier_utest = cc_test {
    name = "epid_verifier_utest";
    defaults = ["epid_cflags"];
    srcs = [
        "epid/verifier/unittests/check_privrl_entry-test.cc"
        "epid/verifier/unittests/context-test.cc"
        "epid/verifier/unittests/main-test.cc"
        "epid/verifier/unittests/nrverify-test.cc"
        "epid/verifier/unittests/sigs_linked-test.cc"
        "epid/verifier/unittests/verifier-testhelper.cc"
        "epid/verifier/unittests/verify-test.cc"
        "epid/verifier/unittests/verifybasic-test.cc"
        "epid/verifier/1.1/unittests/check_privrl_entry-test.cc"
        "epid/verifier/1.1/unittests/context-test.cc"
        "epid/verifier/1.1/unittests/nrverify-test.cc"
        "epid/verifier/1.1/unittests/sigs_linked-test.cc"
        "epid/verifier/1.1/unittests/verifier-testhelper.cc"
        "epid/verifier/1.1/unittests/verify-test.cc"
        "epid/verifier/1.1/unittests/verifybasic-test.cc"
    ];
    static_libs = [
        "libepid_common_testhelper"
        "libepid_verifier"
        "libepid_member"
        "libepid_common"
        "libippcp"
    ];
};

in { inherit epid_cflags epid_common_testhelper_utest epid_common_utest epid_member_tpm2_utest epid_member_utest epid_signmsg epid_verifier_utest epid_verifysig libargtable3 libepid_common libepid_common_testhelper libepid_member libepid_util libepid_verifier libippcp; }
