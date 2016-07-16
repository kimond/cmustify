import 'package:cmustify/src/metadata.dart';

class Parser {
  final String breakKey = "!break!";
  final List<String> validKeys = [
    'status',
    'url',
    'file',
    'artist',
    'album',
    'discnumber',
    'tracknumber',
    'title',
    'date',
    'duration',
    '!break!'
  ];

  Metadata parse(String cmusMetadata) {
    var result = new Metadata();
    var splitedMetadata = cmusMetadata.split(" ");
    splitedMetadata.add(breakKey);
    String lastFound = null;
    List<String> valueCollector = [];
    for (var part in splitedMetadata) {
      if (validKeys.contains(part)) {
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
