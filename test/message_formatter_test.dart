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

  final testData = [
    {
      #description: 'Should format data with title',
      #metaData: 'status playing title Dancing with the stars',
      #expected: 'Dancing with the stars'
    },
    {
      #description: 'Should format data with title and artist',
      #metaData: 'status playing title Dancing with the stars artist Jamo',
      #expected: 'Dancing with the stars by Jamo'
    },
    {
      #description: 'Should format data with title, artis and album',
      #metaData:
          'status playing title Dancing with the stars artist Jamo album Best hits',
      #expected: 'Dancing with the stars by Jamo, Best hits'
    },
    {
      #description: 'Should format data with no title, artis and album',
      #metaData: 'status playing artist Jamo album Best hits album Best hits',
      #expected: 'Unknown by Jamo, Best hits'
    },
  ];

  testData.forEach((data) {
    test(data[#description], () {
      var result = parser.parse(data[#metaData]);
      final message = formatter.formatMessage(result);
      expect(message, data[#expected]);
    });
  });
}
