{ prebuilt_etc }:
let

#  Bluetooth bt_stack.conf config file
#  ========================================================
"bt_stack.conf" = prebuilt_etc {
    name = "bt_stack.conf";
    src = "bt_stack.conf";
    sub_dir = "bluetooth";
};

#  Bluetooth bt_did.conf config file
#  ========================================================
"bt_did.conf" = prebuilt_etc {
    name = "bt_did.conf";
    src = "bt_did.conf";
    sub_dir = "bluetooth";
};

in { inherit "bt_did.conf" "bt_stack.conf"; }
