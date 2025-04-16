# Install AlphaDepot

install-core:
	install -dm755 $(DESTDIR)/usr/bin/
	install -dm755 $(DESTDIR)/usr/share/alphadepot/

	for f in *; do [[ $$f != "plugins" ]] && cp -pr $$f $(DESTDIR)/usr/share/alphadepot/; done

	install -Dpm 0755 alphadepot.exec $(DESTDIR)/usr/bin/alphadepot

	install -Dpm 0644 alphadepot.desktop $(DESTDIR)/usr/share/applications/org.folkswithhats.alphadepot.desktop
	install -Dpm 0644 alphadepot.appdata.xml $(DESTDIR)/usr/share/metainfo/alphadepot.appdata.xml

	install -Dpm 0644 alphadepot.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/alphadepot.svg
	install -Dpm 0644 alphadepot-symbolic.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/alphadepot-symbolic.svg

	install -Dpm 0644 run-as-root.policy $(DESTDIR)/usr/share/polkit-1/actions/org.folkswithhats.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi


install-plugins:
	install -dm755 $(DESTDIR)/usr/share/alphadepot/plugins

	cp -pr plugins/* $(DESTDIR)/usr/share/alphadepot/plugins/


install: install-core install-plugins


uninstall:
	rm -rf $(DESTDIR)/usr/share/alphadepot/

	rm -f $(DESTDIR)/usr/bin/alphadepot

	rm -f $(DESTDIR)/usr/share/applications/org.folkswithhats.alphadepot.desktop
	rm -f $(DESTDIR)/usr/share/metainfo/alphadepot.appdata.xml

	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/alphadepot.svg
	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/alphadepot-symbolic.svg

	rm -f $(DESTDIR)/usr/share/polkit-1/actions/org.folkswithhats.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi
