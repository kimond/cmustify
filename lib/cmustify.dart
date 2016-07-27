import 'package:cmustify/src/message_formatter.dart';
import 'package:cmustify/src/parser.dart';
import 'package:cmustify/notifier.dart';
import 'package:cmustify/src/metadata.dart';

class Cmustify {
  Parser parser;
  MessageFormatter messageFormatter;
  NotifySend notifySend;

  Cmustify() {
    this.parser = new Parser();
    this.messageFormatter = new MessageFormatter();
    this.notifySend = new NotifySend();
  }

  void handleData(String cmusData) {
    final Metadata metaData = this.parser.parse(cmusData);
    final notificationMessage = this.messageFormatter.formatMessage(metaData);
    this
        .notifySend
        .sendNotification("Cmustify - Current song", notificationMessage);
  }
}
