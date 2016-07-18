import 'package:test/test.dart';
import 'dart:io';
import 'dart:async';

main() {
  group("Notify", () {
    test("Should send notification", () async {
      final notifySender = new NotifySend();
      final result = await notifySender.sendNotification("sum", "test");
    });
  });
}

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
