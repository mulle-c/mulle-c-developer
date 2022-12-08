#ifndef <|PROJECT_DOWNCASE_IDENTIFIER|>_include_h__
#define <|PROJECT_DOWNCASE_IDENTIFIER|>_include_h__

/* This is a central include file to keep dependencies out of the library
   C files. It is usally included by .h files only.

   The advantage is that now .c and .h files become motile. They can
   be moved to other projects and don't need to be edited. Also less typing...

   Therefore it is important that this file is called "include.h" and
   not "<|PROJECT_NAME|>-include.h" to keep the #include statements in the
   library code uniform.

   The C-compiler will pick up the nearest one.
*/

/* Include the header file automatically generated by mulle-sourcetree-to-c.
   Here the prefix is harmless and serves disambiguation. If you have no
   sourcetree, then you don't need it.
 */

#include "_<|PROJECT_NAME|>-include.h"

#ifndef <|PROJECT_UPCASE_IDENTIFIER|>_GLOBAL
# ifdef <|PROJECT_UPCASE_IDENTIFIER|>_BUILD
#  define <|PROJECT_UPCASE_IDENTIFIER|>_GLOBAL    MULLE_C_GLOBAL
# else
#  if defined( <|PROJECT_UPCASE_IDENTIFIER|>_INCLUDE_DYNAMIC) || (defined( MULLE_INCLUDE_DYNAMIC) && ! defined( <|PROJECT_UPCASE_IDENTIFIER|>_INCLUDE_STATIC))
#   define <|PROJECT_UPCASE_IDENTIFIER|>_GLOBAL   MULLE_C_GLOBAL
#  else
#   define <|PROJECT_UPCASE_IDENTIFIER|>_GLOBAL   extern
#  endif
# endif
#endif

/* You can add some more include statements here */

#include "<|PROJECT_NAME|>-version.h"

#endif

