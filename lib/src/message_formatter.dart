import 'package:cmustify/src/metadata.dart';

class MessageFormatter {
  var metaData;

  setMetaData(Metadata metaData) {
    this.metaData = metaData;
  }

  String getMessage() {
    var notificationBody;
    if (this.metaData.getTagValue('title') != null) {
      notificationBody = this.metaData.getTagValue('title');
    } else {
      notificationBody = "Unknown";
    }

    if (this.metaData.getTagValue('artist') != null) {
      notificationBody += " by " + this.metaData.getTagValue('artist');

      if (this.metaData.getTagValue('album') != null) {
        notificationBody += ", " + this.metaData.getTagValue('album');
      }
    }

    return notificationBody;
  }
}
