
/*
 * Ensure we have C99-style int64_t, etc, all defined.
 */

/* First, we need to know if the system has already defined them. */
#cmakedefine HAVE_INT16_T
#cmakedefine HAVE_INT32_T
#cmakedefine HAVE_INT64_T
#cmakedefine HAVE_INTMAX_T

#cmakedefine HAVE_UINT8_T
#cmakedefine HAVE_UINT16_T
#cmakedefine HAVE_UINT32_T
#cmakedefine HAVE_UINT64_T
#cmakedefine HAVE_UINTMAX_T

/* We might have the types we want under other spellings. */
#cmakedefine HAVE___INT64
#cmakedefine HAVE_U_INT64_T
#cmakedefine HAVE_UNSIGNED___INT64

/* The sizes of various standard integer types. */
@SIZE_OF_SHORT_CODE@
@SIZE_OF_INT_CODE@
@SIZE_OF_LONG_CODE@
@SIZE_OF_LONG_LONG_CODE@
@SIZE_OF_UNSIGNED_SHORT_CODE@
@SIZE_OF_UNSIGNED_CODE@
@SIZE_OF_UNSIGNED_LONG_CODE@
@SIZE_OF_UNSIGNED_LONG_LONG_CODE@
@SIZE_OF_SIZE_T_CODE@

/*
 * If we lack int64_t, define it to the first of __int64, int, long, and long long
 * that exists and is the right size.
 */
#if !defined(HAVE_INT64_T) && defined(HAVE___INT64)
typedef __int64 int64_t;
#define HAVE_INT64_T
#endif

#if !defined(HAVE_INT64_T) && SIZE_OF_INT == 8
typedef int int64_t;
#define HAVE_INT64_T
#endif

#if !defined(HAVE_INT64_T) && SIZE_OF_LONG == 8
typedef long int64_t;
#define HAVE_INT64_T
#endif

#if !defined(HAVE_INT64_T) && SIZE_OF_LONG_LONG == 8
typedef long long int64_t;
#define HAVE_INT64_T
#endif

#if !defined(HAVE_INT64_T)
#error No 64-bit integer type was found.
#endif

/*
 * Similarly for int32_t
 */
#if !defined(HAVE_INT32_T) && SIZE_OF_INT == 4
typedef int int32_t;
#define HAVE_INT32_T
#endif

#if !defined(HAVE_INT32_T) && SIZE_OF_LONG == 4
typedef long int32_t;
#define HAVE_INT32_T
#endif

#if !defined(HAVE_INT32_T)
#error No 32-bit integer type was found.
#endif

/*
 * Similarly for int16_t
 */
#if !defined(HAVE_INT16_T) && SIZE_OF_INT == 2
typedef int int16_t;
#define HAVE_INT16_T
#endif

#if !defined(HAVE_INT16_T) && SIZE_OF_SHORT == 2
typedef short int16_t;
#define HAVE_INT16_T
#endif

#if !defined(HAVE_INT16_T)
#error No 16-bit integer type was found.
#endif

/*
 * Similarly for uint64_t
 */
#if !defined(HAVE_UINT64_T) && defined(HAVE_UNSIGNED___INT64)
typedef unsigned __int64 uint64_t;
#define HAVE_UINT64_T
#endif

#if !defined(HAVE_UINT64_T) && SIZE_OF_UNSIGNED == 8
typedef unsigned uint64_t;
#define HAVE_UINT64_T
#endif

#if !defined(HAVE_UINT64_T) && SIZE_OF_UNSIGNED_LONG == 8
typedef unsigned long uint64_t;
#define HAVE_UINT64_T
#endif

#if !defined(HAVE_UINT64_T) && SIZE_OF_UNSIGNED_LONG_LONG == 8
typedef unsigned long long uint64_t;
#define HAVE_UINT64_T
#endif

#if !defined(HAVE_UINT64_T)
#error No 64-bit unsigned integer type was found.
#endif

/*
 * Similarly for uint32_t
 */
#if !defined(HAVE_UINT32_T) && SIZE_OF_UNSIGNED == 4
typedef unsigned uint32_t;
#define HAVE_UINT32_T
#endif

#if !defined(HAVE_UINT32_T) && SIZE_OF_UNSIGNED_LONG == 4
typedef unsigned long uint32_t;
#define HAVE_UINT32_T
#endif

#if !defined(HAVE_UINT32_T)
#error No 32-bit unsigned integer type was found.
#endif

/*
 * Similarly for uint16_t
 */
#if !defined(HAVE_UINT16_T) && SIZE_OF_UNSIGNED == 2
typedef unsigned uint16_t;
#define HAVE_UINT16_T
#endif

#if !defined(HAVE_UINT16_T) && SIZE_OF_UNSIGNED_SHORT == 2
typedef unsigned short uint16_t;
#define HAVE_UINT16_T
#endif

#if !defined(HAVE_UINT16_T)
#error No 16-bit unsigned integer type was found.
#endif

/*
 * Similarly for uint8_t
 */
#if !defined(HAVE_UINT8_T)
typedef unsigned char uint8_t;
#define HAVE_UINT8_T
#endif

#if !defined(HAVE_UINT16_T)
#error No 8-bit unsigned integer type was found.
#endif

/* Define intmax_t and uintmax_t if they are not already defined. */
#if !defined(HAVE_INTMAX_T)
typedef int64_t intmax_t;
#define INTMAX_MIN INT64_MIN
#define INTMAX_MAX INT64_MAX
#endif

#if !defined(HAVE_UINTMAX_T)
typedef uint64_t uintmax_t;
#endif


#cmakedefine uintptr_t @uintptr_t@


#cmakedefine HAVE_RESTRICT
#cmakedefine HAVE___RESTRICT

#cmakedefine HAVE_INLINE
#cmakedefine HAVE___INLINE

#ifndef HAVE_RESTRICT
#  ifdef HAVE___RESTRICT
#    define LZMA_RESTRICT __restrict
#  else
#    define LZMA_RESTRICT
#  endif
#else
#  define LZMA_RESTRICT restrict
#endif /* HAVE_RESTRICT */

#ifndef HAVE_INLINE
#  ifdef HAVE___INLINE
#    define inline __inline
#  else
#    define inline
#  endif
#endif /* HAVE_INLINE */


#cmakedefine WORDS_BIGENDIAN 1

#cmakedefine HAVE_BYTESWAP_H 1
#cmakedefine HAVE_BSWAP_16 1
#cmakedefine HAVE_BSWAP_32 1
#cmakedefine HAVE_BSWAP_64 1


#define HAVE_CHECK_CRC32 1
#define HAVE_CHECK_CRC64 1
#define HAVE_CHECK_SHA256 1

#define HAVE_DECODER_ARM 1
#define HAVE_DECODER_ARMTHUMB 1
#define HAVE_DECODER_DELTA 1
#define HAVE_DECODER_IA64 1
#define HAVE_DECODER_LZMA1 1
#define HAVE_DECODER_LZMA2 1
#define HAVE_DECODER_POWERPC 1
#define HAVE_DECODER_SPARC 1
#define HAVE_DECODER_X86 1

#define HAVE_ENCODER_ARM 1
#define HAVE_ENCODER_ARMTHUMB 1
#define HAVE_ENCODER_DELTA 1
#define HAVE_ENCODER_IA64 1
#define HAVE_ENCODER_LZMA1 1
#define HAVE_ENCODER_LZMA2 1
#define HAVE_ENCODER_POWERPC 1
#define HAVE_ENCODER_SPARC 1
#define HAVE_ENCODER_X86 1

#define HAVE_MF_BT2 1
#define HAVE_MF_BT3 1
#define HAVE_MF_BT4 1
#define HAVE_MF_HC3 1
#define HAVE_MF_HC4 1

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine HAVE_INTTYPES_H 1

/* Define to 1 if you have the <limits.h> header file. */
#cmakedefine HAVE_LIMITS_H 1

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine HAVE_MEMORY_H 1

/* Define to 1 if stdbool.h conforms to C99. */
#cmakedefine HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H 1

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine HAVE_STRING_H 1

/* Define to 1 if you have the <sys/byteorder.h> header file. */
#cmakedefine HAVE_SYS_BYTEORDER_H 1

/* Define to 1 if you have the <sys/endian.h> header file. */
#cmakedefine HAVE_SYS_ENDIAN_H 1

/* Define to 1 or 0, depending whether the compiler supports simple visibility
   declarations. */
#cmakedefine HAVE_VISIBILITY 1

/* Define to 1 if the system has the type `_Bool'. */
#cmakedefine HAVE__BOOL 1

/* Define to 1 if the system supports fast unaligned access to 16-bit and
   32-bit integers. */
#define TUKLIB_FAST_UNALIGNED_ACCESS 1
