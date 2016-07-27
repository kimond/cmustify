import 'package:test/test.dart';
import 'package:cmustify/cmustify.dart';

main() {
  test("Should process metadata and send notification", () {
    Cmustify cmustify = new Cmustify();
    final String cmusData =
        "status playing title Super song artist Prinke album I love it";
    cmustify.handleData(cmusData);
  });
}
