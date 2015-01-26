# Based on cmliblzma CMakeLists.txt from the CMake source:
# https://github.com/Kitware/CMake/blob/master/Utilities/cmliblzma/CMakeLists.txt

project(LIBLZMA C)
cmake_minimum_required(VERSION 3.1)

include(CheckCSourceCompiles)
include(CheckIncludeFile)
include(CheckSymbolExists)
include(CheckTypeSize)
include(TestBigEndian)

check_c_source_compiles(
    "int test (void *restrict x);\nint main (void) {return 0;}"
    HAVE_RESTRICT
)

check_c_source_compiles(
    "typedef struct abc *d;\nint test (d __restrict x);\nint main (void) {return 0;}"
    HAVE___RESTRICT
)

check_c_source_compiles(
    "inline int test (void) {return 0;}\nint main (void) {return test();}"
    HAVE_INLINE
)

check_c_source_compiles(
    "__inline int test (void) {return 0;}\nint main (void) {return test();}"
    HAVE___INLINE
)

check_include_file(byteswap.h HAVE_BYTESWAP_H)
check_include_file(inttypes.h HAVE_INTTYPES_H)
check_include_file(limits.h HAVE_LIMITS_H)
check_include_file(memory.h HAVE_MEMORY_H)
check_include_file(strings.h HAVE_STRINGS_H)
check_include_file(string.h HAVE_STRING_H)
check_include_file(sys/sysctl.h HAVE_SYS_SYSCTL_H)

check_include_file(stdbool.h HAVE_STDBOOL_H)
if(NOT HAVE_STDBOOL_H)
    check_type_size(_Bool _BOOL)
endif()

check_c_source_compiles(
    "#include<byteswap.h>\nint main(void){bswap_16(0);return 0;}"
    HAVE_BSWAP_16
)
check_c_source_compiles(
    "#include<byteswap.h>\nint main(void){bswap_32(0);return 0;}"
    HAVE_BSWAP_32
)
check_c_source_compiles(
    "#include<byteswap.h>\nint main(void){bswap_64(0);return 0;}"
    HAVE_BSWAP_64
)

test_big_endian(WORDS_BIGENDIAN)

set(HAVE_CHECK_CRC64 1)
set(HAVE_CHECK_SHA256 1)

set(HAVE_DECODER_ARM 1)
set(HAVE_DECODER_ARMTHUMB 1)
set(HAVE_DECODER_DELTA 1)
set(HAVE_DECODER_IA64 1)
set(HAVE_DECODER_LZMA1 1)
set(HAVE_DECODER_LZMA2 1)
set(HAVE_DECODER_POWERPC 1)
set(HAVE_DECODER_SPARC 1)
set(HAVE_DECODER_X86 1)

set(HAVE_ENCODER_ARM 1)
set(HAVE_ENCODER_ARMTHUMB 1)
set(HAVE_ENCODER_DELTA 1)
set(HAVE_ENCODER_IA64 1)
set(HAVE_ENCODER_LZMA1 1)
set(HAVE_ENCODER_LZMA2 1)
set(HAVE_ENCODER_POWERPC 1)
set(HAVE_ENCODER_SPARC 1)
set(HAVE_ENCODER_X86 1)

set(HAVE_MF_BT2 1)
set(HAVE_MF_BT3 1)
set(HAVE_MF_BT4 1)
set(HAVE_MF_HC3 1)
set(HAVE_MF_HC4 1)

check_type_size(int16_t INT16_T)
check_type_size(int32_t INT32_T)
check_type_size(int64_t INT64_T)
check_type_size(intmax_t INTMAX_T)
check_type_size(uint8_t UINT8_T)
check_type_size(uint16_t UINT16_T)
check_type_size(uint32_t UINT32_T)
check_type_size(uint64_t UINT64_T)
check_type_size(uintmax_t UINTMAX_T)

check_type_size("short" SIZE_OF_SHORT)
check_type_size("int" SIZE_OF_INT)
check_type_size("long" SIZE_OF_LONG)
check_type_size("long long" SIZE_OF_LONG_LONG)

check_type_size("unsigned short" SIZE_OF_UNSIGNED_SHORT)
check_type_size("unsigned" SIZE_OF_UNSIGNED)
check_type_size("unsigned long" SIZE_OF_UNSIGNED_LONG)
check_type_size("unsigned long long" SIZE_OF_UNSIGNED_LONG_LONG)
check_type_size("size_t" SIZE_OF_SIZE_T)

check_type_size("__int64" __INT64)
check_type_size("unsigned __int64" UNSIGNED___INT64)

check_type_size(uintptr_t UINTPTR_T)
if(NOT HAVE_UINTPTR_T)
    if("${CMAKE_SIZEOF_VOID_P}" EQUAL 8)
        set(uintptr_t "uint64_t")
    else()
        set(uintptr_t "uint32_t")
    endif()
endif()


set(LZMA_SRCS
    src/common/sysdefs.h
    src/common/tuklib_integer.h
    src/common/tuklib_physmem.c
    src/liblzma/check/check.c
    src/liblzma/check/crc32_fast.c
    src/liblzma/check/crc32_table.c
    src/liblzma/check/crc64_fast.c
    src/liblzma/check/crc64_table.c
    src/liblzma/check/sha256.c
    src/liblzma/common/alone_decoder.c
    src/liblzma/common/alone_encoder.c
    src/liblzma/common/auto_decoder.c
    src/liblzma/common/block_buffer_decoder.c
    src/liblzma/common/block_buffer_encoder.c
    src/liblzma/common/block_decoder.c
    src/liblzma/common/block_encoder.c
    src/liblzma/common/block_header_decoder.c
    src/liblzma/common/block_header_encoder.c
    src/liblzma/common/block_util.c
    src/liblzma/common/common.c
    src/liblzma/common/easy_buffer_encoder.c
    src/liblzma/common/easy_decoder_memusage.c
    src/liblzma/common/easy_encoder.c
    src/liblzma/common/easy_encoder_memusage.c
    src/liblzma/common/easy_preset.c
    src/liblzma/common/filter_buffer_decoder.c
    src/liblzma/common/filter_buffer_encoder.c
    src/liblzma/common/filter_common.c
    src/liblzma/common/filter_decoder.c
    src/liblzma/common/filter_encoder.c
    src/liblzma/common/filter_flags_decoder.c
    src/liblzma/common/filter_flags_encoder.c
    src/liblzma/common/hardware_cputhreads.c
    src/liblzma/common/hardware_physmem.c
    src/liblzma/common/index.c
    src/liblzma/common/index_decoder.c
    src/liblzma/common/index_encoder.c
    src/liblzma/common/index_hash.c
    src/liblzma/common/outqueue.c
    src/liblzma/common/stream_buffer_decoder.c
    src/liblzma/common/stream_buffer_encoder.c
    src/liblzma/common/stream_decoder.c
    src/liblzma/common/stream_encoder.c
    src/liblzma/common/stream_encoder_mt.c
    src/liblzma/common/stream_flags_common.c
    src/liblzma/common/stream_flags_decoder.c
    src/liblzma/common/stream_flags_encoder.c
    src/liblzma/common/vli_decoder.c
    src/liblzma/common/vli_encoder.c
    src/liblzma/common/vli_size.c
    src/liblzma/delta/delta_common.c
    src/liblzma/delta/delta_decoder.c
    src/liblzma/delta/delta_encoder.c
    src/liblzma/lz/lz_decoder.c
    src/liblzma/lz/lz_encoder.c
    src/liblzma/lz/lz_encoder_mf.c
    src/liblzma/lzma/fastpos_table.c
    src/liblzma/lzma/lzma2_decoder.c
    src/liblzma/lzma/lzma2_encoder.c
    src/liblzma/lzma/lzma_decoder.c
    src/liblzma/lzma/lzma_encoder.c
    src/liblzma/lzma/lzma_encoder_optimum_fast.c
    src/liblzma/lzma/lzma_encoder_optimum_normal.c
    src/liblzma/lzma/lzma_encoder_presets.c
    src/liblzma/rangecoder/price_table.c
    src/liblzma/simple/arm.c
    src/liblzma/simple/armthumb.c
    src/liblzma/simple/ia64.c
    src/liblzma/simple/powerpc.c
    src/liblzma/simple/simple_coder.c
    src/liblzma/simple/simple_decoder.c
    src/liblzma/simple/simple_encoder.c
    src/liblzma/simple/sparc.c
    src/liblzma/simple/x86.c
)

if(WIN32 AND BUILD_SHARED_LIBS)
    set(LZMA_SRCS ${LZMA_SRCS} src/liblzma/liblzma_w32res.rc)
endif()

configure_file(config.h.cmake config.h @ONLY)

include_directories(
    "${CMAKE_CURRENT_SOURCE_DIR}/src/common"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/api"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/check"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/common"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/delta"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/lz"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/lzma"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/rangecoder"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/liblzma/simple"
    "${CMAKE_CURRENT_BINARY_DIR}"
)

# Disable warnings to avoid changing 3rd party code.
if(CMAKE_C_COMPILER_ID MATCHES
        "^(GNU|Clang|AppleClang|XL|VisualAge|SunPro|MIPSpro|HP|Intel)$")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w")
elseif(CMAKE_C_COMPILER_ID STREQUAL "PathScale")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -woffall")
endif()

add_definitions(-DHAVE_CONFIG_H)

if(WIN32)
    add_definitions(-DMYTHREAD_VISTA)
else()
    add_definitions(-DMYTHREAD_POSIX)
endif()

add_library(lzma SHARED ${LZMA_SRCS})

set_target_properties(
    lzma
    PROPERTIES
    LINKER_LANGUAGE C
)

add_library(lzma_static STATIC ${LZMA_SRCS})

set_target_properties(
    lzma lzma_static
    PROPERTIES
    C_STANDARD 99
    C_STANDARD_REQUIRED 1
)


#install(FILES COPYING DESTINATION ${CMAKE_DOC_DIR}/cmliblzma)
