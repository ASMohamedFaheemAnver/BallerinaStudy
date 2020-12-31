import ballerina/io;
import ballerina/xmlutils;
public function main() {
    json j1 = {
        "Store": {
            "@id": "AST",
            "name": "Anne",
            "address": {
                "street": "Main",
                "city": "94"
            },
            "codes": ["4", "8"]
        }
    };

    var x1 = xmlutils:fromJSON(j1);
    io:println(x1);

    json j2 = {
        "Store": {
            "#id": "AST",
            "name": "Anne",
            "address": {
                "street": "Main",
                "city": "94"
            },
            "codes": ["4", "8"]
        }
    };
    var x2 = xmlutils:fromJSON(j2, {attributePrefix: "#", arrayEntryTag: "wrapper"});
    io:println(x2);
}
