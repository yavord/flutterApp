import 'package:intl/intl.dart';

main() {
  var string = '8:30';
  
  var take = DateFormat.Hm().parse(string);

  print(take.minute + take.hour*60);
  print(take.millisecondsSinceEpoch);
  print(DateTime.now().millisecondsSinceEpoch);

  print(take.runtimeType.toString());
  print(DateTime.now());
  print(take);
}