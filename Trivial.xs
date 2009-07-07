#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "const-c.inc"

MODULE = Digest::Trivial		PACKAGE = Digest::Trivial		

INCLUDE: const-xs.inc

int
hash(char *str);
   CODE:
       RETVAL = 0;
       for (; * str; str ++) {
           RETVAL ^= * str;
       }
       if (RETVAL < 0) {
           RETVAL = 256 + RETVAL;
       }
   OUTPUT:
       RETVAL
