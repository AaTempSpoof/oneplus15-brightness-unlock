#!/system/bin/sh

MODDIR=${0%/*}
CONFIG_DIR=/my_product/vendor/etc

is_oneplus15() {
    props=$(printf '%s %s %s %s %s %s\n' \
        "$(getprop ro.product.model)" \
        "$(getprop ro.product.device)" \
        "$(getprop ro.product.name)" \
        "$(getprop ro.product.marketname)" \
        "$(getprop ro.build.product)" \
        "$(getprop ro.product.manufacturer)" | tr '[:upper:]' '[:lower:]')
    case "$props" in
        *plk110*|*op60ffl1*|*oneplus*15*) return 0 ;;
        *) return 1 ;;
    esac
}

if ! is_oneplus15; then
    exit 0
fi

mount_config() {
    name=$1
    source_file="$MODDIR/my_product/vendor/etc/$name"
    target_file="$CONFIG_DIR/$name"

    [ -f "$source_file" ] && [ -f "$target_file" ] || return 1
    /system/bin/chcon u:object_r:vendor_configs_file:s0 "$source_file" 2>/dev/null
    /system/bin/mount -o bind "$source_file" "$target_file" 2>/dev/null
}

mount_config display_brightness_config_P_3.xml
mount_config display_brightness_config_P_7.xml
mount_config display_brightness_app_list.xml
mount_config multimedia_display_uir_config.xml

exit 0
