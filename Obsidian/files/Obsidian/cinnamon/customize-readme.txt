 /* Customize Readme -- How to customize this theme */

 /* Linux Mint Accent Colors
 To change the Desktop accent color, open cinnamon.css file,
 find-and-replace ALL "92b372" (without quotes), and replace with
 any of the colors in this list. Save, then restart Cinnamon with
 ctrl + alt + esc.
 */
 /* 
 Mint: #92b372
 Aqua: #6cabcd
 Blue: #5b73c4
 Brown: #aa876a
 Grey: #9d9d9d
 Orange: #db9d61
 Pink: #c76199
 Purple: #8c6ec9
 Red: #c15b58
 Sand: #c8ac69
 Teal: #5aaa9a
 */


 /* To customize element colors and/or transparency, edit the rgba() values.
 The values are rgba(red, green, blue, transparency). Colors go from 0 to 255,
 0 being black and 255 being full. Transparency is any number from 0 to 1,
 0 being fully transparent, 0.5 half transparent, and 1 being fully opaque.
 */

 .panel-top, .panel-bottom, .panel-left, .panel-right {
    background-color: rgba(46, 46, 46, 0.59); /* panel bg color & alpha */
    }

 /* To customize main Cinnamon menu: */
.menu {
  background-color: rgba(46, 46, 46, 0.59); } /* menu bg color & alpha */

.menu-favorites-box {
  background-color: rgba(64, 64, 64, 0.75); /* menu favorites box bg color & alpha */
    }
/* menu search box */
#menu-search-entry:focus, .popup-menu #notification StEntry:focus, #menu-search-entry:hover, .popup-menu #notification StEntry:hover {
    background-color: rgba(64, 64, 64, 0.59); /* searchbox background */
    }

/* Window switcher list: */
.switcher-list {
  background-color: rgba(47, 47, 47, 0.75); /* bg color & alpha */
    }

/* OSD window (on screen display when using laptop OSD keys, like volume, etc.) */
.osd-window {
  background-color: rgba(47, 47, 47, .75); /* OSD window bg color & alpha */
    }

/* Grouped window list thumbnail */
.grouped-window-list-thumbnail-menu {
  background-color: rgba(47, 47, 47, 0.5); /* color & alpha */
    }

/* Run dialog (alt + F2) */
.run-dialog {
  background-color: rgba(47, 47, 47, .59); } /* color & bg */
    .run-dialog-entry:focus {
      background-color: rgba(64, 64, 64, 0.59); /* run dialog entry box */
      }
