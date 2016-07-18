import 'package:test/test.dart';
import 'dart:io';

main() {
  group("Notify", () {
    test("Should send notification", () async {
      var notifySender = new NotifySend();
      var result = await notifySender.sendNotification("sum", "test");
      expect(result, 0);
    });
  });
}


class NotifySend {
  sendNotification(String summary, String content) async {
    List<String> arguments = [];
    arguments.add(summary);
    arguments.add(content);
    Process process = await Process.start("notify-send", arguments);
    return process.exitCode;
  }
}