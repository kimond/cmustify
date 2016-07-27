import 'package:cmustify/cmustify.dart';

main(List<String> args) {
  final String cmusData = args[0];
  Cmustify cmustify = new Cmustify();
  cmustify.handleData(cmusData);
}
