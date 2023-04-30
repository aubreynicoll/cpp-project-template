#include <cmakevars.h>

#include <iostream>

auto main() -> int {
	std::cout << "cpp project template v" << MAJOR_VERSION << "."
		  << MINOR_VERSION << "\n"
		  << "hello world!\n";
}
