import 'package:intl/intl.dart';

main() {
  var string = '8:30';
  
  var take = DateFormat.Hm().parse(string);
  
}