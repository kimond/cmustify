import 'package:test/test.dart';
import 'package:cmustify/notifier.dart';

main() {
  group("Notify", () {
    test("Should send notification", () async {
      final notifySender = new NotifySend();
      await notifySender.sendNotification("sum", "test");
    });
  });
}
