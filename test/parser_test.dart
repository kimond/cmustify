import 'package:test/test.dart';

main() {
  group('Status', () {
    test('should parse status', () {
      var parser = new Parser();

      var result = parser.parse("status playing");

      expect(result, "playing");
    });

    test('should parse another status', () {
      var parser = new Parser();

      var result = parser.parse("status pause");

      expect(result, "pause");
    });

    test('should support multiple words status', () {
      var parser = new Parser();

      var result = parser.parse("status playing loud");

      expect(result, "playing loud");
    });
  });

  group('Title', (){
    test('should support title', () {
      var parser = new Parser();

      var result = parser.parse("status playing title Dancing with the stars");

      // expect(result, "Dancing with the stars");
    });
  });
}

class Parser {
  String parse(String metadata) {
    var splitedMetadata = metadata.split(" ");
    var result = splitedMetadata..removeAt(0);
    return result.join(" ");
  }
}
