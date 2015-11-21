# vim:set noexpandtab:
SIZES=16 48 64 128

icons: $(foreach size, $(SIZES), images/icons/rasterized/clone-tab-$(size).png)

images/icons/rasterized:
	mkdir $@

images/icons/rasterized/clone-tab-%.png: images/icons/clone-tab.svg | images/icons/rasterized
	inkscape --without-gui --export-width=$* --export-png=$@ $<
	convert $@ -gravity center -compose src -extent $*x$* $@

clean:
	rm $(foreach size, $(SIZES), images/icons/rasterized/clone-tab-$(size).png)
	rmdir images/icons/rasterized
