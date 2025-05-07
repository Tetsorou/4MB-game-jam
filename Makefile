POTETRE2D_PATH = exes
GAME_SRC_PATH = src
GAME_MAIN = game.wren
#				
GAME_FILES =   $(GAME_SRC_PATH)/dude.wren \
				$(GAME_SRC_PATH)/game.wren      \
			$(GAME_SRC_PATH)/player_input.wren \
			 $(GAME_SRC_PATH)/floor.wren 

ASSETS = $(GAME_SRC_PATH)/sprites/*

# Check OS assume unix like
OS = $(shell uname -s)
ifeq ($(OS), Darwin)
	POTETRE2D_EXE += $(POTETRE2D_PATH)/potetre2d.macho
else
	POTETRE2D_EXE += $(POTETRE2D_PATH)/potetre2d.elf
endif
POTETRE2D_EXE_FULL_PATH = $(shell pwd)/$(POTETRE2D_EXE)

# Get compression tool
# tool/data_compress.*
COMPRESSION_TOOL = $(shell find $(POTETRE2D_PATH)/tools/ -name "data_compress*")
ifeq ($(COMPRESSION_TOOL), )
$(info [WARNING] Compression tool not found! (make tools))
else
$(info [INFO] Compression tool found: $(COMPRESSION_TOOL))
endif

all: package

amalgamate:
	@echo " ** Amalgamating..."
	@mkdir -p build
	cat $(GAME_FILES) > build/$(GAME_MAIN)
	@echo " == Done! =="
	@echo " ** Result: build/$(GAME_MAIN) **"

package: clean amalgamate
	@echo " ** Building package..."
	@mkdir -p build
	@echo " ** Copying potetre2d"
	@cp $(POTETRE2D_EXE) build
	@echo " ** Copying assets..."
	@cp -r $(ASSETS) build/
	@echo " ** Stripping..."
	@echo "got here"
	@$(POTETRE2D_EXE_FULL_PATH) tools/compact.wren build/$(GAME_MAIN) small_$(GAME_MAIN)
	@echo " ** Compressing game..."_$(GAME_MAIN) build/_game.wren
	
	@$(RM) build/$(GAME_MAIN)
	@mv small_$(GAME_MAIN) build/
	@echo -n " ** Size of the game before zipping (real size): "
	@du -h build/ | cut -f1
	@echo " ** Zipping..."
	@cd build;zip -r game.zip . > /dev/null
	@echo " ** Result: build/game.zip"
	@echo -n " ** Zip size: "
	@du -h build/game.zip | cut -f1
run: clean amalgamate
	cp -r $(ASSETS) build/
	cd build;$(POTETRE2D_EXE_FULL_PATH) game.wren
correr: clean amalgamate
	cp -r $(ASSETS) build/
	cd build;$(shell pwd)/$(POTETRE2D_PATH)/potetre2d.exe game.wren
clean:
	$(RM) -rf build

.PHONY: all release run
