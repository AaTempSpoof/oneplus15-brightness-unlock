OnePlus 15 System Slider HBM Unlock

Module name:
  OnePlus 15 Slider HBM Unlock
Version:
  1.5 (versionCode 150)
Author:
  傻瓜我爱你呀喵

Target build:
  OnePlus 15 variants

What it changes:
  The stock display curves already contain logical levels 4096..4674, but the
  brightness_table header limits the system slider to 4095. This module changes
  that header to max="4674" and bind-mounts the two panel curve files before
  system_server starts.

Result:
  The normal ColorOS brightness slider controls the complete stock curve. Its
  maximum logical level 4674 maps through the stock Apollo table to panel DBV
  4094, which the shipped curve labels as 1800 nit.
  ColorOS also ships foreground-app policies that reduce brightness by package:
  FOSS, Expressiveness methods, UIR panel dimming, and a 600 nit window list.
  This module disables those app-specific reductions and raises the window
  limit to the stock curve maximum 1800 nit so apps follow the same slider.

4094 is a panel backlight code (DBV), not 4094 nit. Actual luminance still
depends on the panel, temperature, power limits, content, and ColorOS thermal
protection.

The module does not write screen_brightness, max_brightness, hbm, or hbm_max.
It has no Action button and does not keep the panel forced at maximum.

Install with KernelSU and reboot once. Then move the regular system brightness
slider; the panel follows the slider continuously.

Only the OnePlus 15 model properties are checked. Display configuration hashes
are not used, so other OnePlus 15 system versions can install the module.
Thermal, battery, HDR, and content-dependent panel protection remain enabled.
Uninstalling and rebooting restores the stock slider range.
