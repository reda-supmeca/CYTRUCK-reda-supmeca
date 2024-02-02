CC = gcc
CFLAGS = -Wall -Wextra -std=c99
TARGET = my_program
SRC_DIR = src
OBJ_DIR = obj


SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))


all: $(TARGET)

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $^


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

cean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
