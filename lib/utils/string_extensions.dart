extension ErrorParsing on String {
  String parseError() {
    var splitList = split(":");

    if (splitList[0].trim() == "null") {
      return splitList[1].trim();
    } else {
      return splitList[0].trim();
    }
  }
  // ···
}
