TYPST := $(shell which typst)
UNZIP := $(shell which unzip)
CURL := $(shell which curl)
TAR := $(shell which tar)
SED := $(shell which sed)

FA_URL = "https://use.fontawesome.com/releases/v6.5.2/fontawesome-free-6.5.2-desktop.zip"
SS_URL = "https://github.com/adobe-fonts/source-sans/releases/download/3.052R/OTF-source-sans-3.052R.zip"
RO_URL = "https://github.com/googlefonts/roboto/releases/download/v2.138/roboto-android.zip"

DOWNLOAD_DIR = fonts/dl
ALL_FONTS = fonts/fontawesome fonts/roboto fonts/source-sans-3

OUT = cv.pdf
MAIN = main.typ
REPLACED = main-repl.typ

ifneq ($(wildcard .env.makefile),)
	include .env.makefile
endif

GH_SECRET_EMAIL ?= example@example.com
GH_SECRET_PHONE ?= +1 (800) 555-0175
GH_SECRET_ADDRESS ?= 1, rue de Paris, 06600 Nice (FR)
GH_SECRET_LINKEDIN ?= linkedin-user-12345

.PHONY: clean check

all: check $(OUT)

check:
	[ "x$(TYPST)" != "x" ] || exit 1
	[ "x$(UNZIP)" != "x" ] || exit 1
	[ "x$(CURL)" != "x" ] || exit 1
	[ "x$(TAR)" != "x" ] || exit 1
	[ "x$(SED)" != "x" ] || exit 1

$(DOWNLOAD_DIR):
	mkdir -p $(DOWNLOAD_DIR)

$(DOWNLOAD_DIR)/roboto.zip: $(DOWNLOAD_DIR)
	$(CURL) -sL $(RO_URL) -o $@

$(DOWNLOAD_DIR)/source-sans-3.zip: $(DOWNLOAD_DIR)
	$(CURL) -sL $(SS_URL) -o $@

$(DOWNLOAD_DIR)/fontawesome.zip: $(DOWNLOAD_DIR)
	$(CURL) -sL $(FA_URL) -o $@

fonts/roboto: $(DOWNLOAD_DIR)/roboto.zip
	$(UNZIP) -o -d fonts/ $^ >/dev/null
	mkdir -p $@
	rm fonts/LICENSE
	rm -fr fonts/__MACOSX
	mv fonts/*.ttf $@

fonts/source-sans-3: $(DOWNLOAD_DIR)/source-sans-3.zip
	$(UNZIP) -o -d fonts/ $^ >/dev/null
	rm -fr fonts/__MACOSX
	mv fonts/OTF $@

fonts/fontawesome: $(DOWNLOAD_DIR)/fontawesome.zip
	$(UNZIP) -o -d fonts/ $^ >/dev/null
	mv fonts/fontawesome-free-6.5.2-desktop $@

$(REPLACED): $(MAIN)
	@echo "Replacing sensitive values"
	@sed 's/@GH_SECRET_ADDRESS@/$(GH_SECRET_ADDRESS)/g' $(MAIN) > $(REPLACED)
	@sed -i 's/@GH_SECRET_PHONE@/$(GH_SECRET_PHONE)/g' $(REPLACED)
	@sed -i 's/@GH_SECRET_EMAIL@/$(GH_SECRET_EMAIL)/g' $(REPLACED)
	@sed -i 's/@GH_SECRET_LINKEDIN@/${GH_SECRET_LINKEDIN}/g' $(REPLACED)

$(OUT): $(ALL_FONTS) $(REPLACED)
	$(TYPST) compile --font-path fonts/ $(REPLACED) $(OUT)

dist: $(ALL_FONTS) $(MAIN)
	[ "x$(TAR)" != "x" ] || exit 1
	mkdir -p $@
	mkdir -p $@/fonts
	cp LICENSE $@
	cp -r $(MAIN) $@
	cp -r $(ALL_FONTS) $@/fonts
	$(TAR) czf cv.tgz $@

clean:
	rm -f $(OUT)
	rm -f $(REPLACED)
	rm -fr fonts/*
	rm -fr dist
	rm -f cv.tgz
