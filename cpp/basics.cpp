#include <iostream>
#include <string>

using namespace std;
/* Literals: Value of any basic data type */

void literals() {
    // Literal values are fixed -> constant
    // some unconventional literals
    int unsigned_int = u'U'; // unsigned integer
    int hex = 0x2a; // Hexadecimal
    string raw = R"(raw string)"; // Raw string: suppress string actions
    // functions can be literals!
    auto lambda = [](int a, int b){ return a + b; };

    // User defined literals allow us to clsombine value with units
    // In cpp: <built_in-literal> + _ + <Suffix>
    long long int operator "" _b(long long int);
    auto binary = 0101010101_b;
    // Cpp runtime maps user-defined literal onto corresponding literal operator
    // This has to be implemented by the programmer

    // Cpp 14 has built in literals
    // No underscore
    // Can initialze string without c-string literal
    /**
     * binary 0b (prefix) 0b11
     * string s (suffix) "hello"s
     * complex<Integral> (suffix) i+(-lf)
     * chrono<Time unit> (suffix) -(h min s ms us ns)
    */

   // literal operator has: Raw and Cooked
   
}

void types() {

}

void auto_type_deduction() {

}

void unified_initialization() {

}

void constants() {

}

int main() {
    literals();

    return 0;
}
