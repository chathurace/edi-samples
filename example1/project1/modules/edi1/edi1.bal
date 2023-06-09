
import ballerina/edi;

public function fromEdiString(string ediText) returns SimpleOrder|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    json dataJson = check edi:fromEdiString(ediText, ediSchema);
    return dataJson.cloneWithType();
}

public function toEdiString(SimpleOrder data) returns string|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    return edi:toEdiString(data, ediSchema);    
}

public type Header_Type record {|
   string code?;
   string orderId?;
   string organization?;
   string date?;
|};

public type Items_Type record {|
   string code?;
   string item?;
   int? quantity?;
|};

public type SimpleOrder record {|
   Header_Type? header?;
   Items_Type[] items = [];
|};



json schemaJson = {"name":"SimpleOrder", "delimiters":{"segment":"~", "field":"*", "component":":", "repetition":"^"}, "segments":[{"code":"HDR", "tag":"header", "fields":[{"tag":"code"}, {"tag":"orderId"}, {"tag":"organization"}, {"tag":"date"}]}, {"code":"ITM", "tag":"items", "maxOccurances":-1, "fields":[{"tag":"code"}, {"tag":"item"}, {"tag":"quantity", "dataType":"int"}]}]};
    