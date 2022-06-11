class Validation {
  static String validation(Map<String, dynamic> result) {
    String message = "";

    if ((result["errors"] as Map<String, dynamic>).containsKey("validation")) {
      Map<String, dynamic> jsonValidation = ((result["errors"]
          as Map<String, dynamic>)["validation"] as Map<String, dynamic>);
      Iterable<String> temp = jsonValidation.keys;

      for (String key in temp) {
        var value = jsonValidation[key];
        message += "$value\n";
      }
    } else if ((result["errors"] as Map<String, dynamic>)
        .containsKey("description")) {
      message = (result["errors"] as Map<String, dynamic>)["description"];
    }

    return message;
  }
}
