import 'package:test/test.dart';
import 'package:cmustify/src/parser.dart';
import 'package:cmustify/src/message_formatter.dart';

main() {
  Parser parser;
  MessageFormatter formatter;

  setUp(() {
    parser = new Parser();
    formatter = new MessageFormatter();
  });

  group("Message formatter", () {
    test("Should should format data with title", () {
      var result = parser.parse("status playing title Dancing with the stars");
      final message = formatter.formatMessage(result);
      expect(message, equals("Dancing with the stars"));
    });
    test("Should should format data with title and artist", () {
      var result = parser
          .parse("status playing title Dancing with the stars artist Jamo");
      final message = formatter.formatMessage(result);
      expect(message, equals("Dancing with the stars by Jamo"));
    });
    test("Should should format data with title, artist and album", () {
      var result = parser.parse(
          "status playing title Dancing with the stars artist Jamo album Best hits");
      final message = formatter.formatMessage(result);
      expect(message, equals("Dancing with the stars by Jamo, Best hits"));
    });
    test("Should should format data with no title, artist and album", () {
      var result = parser.parse("status playing artist Jamo album Best hits");
      final message = formatter.formatMessage(result);
      expect(message, equals("Unknown by Jamo, Best hits"));
    });
  });
}
