###################### simple #######################################
# cc = gcc
# OBJ= main.o hello.o
# rt_PATH= "~/make_test"
# test: $(OBJ)
# #recipe line
# 	$(cc) -o test $(OBJ)
# 	@echo "test generated sucess"
# main.o:main.c hello.h
# 	$(cc) -c main.c
# hello.o:hello.c hello.h 
# 	$(cc) -c hello.c
# clean:
# 	@echo "$(rt_PATH)"
# 	rm -f test $(OBJ)
# 	@echo "done"

######################### Omit the same named ###########################
# cc =gcc
# OBJ =main.o hello.o
# test: $(OBJ)
# 	cc -o test $(OBJ)
# main.o:hello.h
# hello.o:hello.h
# clean:
# 	rm -f test $(OBJ)
########################### another style ################################
# cc =gcc
# OBJ =main.o hello.o
# test: $(OBJ)
# 	cc -o test $(OBJ)
# $(OBJ):hello.h
# .PHONY:clean
# clean:
# 	-rm -f test $(OBJ)
############################ print all .o object ############################
# include lib.mk
# cc =gcc
# src_path := $(shell pwd) $(SIR)
# SIR_C=$(foreach dir, $(src_path), $(wildcard $(dir)/*.c))
# SRCS_BASE := $(notdir $(SIR_C))
# SIR_H=$(foreach dir, $(src_path), $(wildcard $(dir)/*.h))
# SIRH:=$(notdir $(SIR_H))
# OBJS = $(SRCS_BASE:.c=.o)
# all:
# 	test:$(OBJS) $(SIRH)
############################### mod rules ##########################################
# include lib.mk
# CC = gcc
# src_path := $(shell pwd) $(SIR)
# SRC_FILES = $(foreach dir, $(src_path), $(wildcard $(dir)/*.c))
# OBJS = $(patsubst %.c,%.o,$(SRC_FILES))
# TARGET = app
# all: $(TARGET)
# %.o: %.c $(SIRH)
# 	$(CC) -c $(CFLAGS) $< -o $@
# $(TARGET): $(OBJS)
# 	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(LDLIBS)
# clean:
# 	rm -f $(OBJS) $(TARGET)
################################ Automatically derive dependencies ########################
# include lib.mk
# CC = gcc
# src_path := $(shell pwd) $(SIR)
# SRC_FILES = $(foreach dir, $(src_path), $(wildcard $(dir)/*.c))
# OBJS = $(patsubst %.c,%.o,$(SRC_FILES))
# TARGET = app
# all: $(TARGET)
# %.o: %.c $(SIRH)
# 	$(CC) -c $(CFLAGS) $< -o $@
# $(TARGET): $(OBJS)
# 	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(LDLIBS)
# clean:
# 	rm -f $(OBJS) $(TARGET)
###################################### echo ##############################################
# run:
# 	@echo "run code ing"
# 	echo "run xxxx"
###################################### code run ##########################################
# run:
# 	cd ~
# 	pwd
# run2:
# 	cd ~;pwd
# ####################################### code e ###########################################
# run:
# 	rm cc
# 	rm test
# run2:
# 	-rm cc
# 	-rm test
########################################### make ##########################################
# MAKE= make -j8
# subsystem:
# 	cd say_you && $(MAKE)
# subsystem2:
# 	$(MAKE) -C say_you
# clean:
# 	-cd say_you && rm SayYou.o
########################################### define ########################################
MAKE= make -j8
define say
cd say_you;
$(MAKE)
endef
subsystem:
	$(say)