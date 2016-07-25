import 'package:cmustify/src/metadata.dart';

class MessageFormatter {
  String formatMessage(Metadata metaData) {
    var notificationBody;
    if (metaData.getTagValue('title') != null) {
      notificationBody = metaData.getTagValue('title');
    } else {
      notificationBody = "Unknown";
    }

    if (metaData.getTagValue('artist') != null) {
      final String artist = metaData.getTagValue('artist');
      notificationBody += " by $artist";

      if (metaData.getTagValue('album') != null) {
        final String album = metaData.getTagValue('album');
        notificationBody += ", $album";
      }
    }

    return notificationBody;
  }
}
