/* file "test.cpp"
 * 
 * program to test "t2.s"
 *
 * author: Aran Nolan
 */
#include <cstdint>
#include <iostream>
#include "t2.h"

int main(int argc, char const *argv[])
{
	// test global variable g
	std::cout << "g = " << g << std::endl;

	// test p()
	std::cout << "p(3,4) \t= " << p(3, 4) << std::endl;

	// test q()
	std::cout << "q(5) \t= " << q(5) << std::endl;
	std::cout << "q(10) \t= " << q(10) << std::endl;

	// test f() - factorial function
	std::cout << "f(4) \t= " << f(4) << std::endl;
	std::cout << "f(-1) \t= " << f(-1) << std::endl;

	// test xps5() - uses printf
	std::cout << "xp5(5, 4, 3, 2, 1) output:" << std::endl;
	xp5(5, 4, 3, 2, 1);

	return 0;
}