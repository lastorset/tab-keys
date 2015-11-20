# vim:set noexpandtab:
SIZES=16 48 128

icons: $(foreach size, $(SIZES), images/icons/rasterized/clone-tab-$(size).png)

images/icons/rasterized/clone-tab-%.png: images/icons/clone-tab.svg
	inkscape --without-gui --export-width=$* --export-png=$@ $<
	convert $@ -gravity center -compose src -extent $*x$* $@
