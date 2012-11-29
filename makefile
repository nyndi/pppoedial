# @file makefile
# @brief �๦��ͨ��Makefile���������ɶ�̬�⡢��̬�⡢��ִ���ļ�������ͷ�ļ�
# @author LJA
# @version 0.0.1
# @date 2012-11-11

##########################################################
#                    �������õı���                      
#
# ��Щ��������Ϊ�գ�����Makeʱ�޷���������
#
##########################################################
#���붯����
#  ar: ���뾲̬��  so: ���붯̬��  app: �����ִ���ļ�
#  ֻ��ָ��һ��������ar so appֻ��ѡ��һ��
ACTION = app

#Ŀ�����ƣ����յõ�Ŀ������ƣ���:
# ��̬�����ָ������Ϊ: libXXX.a
# ��̬�����ָ������Ϊ: libXXX.so
# ��ִ���ļ�����ָ������Ϊ: main.exe
TARGET = pppoerandom.exe

#������ 
CC = gcc 

#������
LD = ld

#�鵵,��̬��
AR = ar

#Դ�����ļ���׺������ָ�������׺
#    ע��: Ŀǰ������ݺ�׺�Ĳ�ͬ�����ò�ͬ�ı���
#    SUFFIX��������ȥ��
#    ָ���뵱ǰĿ¼��.SUFFIX�ļ�
#    SUFFIX��ֵ���ܹ�ʹd��o����Ϊ�м����ɵĻ�ʹ����������׺
# ��:c
SUFFIX = c
##########################################################
#                    ��ѡ�ı���
#
# ��Щ��������ʵ�ʵ�����������ã����Ϊ�գ�ʹ��Ĭ��ֵ
#
##########################################################
#����Ŀ�걻���Ƶ�ָ�����õ�·��������ָ�����·��
#��ǰĿ¼�»�һֱ����һ��Ŀ���ļ�
#��:TARGET_DIR1 TARGET_DIR2
TARGET_DIR = 

#ͷ�ļ�����
#��$(EXPORT_HEAD)��ָ����ͷ�ļ����Ƶ�$(EXPORT_HEAD)Ŀ¼��
#    ���$(EXPORT_HEAD)��Ϊ�գ�$(EXPORT_HEAD_DIR)Ϊ�գ���ʾerror
#    ���$(EXPORT_HEAD)Ϊ�գ�$(EXPORT_HEAD_DIR)Ϊ�գ���������
#    ���$(EXPORT HEAD_DIR)���ж��Ŀ¼��ͷ�ļ������Ƶ����е�ÿһ��Ŀ¼��
#    EXPORT_HEAD��EXPORT_HEAD_DIR��������ȥ��
EXPORT_HEAD = 
EXPORT_HEAD_DIR =

#����ѡ��
CFLAGS = 

#��$(CC)��ʹ�õ�����ѡ��
#    ��ǰ�����ӹ���ʹ�õ���$(CC),��$(CC)���е�����������������
#    һ������£������Ѿ��㹻��
#    �Ժ��������Ҫ���ĳ�ֱ��ʹ��$(LD)�������ӵķ�ʽ
LDFLAGS =

#�м��ļ����·����Ĭ��Ϊ��ǰ·����ֻ��ָ��һ��·��
#��:obj
OBJ_DIR = obj

#ͷ�ļ�·��������ָ�����·������ǰ·��ʼ�հ�������
#��: ../include
HEAD_DIR =  ../ljac/include/

#���ӿ�·��
#��: ../lib 
LIB_DIR = ../ljac/lib/
#��̬���ӿ�,
#��m
DY_LIB = 
#��̬���ӿ�,
#��:cunit
ST_LIB = ljac

#��������ִ��Make����Ŀ¼
#    ���ָ������Ŀ¼�����Ȱ���ָ����˳����Ŀ¼��ִ��make
#    ����ָ�����Ŀ¼�����Ŀ¼�ظ����֣���ôÿ����һ�ξͻ����ִ��һ��
#    Ϊ�˷�ֹ���޵�ѭ��Make������ֻ������ǰ·����Ŀ¼,ֻ����������ʽ��Ŀ¼
#        aaa ���� aaa/
#
#    ��ǰĿ¼��Ŀ��ı�������Ŀ¼�е�Make��ɺ����
#    ��ǰMakefile�еı������ᴫ�ݵ���Makefile��
#
#    ��Ȼ��Ҫ��ÿ����Ŀ¼������Makefilek�������ƺ���Щ�鷳
#    ������Ϊ�������б�Ҫ�ģ��������ǿ����ƿ�ÿ��Make����Ϊ
SUB_MAKE_DIR = 

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#     ʵ�ֲ��֣�
#
#     ����֪��������ʲô������Ҫ�޸Ľ�����������һ���ַ�!
#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

##########################################################
#                   �Զ��庯��
#
# ͨ��shell��� 
#
##########################################################
#���Ŀ¼�Ƿ���ڣ�������ڷ��ؿգ����򷵻ز�Ϊ��
define check_dir
$(shell if [ -d $1 ];then echo;else echo 1;fi)
endef

#���$1�е�ֵ$2��ָ���Ŀ¼�Ƿ���ڣ�������ڷ��أ�������ʾȻ�������˳�
# ��:
# $(call check_dir2,DIR,xxx) 
# ���xxx(xxx�Ǳ���DIRֵ�е�һ����)Ŀ¼�Ƿ���ڣ���������ڣ���ʾ:
#   DIR's value (xxx) does not exist!
define check_dir2
$(if $(call check_dir,$2),$(error "$1's value ($2) does not exist!"),)
endef

#����ļ��Ƿ���ڣ�������ڷ��ؿգ����򷵻ز�Ϊ��
define check_file
$(shell if [ -e $1 ];then echo;else echo 1;fi)
endef

#���$1�е�ֵ$2��ָ����ļ��Ƿ���ڣ�������ڷ��أ�������ʾȻ�������˳�
# ��:
# $(call check_file2,FILE,xxx) 
# ���xxx(xxx�Ǳ���FILEֵ�е�һ����)�ļ��Ƿ���ڣ���������ڣ���ʾ:
#   FILE's value (xxx) does not exist!
define check_file2
$(if $(call check_file,$2),$(error "$1's value ($2) does not exist!"),)
endef

#����һ������obj-XX,���д�ŵ�ǰĿ¼��������XXΪ��׺���ļ�
#  ��DIRĿ¼�¶�Ӧ��.o�ļ�
#��:  $(call set_obj_x,c,DIR)
#  ������obj-c=DIR/XXX.o
define set_obj_x
obj-$1 = $(patsubst %.$1,$2/%.o,$(wildcard *.$1))
endef

##########################################################
#                   �������
#
# ������õı����Ƿ���ȷ
#
##########################################################
CC := $(strip $(CC))
ifeq ($(CC),)
$(error "CC is not set!")
endif

LD := $(strip $(LD))
ifeq ($(LD),)
$(error "LD is not set!")
endif

AR := $(strip $(AR))
ifeq ($(AR),)
ifeq ($(ACTION),ar)
$(error "AR is not set!")
endif
endif

SUFFIX := $(strip $(SUFFIX))
SUFFIX := $(sort $(SUFFIX))
ifeq ($(SUFFIX),)
$(error "SUFFIX is not set!")
endif
ifeq ($(SUFFIX),d)
$(error "SUFFIX's value (d) is invalid!")
endif
ifeq ($(SUFFIX),o)
$(error "SUFFIX's value (o) is invalid!")
endif

ACTION := $(strip $(ACTION))
ifeq ($(ACTION),)
$(error "ACTION is not set!")
endif
ifneq ($(words $(ACTION)),1)
$(error "ACTION's value is too many!")
endif
#$(error $(ACTION))
allact = ar so app
ifeq ($(allact),$(filter-out $(ACTION),$(allact)))
$(error "ACTION's value ($(ACTION)) is invalid!")
endif

TARGET := $(strip $(TARGET))
ifeq ($(TARGET),)
$(error "TARGET is not set!")
endif

CFLAGS := $(strip $(CFLAGS))

LDFLAGS := $(strip $(LDFLAGS))

OBJ_DIR := $(strip $(OBJ_DIR))
ifneq ($(words $(sort $(OBJ_DIR))),1)
$(error "OBJ_DIR's value is too many!")
endif
ifneq ($(call check_dir,$(OBJ_DIR)),)
$(error "OBJ's value ($(OBJ_DIR)) does not exist!")
endif

HEAD_DIR := $(strip $(HEAD_DIR))
ifneq ($(HEAD_DIR),)
$(foreach var,$(HEAD_DIR),$(call check_dir2,HEAD_DIR,$(var)))
endif

LIB_DIR := $(strip $(LIB_DIR))
ifneq ($(LIB_DIR),)
$(foreach var,$(LIB_DIR),$(call check_dir2,LIB_DIR,$(var)))
endif

DY_LIB := $(strip $(DY_LIB))
ST_LIB := $(strip $(ST_LIB))

TARGET_DIR := $(strip $(TARGET_DIR))
ifneq ($(TARGET_DIR),)
$(foreach var,$(TARGET_DIR),$(call check_dir2,TARGET_DIR,$(var)))
endif

EXPORT_HEAD := $(strip $(EXPORT_HEAD))
EXPORT_HEAD := $(sort $(EXPORT_HEAD))
EXPORT_HEAD_DIR := $(strip $(EXPORT_HEAD_DIR))
EXPORT_HEAD_DIR := $(sort $(EXPORT_HEAD_DIR))
ifneq ($(EXPORT_HEAD),)
$(foreach var,$(EXPORT_HEAD_DIR),$(call check_dir2,EXPORT_HEAD_DIR,$(var)))
$(foreach var,$(EXPORT_HEAD),$(call check_file2,EXPORT_HEAD,$(var)))
endif

SUB_MAKE_DIR := $(strip $(SUB_MAKE_DIR))
$(foreach var,$(SUB_MAKE_DIR),$(call check_dir2,SUB_MAKE_DIR,$(var)))

##########################################################
#                   ��������������Ҫ�ı���
#
#
#
##########################################################

#����.SUFFIX�ļ�
all_src = $(foreach i,$(SUFFIX),$(wildcard ./*.$(i)))

#������obj-X����,x��SUFFIX�е�ֵ
$(eval $(foreach i,$(SUFFIX),$(call set_obj_x,$i,$(OBJ_DIR))))

#����.SUFFIX�ļ���Ӧ��.o�ļ�
all_obj = $(foreach i,$(SUFFIX),$(obj-$i))

#ͷ�ļ�·��
head_dir = $(foreach d,$(HEAD_DIR),-I$d)

#���ӿ�·��
lib_dir = $(foreach d,$(LIB_DIR),-L$d)

#��̬���ӿ�
dy_lib	= $(foreach d,$(sort $(DY_LIB)),-l$d)

#��̬���ӿ�
st_lib	= $(foreach d,$(sort $(ST_LIB)),-l$d)

#���յı���ѡ��
cflags = $(head_dir) $(CFLAGS) 
#���յ�����ѡ��
ldflags = $(lib_dir) -Wl,-Bstatic $(st_lib) -Wl,-Bdynamic $(dy_lib) $(LDFLAGS)
##########################################################
#                   ��ʼ����
#
# ������.SUFFIX���ļ��Ȼ�ȡ��Ӧ��������ϵ.d�ļ�
# Ȼ������.o�ļ�
# ������е�.o�ļ����ӳ�Ŀ����TARGET
#
##########################################################
ifneq ($(EXPORT_HEAD),)
.PHONY = all $(TARGET) clean export
all: $(TARGET) export
else
.PHONY = all $(TARGET) clean
all: $(TARGET) 
endif

ifeq ($(ACTION),ar)    #��̬��
$(TARGET):$(all_obj)
	for d in $(SUB_MAKE_DIR);do make -C $$d; done;
	$(AR) rcvs $@ $^
	for i in $(TARGET_DIR);do if [ -d $$i ];then cp $@ $$i;fi;done
endif

ifeq ($(ACTION),so)    #��̬��
cflags += -fpic -shared
ldflags += -shared
$(TARGET): $(all_obj)
	for d in $(SUB_MAKE_DIR);do make -C $$d; done;
	$(CC) $^ -o $@ $(ldflags) 
	for i in $(TARGET_DIR);do if [ -d $$i ];then cp $@ $$i;fi;done
endif

ifeq ($(ACTION),app)    #Ӧ�ó���
$(TARGET): $(all_obj)
	for d in $(SUB_MAKE_DIR);do make -C $$d; done;
	$(CC) $^ -o $@ $(ldflags) 
	for i in $(TARGET_DIR);do if [ -d $$i ];then cp $@ $$i;fi;done
endif

ifneq ($(EXPORT_HEAD),)
export: $(EXPORT_HEAD)
	for i in $(EXPORT_HEAD); do for d in $(EXPORT_HEAD_DIR);do cp -rf $$i $$d;echo $$i;echo $$d; done;done
endif
clean:
	rm -f $(OBJ_DIR)/*.o  $(OBJ_DIR)/*.d  $(TARGET)

#obj�ļ����ɹ���
#  cmd_o   �ļ���׺  obj�ļ���ŵ�·��
#  $(call cmd_o,c,obj)��һ��չ����:
#  MAKEFIL_LIST��make�����ñ���,��make��ȡ���ļ����б�
#  ����ȷ����Makefile���޸ĺ�Ҳ��������±���
#$(obj-c): obj%.o:%.c MAKEFILE_LIST
#	CC cflgs -Wp,-MT,$@ -Wp,-MMD,$@.d -c -o $@ $<
#  �����Ŀ���ļ�ʹ����Makefile�ľ�̬ģʽ������ָ�����Ŀ��
#  obj%.o:%.c˵����ÿһ��Ŀ���ļ���������ϵ
define cmd_o
$$(obj-$1): $2/%.o:%.$1 $(MAKEFILE_LIST)
	$(CC) $(cflags) -Wp,-MT,$$@ -Wp,-MMD,$$@.d -c -o $$@ $$<
endef
#������obj-(SUFIX)�ֱ��Ӧ�ı������
$(eval $(foreach i,$(SUFFIX),$(call cmd_o,$i,$(OBJ_DIR))))

-include $(patsubst %.o,%o.d,$(all_obj))
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#     ����嵥!
#
#     ͨ�����²��������Makefile�Ƿ�������
#
#       ���ͨ�������µļ�飬�����Ϳ�����������
#       ��ʵ��ʹ���з�������,������У��
#
#     1 û�и�CC��ֵ����ʾ "CC is not set!"��Ȼ�������˳�
#     2 û�и�LD��ֵ����ʾ ��LD is not set!"��Ȼ�������˳�
#     3 û�и�SUFFIX��ֵ����ʾ ��SUFFIX is not set!"��Ȼ�������˳�
#     4 SUFFIX��ֵ��d����o����ʾ:
#       ��SUFFIX's value (d) is invalid!"
#       ��SUFFIX's value (o) is invalid!"
#     5 û�и�ACTION��ֵ����ʾ ��ACTION is not set!"��Ȼ�������˳�
#     6 ACTION��ֵ�а������ֶ������ͣ���ʾ "ACTION's value is too many!"
#     7 û�и�TARGET��ֵ����ʾ ��TARGET is not set!"��Ȼ�������˳�
#     8 ACTION�а���ar so app�����ֵ��
#       ��ʾ "ACTION's value (XXX) is invalid"
#     9 ��OBJ_DIR��ָ����һ�����ϲ��ظ�·����
#       ��ʾ "OBJ_DIR's value is more than one!"��Ȼ�������˳�
#    10 OBJ_DIRָ����Ŀ¼�����ڣ���ʾ��OBJ's value(XXX) does not exist!'
#    11 HEAD_DIRָ����Ŀ¼�����ڣ���ʾ��HEAD's value(XXX) does not exist!'
#    12 HEAD_DIR��ָ��Ŀ¼XXXʱ������head_dir��ֵ��-IXXX
#    13 LIB_DIRָ����Ŀ¼�����ڣ���ʾ��LIB's value(XXX) does not exist!'
#    14 LIB_DIR��ָ��Ŀ¼XXXʱ������lib_dir��ֵ��-IXXX
#    15 EXPORT_HEAD��Ϊ�գ���EXPORT_HEAD_DIRָ����Ŀ¼�����ڣ�
#       ��ʾ"EXPORT_HEAD_DIR's value(XXX) does not exist!"
#    16 EXPORT_HEAD��ָ�����ļ������ڣ�
#       ��ʾ"EXPORT_HEAD' value (XXX) does not exist!"
#    17 ���SUB_MAKE_DIRָ����Ŀ¼�����ڣ�
#       ��ʾ"SUB_MAKE_DIR's value (XXX)does not exist!"
#    18 ���all_src���Ƿ�����˵�ǰĿ¼��������SUFFIX�е�ֵΪ��׺���ļ���
#    19 ���all_obj���Ƿ�����˵�ǰĿ¼��������SUFFIX�е�ֵΪ��׺���ļ���
#       ��OBJĿ¼�¶�Ӧ��.o�ļ�
#    20 ָ����SUB_MAKE_DIR,��Make��ִ��
#    21 CFLAGS DY_LIB ST_LIB HEAD_DIR ������������cflags��
#    22 OBJĿ¼������.SUFFIX��Ӧ��.o�ļ�����.o�������ļ�.o.d
#    23 EXPORT_HEAD�е��ļ���������EXPORT_HEAD_DIR�е�ÿһ��Ŀ¼
#    24 TARGET�е��ļ����ɲ������Ƶ���TARGET_DIR��
#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!