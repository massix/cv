TYPST := $(shell which typst)
UNZIP := $(shell which unzip)
CURL  := $(shell which curl)
TAR   := $(shell which tar)
SED   := $(shell which sed)

FA_URL = "https://use.fontawesome.com/releases/v6.5.2/fontawesome-free-6.5.2-desktop.zip"
SS_URL = "https://github.com/adobe-fonts/source-sans/releases/download/3.052R/OTF-source-sans-3.052R.zip"
RO_URL = "https://github.com/googlefonts/roboto/releases/download/v2.138/roboto-android.zip"

FONTS_DIR    = fonts
DOWNLOAD_DIR = downloads

ALL_FONTS = \
	$(FONTS_DIR)/fontawesome \
	$(FONTS_DIR)/source-sans-3 \
	$(FONTS_DIR)/roboto

OUT      = cv.pdf
MAIN     = main.typ
REPLACED = main-repl.typ

ifneq ($(wildcard .env.makefile),)
	include .env.makefile
endif

GH_SECRET_EMAIL    ?= example@example.com
GH_SECRET_PHONE    ?= +1 (800) 555-0175
GH_SECRET_ADDRESS  ?= 1, rue de Paris, 06600 Nice (FR)
GH_SECRET_LINKEDIN ?= linkedin-user-12345

.PHONY: clean

all: .check $(OUT)

.check:
	[ "x$(TYPST)" != "x" ] || exit 1
	[ "x$(UNZIP)" != "x" ] || exit 1
	[ "x$(CURL)" != "x" ] || exit 1
	[ "x$(TAR)" != "x" ] || exit 1
	[ "x$(SED)" != "x" ] || exit 1
	[ -d "$(DOWNLOAD_DIR)" ] || mkdir -p "$(DOWNLOAD_DIR)"
	[ -d "$(FONTS_DIR)" ] || mkdir -p "$(FONTS_DIR)"
	touch $@

$(DOWNLOAD_DIR)/roboto.zip:
	$(CURL) -sL $(RO_URL) -o $@

$(DOWNLOAD_DIR)/source-sans-3.zip:
	$(CURL) -sL $(SS_URL) -o $@

$(DOWNLOAD_DIR)/fontawesome.zip:
	$(CURL) -sL $(FA_URL) -o $@

$(FONTS_DIR)/roboto: $(DOWNLOAD_DIR)/roboto.zip
	$(UNZIP) -n -d $(FONTS_DIR) $^ >/dev/null
	@rm $(FONTS_DIR)/LICENSE
	@rm -fr $(FONTS_DIR)/__MACOSX
	mkdir -p $@
	mv $(FONTS_DIR)/*.ttf $@
	@touch $@

$(FONTS_DIR)/source-sans-3: $(DOWNLOAD_DIR)/source-sans-3.zip
	$(UNZIP) -n -d $(FONTS_DIR)/ $^ >/dev/null
	@rm -fr $(FONTS_DIR)/__MACOSX
	mv $(FONTS_DIR)/OTF $@
	@touch $@

$(FONTS_DIR)/fontawesome: $(DOWNLOAD_DIR)/fontawesome.zip
	$(UNZIP) -n -d $(FONTS_DIR)/ $^ >/dev/null
	mv $(FONTS_DIR)/fontawesome-free-6.5.2-desktop $@
	@touch $@

$(REPLACED): $(MAIN)
	@echo "Replacing sensitive values"
	@sed 's/@GH_SECRET_ADDRESS@/$(GH_SECRET_ADDRESS)/g' $< > $@
	@sed -i 's/@GH_SECRET_PHONE@/$(GH_SECRET_PHONE)/g' $@
	@sed -i 's/@GH_SECRET_EMAIL@/$(GH_SECRET_EMAIL)/g' $@
	@sed -i 's/@GH_SECRET_LINKEDIN@/${GH_SECRET_LINKEDIN}/g' $@

$(OUT): $(ALL_FONTS) $(REPLACED)
	$(TYPST) compile --font-path $(FONTS_DIR)/ $(REPLACED) $(OUT)

dist: $(ALL_FONTS) $(MAIN)
	[ "x$(TAR)" != "x" ] || exit 1
	mkdir -p $@
	mkdir -p $@/fonts
	cp LICENSE $@
	cp -r $(MAIN) $@
	cp -r $(ALL_FONTS) $@/fonts
	$(TAR) czf cv.tgz $@

clean:
	rm -f .check
	rm -f $(OUT)
	rm -f $(REPLACED)
	rm -fr $(FONTS_DIR)/*
	rm -fr $(DOWNLOAD_DIR)/*
	rm -fr dist
	rm -f cv.tgz
