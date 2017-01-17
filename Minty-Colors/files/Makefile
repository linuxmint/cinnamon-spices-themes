CC=valac
CFLAGS=--pkg gtk+-3.0
INSTALL=install
INSTALL_PROGRAM=$(INSTALL) -Dpm 0755
INSTALL_DATA=$(INSTALL) -Dpm 0644
INSTALL_DIRECTORY=$(INSTALL) -dpm 0644

all: minty-colors-gui

minty-colors-gui: minty-colors-gui.vala
	$(CC) $(CFLAGS) minty-colors-gui.vala -o minty-colors-gui

clean:
	rm -f minty-colors-gui

install: minty-colors-gui
	$(INSTALL_PROGRAM) minty-colors $(DESTDIR)/usr/bin/minty-colors
	$(INSTALL_PROGRAM) minty-colors-gui $(DESTDIR)/usr/bin/minty-colors-gui
	$(INSTALL_PROGRAM) minty-colors-process $(DESTDIR)/usr/bin/minty-colors-process
	$(INSTALL_DATA) minty-colors.desktop $(DESTDIR)/usr/share/applications/minty-colors.desktop
	$(INSTALL_DATA) minty-colors.ini $(DESTDIR)/usr/share/minty-colors/minty-colors.ini
	$(INSTALL_DATA) README $(DESTDIR)/usr/share/minty-colors/README
	$(INSTALL_DATA) minty-colors-process.desktop $(DESTDIR)/etc/xdg/autostart/minty-colors-process.desktop
	$(INSTALL) -dm755 $(DESTDIR)/usr/share/minty-colors/cinnamon
	$(INSTALL_DATA) cinnamon/* $(DESTDIR)/usr/share/minty-colors/cinnamon

uninstall:
	rm -f $(DESTDIR)/usr/bin/minty-colors*
	rm -f $(DESTDIR)/usr/share/applications/minty-colors*
	rm -f $(DESTDIR)/etc/xdg/autostart/minty-colors*
	rm -rf $(DESTDIR)/usr/share/minty-colors/
