#include <cmakevars.h>

#include <iostream>

int main() {
	std::cout << "cpp project template v" << MAJOR_VERSION << "."
		  << MINOR_VERSION << "\n"
		  << "hello world!\n";
}
