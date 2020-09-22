{ cc_test_host, genrule }:
let

hidl_error_test_gen = genrule {
    name = "hidl_error_test_gen";
    tools = ["hidl-gen"];
    tool_files = ["hidl_error_test.sh"];
    cmd = "$(location hidl_error_test.sh) $(location hidl-gen) &&" +
        "echo 'int main(){return 0;}' > $(genDir)/TODO_b_37575883.cpp";
    out = ["TODO_b_37575883.cpp"];
    srcs = [
        "bad_character/1.0/IFoo.hal"
        "cpp_forward_decl_restriction/1.0/types.hal"
        "empty_generates/1.0/IFoo.hal"
        "enum_storage/1.0/IFoo.hal"
        "enum_unique_field_names/1.0/IFoo.hal"
        "enum_unique_field_names_extends/1.0/IFoo.hal"
        "imports_first/1.0/types.hal"
        "interface_extends_only_interface/1.0/IFoo.hal"
        "interface_extends_only_interface/1.0/types.hal"
        "interface_no_using_reserved_method_names/1.0/IFoo.hal"
        "interface_semicolon/1.0/IFoo.hal"
        "interface_unique_method_names/1.0/IFoo.hal"
        "interface_unique_method_names_inheritance/1.0/IBar.hal"
        "interface_unique_method_names_inheritance/1.0/IFoo.hal"
        "len_tag_wrong_type/1.0/IFoo.hal"
        "line_number_doc_comments/1.0/IFoo.hal"
        "method_ends_in_semicolon/1.0/IFoo.hal"
        "missing_variable_type/1.0/IFoo.hal"
        "no_cyclic_declaration_1/1.0/IFoo.hal"
        "no_cyclic_declaration_2/1.0/IFoo.hal"
        "no_cyclic_declaration_3/1.0/types.hal"
        "no_cyclic_declaration_4/1.0/types.hal"
        "no_cyclic_expressions_1/1.0/types.hal"
        "no_cyclic_expressions_2/1.0/types.hal"
        "no_cyclic_expressions_3/1.0/types.hal"
        "no_data_outside_interface/1.0/IFoo.hal"
        "no_empty_safe_union/1.0/types.hal"
        "no_interface_in_types/1.0/IFoo.hal"
        "no_interface_in_types/1.0/types.hal"
        "no_leading_comma_argument_list/1.0/IFoo.hal"
        "no_leading_comma_result_list/1.0/IFoo.hal"
        "no_single_element_safe_union/1.0/types.hal"
        "no_two_interfaces/1.0/IFoo.hal"
        "references_broken_package/1.0/IBar.hal"
        "references_broken_package/bad_package/1.0/IFoo.hal"
        "references_broken_package/bad_package/1.0/types.hal"
        "same_name_interface/1.0/IFoo.hal"
        "same_package_name/1.0/IFoo.hal"
        "scope_unique_type_names/1.0/IFoo.hal"
        "struct_unique_field_names/1.0/IFoo.hal"
        "tag_name_does_not_exist/1.0/IFoo.hal"
        "bad_character/1.0/required_error"
        "cpp_forward_decl_restriction/1.0/required_error"
        "empty_generates/1.0/required_error"
        "enum_storage/1.0/required_error"
        "enum_unique_field_names/1.0/required_error"
        "enum_unique_field_names_extends/1.0/required_error"
        "imports_first/1.0/required_error"
        "interface_extends_only_interface/1.0/required_error"
        "interface_no_using_reserved_method_names/1.0/required_error"
        "interface_semicolon/1.0/required_error"
        "interface_unique_method_names/1.0/required_error"
        "interface_unique_method_names_inheritance/1.0/required_error"
        "len_tag_wrong_type/1.0/required_error"
        "line_number_doc_comments/1.0/required_error"
        "method_ends_in_semicolon/1.0/required_error"
        "missing_variable_type/1.0/required_error"
        "no_cyclic_declaration_1/1.0/required_error"
        "no_cyclic_declaration_2/1.0/required_error"
        "no_cyclic_declaration_3/1.0/required_error"
        "no_cyclic_declaration_4/1.0/required_error"
        "no_cyclic_expressions_1/1.0/required_error"
        "no_cyclic_expressions_2/1.0/required_error"
        "no_cyclic_expressions_3/1.0/required_error"
        "no_data_outside_interface/1.0/required_error"
        "no_empty_safe_union/1.0/required_error"
        "no_interface_in_types/1.0/required_error"
        "no_leading_comma_argument_list/1.0/required_error"
        "no_leading_comma_result_list/1.0/required_error"
        "no_single_element_safe_union/1.0/required_error"
        "no_two_interfaces/1.0/required_error"
        "references_broken_package/1.0/required_error"
        "same_name_interface/1.0/required_error"
        "same_package_name/1.0/required_error"
        "scope_unique_type_names/1.0/required_error"
        "struct_unique_field_names/1.0/required_error"
        "tag_name_does_not_exist/1.0/required_error"
    ];
};

hidl_error_test = cc_test_host {
    name = "hidl_error_test";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    generated_sources = ["hidl_error_test_gen"];
};

in { inherit hidl_error_test hidl_error_test_gen; }
