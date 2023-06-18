import 'dart:convert';

class ConverterUtil {

  static String convertFromJson(String source, String className) {
    String output = "";
    String body = "";
    try {
      Map<String, dynamic> encodedJson = jsonDecode(source);
      encodedJson.forEach((key, value) {
        String varName = getVarNameFromKey(key);
        body += "\tstatic const String k$varName = \"$key\";\n";
      });
    } catch (e) {
      output = "Some thing went wrong";
    }
    if (body.isNotEmpty) {
      output = "class $className {\n$body}";
    }
    return output;
  }

  static String getVarNameFromKey(String key) {
    String output = "";
    String? pendingString;
    for (int splitter = 0; splitter < key.length; splitter++) {
      String currentKey = key[splitter];
      if (key[splitter] == "_") {
        pendingString = key[splitter + 1].toUpperCase();
        continue;
      }
      if (pendingString != null) {
        currentKey = pendingString;
        pendingString = null;
      }
      output += currentKey;
    }
    return output.replaceRange(0, 1, key[0].toUpperCase());
  }
}
