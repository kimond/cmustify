import 'package:test/test.dart';
import 'package:cmustify/src/parser.dart';
import 'package:cmustify/src/message_formatter.dart';

main() {
  var parser;

  setUp(() {
    parser = new Parser();
  });

  group("Message formatter", () {
    test("Should should receive data", () {
      var result = parser.parse("status playing title Dancing with the stars");
      final formatter = new MessageFormatter();
      formatter.setMetaData(result);
    });
    test("Should should format data with title", () {
      var result = parser.parse("status playing title Dancing with the stars");
      final formatter = new MessageFormatter();
      formatter.setMetaData(result);
      final message = formatter.getMessage();
      expect(message, equals("Dancing with the stars"));
    });
    test("Should should format data with title and artist", () {
      var result = parser
          .parse("status playing title Dancing with the stars artist Jamo");
      final formatter = new MessageFormatter();
      formatter.setMetaData(result);
      final message = formatter.getMessage();
      expect(message, equals("Dancing with the stars by Jamo"));
    });
    test("Should should format data with title, artist and album", () {
      var result = parser.parse(
          "status playing title Dancing with the stars artist Jamo album Best hits");
      final formatter = new MessageFormatter();
      formatter.setMetaData(result);
      final message = formatter.getMessage();
      expect(message, equals("Dancing with the stars by Jamo, Best hits"));
    });
    test("Should should format data with no title, artist and album", () {
      var result = parser.parse("status playing artist Jamo album Best hits");
      final formatter = new MessageFormatter();
      formatter.setMetaData(result);
      final message = formatter.getMessage();
      expect(message, equals("Unknown by Jamo, Best hits"));
    });
  });
}
