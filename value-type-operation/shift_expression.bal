import ballerina/io;
import ballerina/lang.'int;
public function main() {
    int a = 1;
    int res1 = a << 2;
    io:println("`int` 1 << 2: ", res1);

    'int:Unsigned8 b = 128;
    int res2 = b << 3;
    io:println("`int:Unsigned8` 128 << 3: ", res2);
    'int:Signed16 c = -32700;
    int res3 = c >> 2;
    io:println("`int:Signed16` -32700 >> 2: ", res3);

    'int:Unsigned8 d = 255;
    int e = 4;
    'int:Unsigned8 res4 = d >> e;
    io:println("`int:Unsigned8` 255 >> 4: ", res4);

    'int:Signed32 f = 123167;
    int res5 = f >>> 3;
    io:println("`int:Signed32` 123167 >>> 3: ", res5);

    'int:Unsigned16 g = 32001;
    'int:Unsigned16 res6 = g >> 2;
    io:println("`int:Unsigned16` 32001 >>> 2: ", res6);
}
