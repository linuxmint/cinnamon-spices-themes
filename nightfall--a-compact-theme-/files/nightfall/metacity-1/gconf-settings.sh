#!/bin/bash
gconftool -s --type string /apps/metacity/general/button_layout "maximize,minimize,close:"
gconftool -s --type bool /apps/panel/toplevels/panel_0/background/stretch "True"
gconftool -s --type bool /apps/panel/toplevels/top_panel_screen0/background/stretch "True"
gconftool -s --type bool /desktop/gnome/interface/hide_decorator_tooltip "TRUE"
