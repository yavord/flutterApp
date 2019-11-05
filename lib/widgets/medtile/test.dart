import 'package:intl/intl.dart';

main() {
  var string = '8:30';
  
  var x = new DateTime.utc(1980, 4, 30);
  var y = new DateTime.utc(1980, 4, x.day+4);
  
  Duration yx = y.difference(x);

  print(yx.inMinutes.runtimeType.toString());
}