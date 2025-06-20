NAME ?= UNTITLED
VERSION ?= 0.0.0

FENNEL_PATH ?= ./bin/fennel

LUA_FILES := $(shell find * -not \( -path "build" -prune \) -not \( -path "dist" -prune \) -not \( -path "main.lua" -o -path "lib/fennel.lua" \) -type f -name "*.lua")
FNL_FILES := $(shell find * -not \( -path "build" -prune \) -not \( -path "dist" -prune \) -type f -name "*.fnl")

BUILD_FNL_FILES := $(patsubst %.fnl, build/%.lua, $(FNL_FILES))
BUILD_LUA_FILES := $(patsubst %.lua, build/%.lua, $(LUA_FILES))

ASSETS := $(shell find assets/* -type f)
BUILD_ASSETS := $(patsubst assets/%, build/assets/%, $(ASSETS))

DIST_LOVE ?= dist/$(NAME)-$(VERSION).love

# make a .love executable
love: $(BUILD_FNL_FILES) $(BUILD_LUA_FILES) $(BUILD_ASSETS) | dist/
	cd build && zip -r  ../$(DIST_LOVE) *

# compile a .lua file from a .fnl source
$(BUILD_FNL_FILES): build/%.lua: %.fnl $(FENNEL_PATH) | build/
	@mkdir -p $(dir $@)
	$(FENNEL_PATH) --compile $< > $@

# copy a .lua file into the build/ directory
$(BUILD_LUA_FILES): build/%.lua: %.lua | build/
	cp --parents $< build/

# copy an asset into the build/ directory
$(BUILD_ASSETS): build/assets/%: assets/% | build/
	cp --parents $< build/

# make build/ directory
build/:
	mkdir build/

# make dist/ directory
dist/:
	mkdir dist/

clean:
	@if [ -d build/ ]; then rm -r build/; fi
	@if [ -d dist/ ]; then rm -r dist/; fi
