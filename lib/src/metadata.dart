class Metadata {
  Map<String, String> values = {};

  setKeyValue(String key, String value) {
    this.values[key] = value;
  }

  String getKeyValue(String key) {
    return this.values[key];
  }
}
