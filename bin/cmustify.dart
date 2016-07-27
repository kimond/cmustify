import 'package:cmustify/cmustify.dart';

main(List<String> args) {
  if (args.length > 0) {
    final cmusData = args[0];
    Cmustify cmustify = new Cmustify();
    cmustify.handleData(cmusData);
  }
}
