.PHONY: clean
PRO_DIR := .
OUTPUT := $(PRO_DIR)/build
HEADER_DIR := $(PRO_DIR)/header
SRC_DIR := $(PRO_DIR)/src
OBJ_DIR := $(PRO_DIR)/obj

SRC_FILES := $(foreach SRC_DIR, $(SRC_DIR), $(wildcard $(SRC_DIR)/*.c))
HEADER_FILES := $(foreach HEADER_DIR, $(HEADER_DIR), $(wildcard $(HEADER_DIR)/*.h))

OBJ_FILES := $(notdir $(SRC_FILES))

OBJ_FILES := $(subst .c,.o, $(OBJ_FILES))
PATH_OBJ := $(foreach OBJ_FILES, $(OBJ_FILES), $(OBJ_DIR)/$(OBJ_FILES))

vpath %.c $(SRC_DIR)
vpath %.h $(HEADER_DIR)

run: $(OBJ_FILES)
	gcc $(PATH_OBJ) -o $(OUTPUT)/run

%.o: %.c $(HEADER_FILES) $(SRC_FILES)
	gcc -I$(HEADER_DIR) -c $< -o $(OBJ_DIR)/$@

clean:
	rm -rf $(OBJ_DIR)/*.o
	rm -rf $(OUTPUT)/run

print:
	echo $(OBJ_FILES)