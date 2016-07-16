class Metadata {
  Map<String, String> values = <String, String>{};

  setTagValue(String tag, String value) {
    this.values[tag] = value;
  }

  String getTagValue(String tag) {
    return this.values[tag];
  }
}
