import 'dart:async';
import 'dart:io';

abstract class Notifier {
  Future<Null> sendNotification(String summary, String content);
}

class NotifySend extends Notifier {
  Future<Null> sendNotification(String summary, String content) async {
    List<String> arguments = <String>[];
    arguments.add(summary);
    arguments.add(content);
    await Process.start("notify-send", arguments);
  }
}
