import 'package:test/test.dart';

main() {
  group('Status', () {
    test('should parse status', () {
      var parser = new Parser();

      var result = parser.parse("status playing");

      expect(result.getKeyValue("status"), "playing");
    });

    test('should parse another status', () {
      var parser = new Parser();

      var result = parser.parse("status pause");

      expect(result.getKeyValue("status"), "pause");
    });

    test('should support multiple words status', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud");

      expect(result.getKeyValue("status"), "playing loud");
    });

    test('should support status with title', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud title Dance");

      expect(result.getKeyValue("status"), "playing loud");
    });
  });

  group('Title', () {
    test('should support title', () {
      var parser = new Parser();

      var result = parser.parse("title Dancing with the stars");

      expect(result.getKeyValue("title"), "Dancing with the stars");
    });
    test('should support multiple words title', () {
      var parser = new Parser();

      var result = parser.parse("status playing title Dancing with the stars");

      expect(result.getKeyValue("title"), "Dancing with the stars");
    });
  });
}

class Parser {
  final String breakKey = "!break!";
  List<String> keys = ['status', 'title', "!break!"];

  Metadata parse(String metadata) {
    var result = new Metadata();
    var splitedMetadata = metadata.split(" ");
    splitedMetadata.add(breakKey);
    String lastFound = null;
    List<String> valueCollector = [];
    for (var part in splitedMetadata) {
      if (keys.contains(part)) {
        if (valueCollector.length > 0) {
          String joinedValue = valueCollector.join(" ");
          result.setKeyValue(lastFound, joinedValue);
          valueCollector.clear();
        }
        lastFound = part;
        continue;
      }
      valueCollector.add(part);
    }
    return result;
  }
}

class Metadata {
  Map<String, String> values = {};

  setKeyValue(String key, String value) {
    this.values[key] = value;
  }

  String getKeyValue(String key) {
    return this.values[key];
  }
}
