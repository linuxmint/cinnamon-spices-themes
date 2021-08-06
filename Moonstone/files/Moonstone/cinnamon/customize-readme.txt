 /* Customize Readme -- How to customize this theme */

 /* To customize panel color / transparency, edit the following: */
 .panel-top, .panel-bottom, .panel-left, .panel-right {
    background-color: rgba(46, 46, 46, 0.59); /* panel bg color & alpha */
    }

 /* To customize main Cinnamon menu: */
.menu {
  color: #f0f0f0;
  border: 1px solid #202020;
  border-radius: 3px;
  background-color: rgba(46, 46, 46, 0.59); } /* menu bg color & alpha */
  .menu.top {
    border-radius: 0 0 3px 3px; }
  .menu.bottom {
    border-radius: 3px 3px 0 0; }
  .menu.left {
    border-radius: 0 3px 3px 0; }
  .menu.right {
    border-radius: 3px 0 0 3px; }
.menu-favorites-box {
  padding: 10px;
  transition-duration: 300;
  background-color: rgba(64, 64, 64, 0.75); /* menu favorites box bg color & alpha */
  border: 1px solid #202020; }
/* menu search box */
#menu-search-entry:focus, .popup-menu #notification StEntry:focus, #menu-search-entry:hover, .popup-menu #notification StEntry:hover {
    color: #f0f0f0;
    background-color: rgba(64, 64, 64, 0.59); /* searchbox background */
    border: 1px solid #92b372;
    box-shadow: inset 0 2px 4px rgba(64, 64, 64, 0.05); }

/* Window switcher list: */
.switcher-list {
  color: #f0f0f0;
  border: 1px solid #202020;
  background-color: rgba(47, 47, 47, 0.75); /* bg color & alpha */
  border-radius: 3px;
  padding: 20px; }
  .switcher-list > StBoxLayout {
    padding: 4px; }
  .switcher-list-item-container {
    spacing: 8px; }
  .switcher-list .item-box {
    padding: 8px;
    border-radius: 2px; }
    .switcher-list .item-box:outlined {
      padding: 8px;
      border: 1px solid #92b372; }
    .switcher-list .item-box:selected {
      color: #ffffff;
      background-color: #92b372;
      border: 0px solid #92b372; }
  .switcher-list .thumbnail {
    width: 256px; }
  .switcher-list .thumbnail-box {
    padding: 2px;
    spacing: 4px; }
  .switcher-list .separator {
    width: 1px;
    background: rgba(255, 255, 255, 0.2); }

/* OSD window (on screen display when using laptop OSD keys, like volume, etc.) */
.osd-window {
  text-align: center;
  font-weight: bold;
  spacing: 1em;
  padding: 20px;
  color: #f0f0f0;
  background-color: rgba(47, 47, 47, .75); /* OSD window bg color & alpha */
  border: 1px solid #202020;
  border-radius: 5px; }
  .osd-window .osd-monitor-label {
    font-size: 3em; }
  .osd-window .level {
    padding: 0;
    height: 0.7em;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 2px; }
  .osd-window .level-bar {
    border-radius: 2px;
    background-color: #92b372; }

/* Grouped window list thumbnail */
.grouped-window-list-thumbnail-menu {
  color: #f0f0f0;
  border: 1px solid #202020;
  background-color: rgba(47, 47, 47, 0.5); /* color & alpha */
  border-radius: 3px;
  padding: 0px; }
  .grouped-window-list-thumbnail-menu > StBoxLayout {
    padding: 4px; }
  .grouped-window-list-thumbnail-menu .item-box {
    padding: 10px;
    border-radius: 2px;
    spacing: 4px; }
    .grouped-window-list-thumbnail-menu .item-box:outlined {
      padding: 8px;
      border: 1px solid #92b372; }
    .grouped-window-list-thumbnail-menu .item-box:selected {
      border: 1px solid #92b372; }
  .grouped-window-list-thumbnail-menu .thumbnail {
    width: 256px; }
  .grouped-window-list-thumbnail-menu .separator {
    width: 1px;
    background: rgba(255, 255, 255, 0.2); }

/* Run dialog (alt + F2) */
.run-dialog {
  padding: 10px 15px 10px 15px;
  border: 1px solid #202020;
  border-radius: 3px;
  background-color: rgba(47, 47, 47, .59); } /* color & bg */
  .run-dialog > * {
    padding: 0; }
  .run-dialog-label {
    font-size: 0;
    font-weight: bold;
    color: #f0f0f0;
    padding-bottom: 0; }
  .run-dialog-error-label {
    color: #FC4138; }
  .run-dialog-error-box {
    padding-top: 15px;
    spacing: 5px; }
  .run-dialog-completion-box {
    padding-top: 5px;
    padding-left: 15px;
    font-size: 1em; }
  .run-dialog-entry {
    width: 21em;
    padding: 7px;
    border-radius: 3px;
    caret-color: #c3c3c3;
    selected-color: #ffffff;
    selection-background-color: #92b372;
    color: #c3c3c3;
    background-color: rgba(109, 109, 109, 0.4);
    border: 1px solid rgba(22, 22, 22, 0.4);
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05); }
    .run-dialog-entry:focus {
      color: #f0f0f0;
      background-color: rgba(64, 64, 64, 0.59); /* run dialog entry box */
      border: 1px solid #92b372;
      box-shadow: inset 0 2px 4px rgba(64, 64, 64, 0.05); }
  .run-dialog .modal-dialog-button-box {
    border: none;
    box-shadow: none;
    background: none; }
