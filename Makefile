BUILD=teekesselchen-mwrd.lrplugin
DIST=dist

$(BUILD):
	@mkdir $(BUILD)

.PHONY: build distribution

clean:
	rm -rf $(BUILD)
	rm -rf $(DIST)

build: $(shell find src -type f) $(BUILD)
	cp -a src/* $(BUILD)
	cp -a 3rd/exiftool/* $(BUILD) 2>/dev/null || echo "(exiftool not found, skipping)"

$(DIST):
	@mkdir $(DIST)

distribution: build $(DIST)
	zip -q -r $(DIST)/teekesselchen-mwrd.zip $(BUILD)/*
	@shasum -a 256 $(DIST)/teekesselchen-mwrd.zip | head -c 64 > $(DIST)/teekesselchen-mwrd.zip.sha256
