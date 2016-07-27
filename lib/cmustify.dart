import 'package:cmustify/src/message_formatter.dart';
import 'package:cmustify/src/parser.dart';
import 'package:cmustify/notifier.dart';

class Cmustify {
  Parser parser;
  MessageFormatter messageFormatter;
  NotifySend notifySend;

  Cmustify() {
    parser = new Parser();
    messageFormatter = new MessageFormatter();
    notifySend = new NotifySend();
  }

  void handleData(String cmusData) {
    final metaData = parser.parse(cmusData);
    final notificationMessage = messageFormatter.formatMessage(metaData);
    notifySend.sendNotification("Cmustify - Current song", notificationMessage);
  }
}
