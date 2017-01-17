using Gtk;

class MintyColorsWindow : ApplicationWindow {

	private Separator separator1;
	private Separator separator2;

	private Label heading1;
	private Label heading2;

	private Label description;

	private Label background_label;
	private Label arrow_label;
	private Label light_label;
	private Label font_label;
	private Label panel_label;
	private Label menu_label;

	private SpinButton font_size;
	private SpinButton panel_opacity;
	private SpinButton menu_opacity;

	private Switch background_switch;
	private Switch arrow_switch;
	private Switch light_switch;

	private RadioButton match_wallpaper;
	private RadioButton match_theme;
	private RadioButton custom_color;

	private ColorButton color_button;

	private Button apply_button;
	private Button reset_button;
	private Button close_button;

	private File config_dir;
	private File config_file;

	private Gdk.RGBA color;

	private string color_value;

	private string font;
	private string panel;
	private string menu;
	private string background;
	private string arrow;
	private string light;
	private string mode;

	internal MintyColorsWindow (MintyColorsApp app) {
		Object (application: app, title: "Minty Colors Preferences");

		// Set window properties
		this.window_position = WindowPosition.CENTER;
		this.resizable = false;
		this.border_width = 10;

		// Set window icon
		try {
			this.icon = IconTheme.get_default ().load_icon ("preferences-desktop-theme", 48, 0);
		} catch (Error e) {
			stderr.printf ("Could not load application icon: %s\n", e.message);
		}

		// GMenu
		var about_action = new SimpleAction ("about", null);
		about_action.activate.connect (this.show_about);
		this.add_action (about_action);

		// Methods
		create_widgets ();
		connect_signals ();
	}

	void show_about (SimpleAction simple, Variant? parameter) {
		string license = "This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.\n\nThis program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.\n\nYou should have received a copy of the GNU General Public License along with This program; if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA";

		Gtk.show_about_dialog (this,
			"program-name", ("Minty Colors"),
			"copyright", ("Copyright \xc2\xa9 2012 Satyajit Sahoo"),
			"comments", ("A chameleon theme for Cinnamon"),
			"license", license,
			"wrap-license", true,
			"website", "http://satya164.deviantart.com/art/Cinnamon-Minty-Colors-304552689",
			"website-label", ("Minty Colors on deviantArt"),
			null);
	}

	private void set_defaults () {

		// Set default config
		apply_button.set_sensitive (false);
		background_switch.set_active (true);
		arrow_switch.set_active (true);
		light_switch.set_active (false);
		match_wallpaper.set_active (true);
		match_theme.set_active (false);
		custom_color.set_active (false);
		font_size.adjustment.value = 9;
		panel_opacity.adjustment.value = 0.8;
		menu_opacity.adjustment.value = 0.8;
		color_value = "#77b93d";
	}

	private void set_config () {

		set_defaults();

		// Set the path of config file
		config_dir = File.new_for_path (Environment.get_user_config_dir ());
		config_file = config_dir.get_child ("minty-colors.ini");

		// Read the config file
		if (config_file.query_exists ()) {
			try {
				var dis = new DataInputStream (config_file.read ());
				string line;
				while ((line = dis.read_line (null)) != null) {
					if ("font" in line) {
						font_size.adjustment.value = double.parse(line.substring (5, line.length-5));
  					}
					if ("panel" in line) {
						panel_opacity.adjustment.value = double.parse(line.substring (6, line.length-6));
  					}
					if ("menu" in line) {
						menu_opacity.adjustment.value = double.parse(line.substring (5, line.length-5));
  					}
					if (line == "background=on") {
						background_switch.set_active (true);
					}
					if (line == "arrow=on") {
						arrow_switch.set_active (true);
					}
					if (line == "light=on") {
						light_switch.set_active (true);
					}
					if (line == "mode=wallpaper") {
						match_wallpaper.set_active (true);
						match_theme.set_active (false);
						custom_color.set_active (false);
					} else if (line == "mode=gtk") {
						match_theme.set_active (true);
						match_wallpaper.set_active (false);
						custom_color.set_active (false);
					} else if ("mode=#" in line) {
						color_value = line.substring (5, line.length-5);
						custom_color.set_active (true);
						match_theme.set_active (false);
						match_wallpaper.set_active (false);
					}
				}
			} catch (Error e) {
				stderr.printf ("%s", e.message);
			}
		}

		color = Gdk.RGBA ();
		color.parse ("%s".printf (color_value.to_string()));
		color_button.set_rgba (color);
	}

	private void create_widgets () {

		// Create and setup widgets
		separator1 = new Separator (Gtk.Orientation.HORIZONTAL);
		separator2 = new Separator (Gtk.Orientation.HORIZONTAL);

		heading1 = new Label.with_mnemonic ("<b>Settings</b>");
		heading1.set_use_markup (true);
		heading1.set_halign (Gtk.Align.START);
		heading2 = new Label.with_mnemonic ("<b>Colors</b>");
		heading2.set_use_markup (true);
		heading2.set_halign (Gtk.Align.START);

		description = new Label.with_mnemonic ("Customize various settings for Minty Colors Gnome Shell theme.");
		description.set_halign (Gtk.Align.START);

		background_label = new Label.with_mnemonic ("Background process");
		background_label.set_halign (Gtk.Align.START);
		arrow_label = new Label.with_mnemonic ("Arrow in menu");
		arrow_label.set_halign (Gtk.Align.START);
		light_label = new Label.with_mnemonic ("Light menu style");
		light_label.set_halign (Gtk.Align.START);
		font_label = new Label.with_mnemonic ("Font size");
		font_label.set_halign (Gtk.Align.START);
		panel_label = new Label.with_mnemonic ("Panel opacity");
		panel_label.set_halign (Gtk.Align.START);
		menu_label = new Label.with_mnemonic ("Menu opacity");
		menu_label.set_halign (Gtk.Align.START);

		font_size = new SpinButton.with_range (6, 72, 1);
		panel_opacity = new SpinButton.with_range (0.1, 1.0, 0.1);
		menu_opacity = new SpinButton.with_range (0.1, 1.0, 0.1);

		background_switch = new Switch ();
		background_switch.set_halign (Gtk.Align.END);
		arrow_switch = new Switch ();
		arrow_switch.set_halign (Gtk.Align.END);
		light_switch = new Switch ();
		light_switch.set_halign (Gtk.Align.END);

		match_wallpaper = new RadioButton (null);
		match_wallpaper.set_label ("Match wallpaper color");
		match_theme = new RadioButton.with_label (match_wallpaper.get_group(),"Match GTK theme color");
		custom_color = new RadioButton.with_label (match_theme.get_group(),"Use custom color");

		color_button = new ColorButton ();

		apply_button = new Button.from_stock (Stock.APPLY);
		reset_button = new Button.from_stock(Stock.REVERT_TO_SAVED);
		close_button = new Button.from_stock (Stock.CLOSE);

		// Layout widgets
		var grid = new Grid ();
		grid.set_column_homogeneous (true);
		grid.set_column_spacing (10);
		grid.set_row_spacing (10);
		grid.set_border_width (10);
		grid.attach (heading1, 0, 0, 1, 1);
		grid.attach_next_to (separator1, heading1, Gtk.PositionType.RIGHT, 2, 1);
		grid.attach (description, 0, 1, 3, 1);
		grid.attach (background_label, 0, 2, 2, 1);
		grid.attach_next_to (background_switch, background_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (arrow_label, 0, 3, 2, 1);
		grid.attach_next_to (arrow_switch, arrow_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (light_label, 0, 4, 2, 1);
		grid.attach_next_to (light_switch, light_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (font_label, 0, 5, 2, 1);
		grid.attach_next_to (font_size, font_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (panel_label, 0, 6, 2, 1);
		grid.attach_next_to (panel_opacity, panel_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (menu_label, 0, 7, 2, 1);
		grid.attach_next_to (menu_opacity, menu_label, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (heading2, 0, 8, 1, 1);
		grid.attach_next_to (separator2, heading2, Gtk.PositionType.RIGHT, 2, 1);
		grid.attach (match_wallpaper, 0, 9, 2, 1);
		grid.attach (match_theme, 0, 10, 2, 1);
		grid.attach (custom_color, 0, 11, 2, 1);
		grid.attach_next_to (color_button, custom_color, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach (apply_button, 0, 12, 1, 1);
		grid.attach_next_to (reset_button, apply_button, Gtk.PositionType.RIGHT, 1, 1);
		grid.attach_next_to (close_button, reset_button, Gtk.PositionType.RIGHT, 1, 1);

		this.add (grid);

		set_config ();
	}

	private void connect_signals () {
		font_size.adjustment.value_changed.connect (() => {
			apply_button.set_sensitive (true);
		});
		panel_opacity.adjustment.value_changed.connect (() => {
			apply_button.set_sensitive (true);
		});
		menu_opacity.adjustment.value_changed.connect (() => {
			apply_button.set_sensitive (true);
		});
		background_switch.notify["active"].connect (() => {
			apply_button.set_sensitive (true);
		});
		arrow_switch.notify["active"].connect (() => {
			apply_button.set_sensitive (true);
		});
		light_switch.notify["active"].connect (() => {
			apply_button.set_sensitive (true);
		});
		match_wallpaper.toggled.connect (() => {
			apply_button.set_sensitive (true);
		});
		match_theme.toggled.connect (() => {
			apply_button.set_sensitive (true);
		});
		custom_color.toggled.connect (() => {
			apply_button.set_sensitive (true);
		});
		color_button.color_set.connect (() => {
			on_selected_color_set ();
			custom_color.set_active (true);
			apply_button.set_sensitive (true);
		});
		apply_button.clicked.connect (() => {
			write_config ();
			apply_button.set_sensitive (false);
			reset_button.set_sensitive (true);
		});
		reset_button.clicked.connect (() => {
			set_defaults ();
			write_config ();
			reset_button.set_sensitive (false);
		});
		close_button.clicked.connect (() => {
			destroy ();
		});
	}

	private void on_selected_color_set () {
		color =  color_button.get_rgba ();

		color_value = "%s".printf (color.to_string());
	}

	private void write_config () {
		font = "font=%g".printf(font_size.adjustment.value);
		panel = "panel=%g".printf(panel_opacity.adjustment.value);
		menu = "menu=%g".printf(menu_opacity.adjustment.value);
		if (background_switch.get_active()) {
			background = "background=on";
		} else {
			background = "background=off";
		}
		if (arrow_switch.get_active()) {
			arrow = "arrow=on";
		} else {
			arrow = "arrow=off";
		}
		if (light_switch.get_active()) {
			light = "light=on";
		} else {
			light = "light=off";
		}
		if (match_wallpaper.get_active()) {
			mode = "mode=wallpaper";
		} else if (match_theme.get_active()) {
			mode = "mode=gtk";
		} else if (custom_color.get_active()) {
			mode = "mode=%s".printf(color_value);
		} else {
			mode = "mode=wallpaper";
		}
		if (config_file.query_exists ()) {
			try {
				config_file.delete ();
			} catch (Error e) {
				stderr.printf ("%s", e.message);
			}
		}
		try {
			var dos = new DataOutputStream (config_file.create (FileCreateFlags.REPLACE_DESTINATION));
			dos.put_string ("[minty-colors]\n");
			string text = "%s\n%s\n%s\n%s\n%s\n%s\n%s".printf(font, panel, menu, background, arrow, light, mode);
			uint8[] data = text.data;
			long written = 0;
			while (written < data.length) {
				written += dos.write (data[written:data.length]);
			}
		} catch (Error e) {
			stderr.printf ("%s", e.message);
		}
		try {
			Process.spawn_command_line_sync("notify-send -h int:transient:1 -i \"preferences-desktop-theme\" \"Changes will be applied shortly\"");
		} catch (Error e) {
			stderr.printf ("%s", e.message);
		}
	}
}

class MintyColorsApp : Gtk.Application {
	internal MintyColorsApp () {
		Object (application_id: "org.minty.colors");
	}

	protected override void activate () {
		var window = new MintyColorsWindow (this);
		window.show_all ();
	}

	protected override void startup () {
		base.startup ();

		var menu = new GLib.Menu ();
		menu.append ("About", "win.about");
		this.app_menu = menu;
	}
}

int main (string[] args) {
	return new MintyColorsApp ().run (args);
}
