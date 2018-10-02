import 'package:cmustify/src/metadata.dart';

class Parser {
  final String breakTag = "!break!";
  final List<String> validTags = [
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
    final result = new Metadata();
    var splitedMetadata = cmusMetadata.split(" ");
    splitedMetadata.add(breakTag);
    String lastFound = null;
    List<String> valueCollector = [];
    for (final part in splitedMetadata) {
      if (validTags.contains(part)) {
        if (valueCollector.isNotEmpty) {
          String joinedValue = valueCollector.join(" ");
          result.setTagValue(lastFound, joinedValue);
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
