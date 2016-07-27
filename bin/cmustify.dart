import 'package:cmustify/cmustify.dart';

main(List<String> args) {
  if (args.isNotEmpty) {
    final cmusData = args.join(" ");
    Cmustify cmustify = new Cmustify();
    cmustify.handleData(cmusData);
  }
}
