SKIPMOUNT=true
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=false

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
    abort "! Unsupported device; expected a OnePlus 15"
fi

ui_print "- Device: OnePlus 15"
ui_print "- System slider: 2..4674"
ui_print "- Slider maximum maps through the stock Apollo table to panel DBV 4094"
ui_print "- Foreground-app FOSS, Expressiveness and UIR reduction policies disabled"
ui_print "- Window-app limit raised to the stock curve maximum 1800 nit"
ui_print "- Compatibility check: model only; no config hash whitelist"
ui_print "- No brightness node or hbm_max command is used"

set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/skip_mount" 0 0 0644
set_perm_recursive "$MODPATH/my_product" 0 0 0755 0644
