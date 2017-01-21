//
// x64codegen.cpp
//
// Copyright (C) 2012 - 2015 jones@scss.tcd.ie
//
// 28/01/12 first version
//

#include "stdafx.h"         // pre-compiled headers
#include "fib64.h"          //
#include "tutorial2.h"             //
#include <iostream>         // cout
#include <cstdint>
//#include <conio.h>          // _getch

using namespace std;        // cout

//
// fib: C++
//
int64_t fib(int64_t n)
{
    int64_t fi, fj, t;

    if (n <= 1)
        return n;

    fi = 0;
    fj = 1;
    while (n > 1) {
        t = fj;
        fj = fi + fj;
        fi = t;
        n--;
    }
    return fj;
}

//
// check
//
void check(char *s, int64_t v, int64_t val)
{
    cout << s << " = " << v;
    if (v == val) {
        cout << " OK";
    } else {
        cout << " ERROR: should be " << v;
    }
    cout << endl;
}

//
// _tmain
//
int _tmain(int argc, _TCHAR* argv[])
{

    //printf("hello world\n");

    //
    // tutorial 2
    //
    check("g", g, 256);
    check("p(1, 2)", p(1, 2), 11);
    check("(q(2)", q(2), 1015);
    check("xp5(1, 2, 3, 4, 5)", xp5(1, 2, 3, 4, 5), 15);
    check("f(6)", f(6), 720);
    cout << endl;

    //
    // fib: C++
    //
    for (int i = -1; i < 20; i++)
        cout << fib(i) << " ";
    cout << endl;

    //
    // fib: x64 assembly language
    //
    for (int i = -1; i < 20; i++)
        cout << fib_x64(i) << " ";
    cout << endl;

    //
    // xp2
    //
    check("xp2(7, 11)", xp2(7, 11), 18);

    _getch();

    return 0;

}

// eof