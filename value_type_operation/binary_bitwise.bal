import ballerina/io;
import ballerina/lang.'int;

public function main() {
    int a = 385;
    'int:Unsigned8 b = 128;
    'int:Unsigned8 res1 = a & b;
    io:println("`int` 385 & `int:Unsigned8` 128: ", res1);

    'int:Signed16 c = -32700;
    int d = 249;
    int res2 = c & d;
    io:println("`int:Signed16` -32700 & `int` 249: ", res2);

    'int:Unsigned8 e = 254;
    'int:Unsigned16 f = 511;
    'int:Unsigned8 res3 = e | f;
    io:println("`int:Unsigned8` 254 | `int:Unsigned16` 511: ", res3);
    'int:Unsigned8 res4 = e ^ f;
    io:println("`int:Unsigned8` 254 ^ `int:Unsigned16` 511: ", res4);

    int g = 12345678;
    'int:Signed8 h = -127;
    int res5 = g | h;
    io:println("`int` 12345678 | `int:Signed8` -127: ", res5);
    int res6 = g ^ h;
    io:println("`int` 12345678 ^ `int:Signed8` -127: ", res6);
}
