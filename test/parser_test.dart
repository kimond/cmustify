import 'package:test/test.dart';

main() {
  group('Status', () {
    test('should parse status', () {
      var parser = new Parser();

      var result = parser.parse("status playing");

      expect(result.status, "playing");
    });

    test('should parse another status', () {
      var parser = new Parser();

      var result = parser.parse("status pause");

      expect(result.status, "pause");
    });

    test('should support multiple words status', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud");

      expect(result.status, "playing loud");
    });

    test('should support status with title', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud title Dance");

      expect(result.status, "playing loud");
    });
  });

  group('Title', () {
    test('should support title', () {
      var parser = new Parser();

      var result = parser.parse("status playing title Dancing with the stars");

      // expect(result.title, "Dancing with the stars");
    });
  });
}

class Parser {
  List<String> keys = ['status', 'title'];
  Metadata parse(String metadata) {
    var result = new Metadata();
    var splitedMetadata = metadata.split(" ");
    String lastFound = null;
    for (var part in splitedMetadata) {
      if (keys.contains(part)) {

      }
    }
    return result;
  }
}

class Metadata {
  String status;
  String title;
}
