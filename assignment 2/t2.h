/* file "t2.h"
 * 
 * header file for "t2.s"
 * 
 * author: Aran Nolan
 */
#pragma once
#include <cstdint>

// global variables
extern "C" int64_t g;

// functions
extern "C" int64_t p(int64_t i, int64_t j);
extern "C" int64_t q(int64_t i);
extern "C" int64_t f(int64_t n);
extern "C" int64_t xp5(int64_t a, int64_t b, int64_t c, int64_t d, int64_t e);