import 'package:proba123/models/med_tile.dart';
import 'package:proba123/util/uuid.dart';


DateTime now = DateTime.now();

List<MedTile> medications = [
  MedTile(
    complete: false,
    id: Uuid().generateV4(),
    name: "Aerius 5mg",
    form: "tablet",
    dose: "1",
    doses: "6",
    schedule: "7:00",
    frequency: 3,
    start: new DateTime.utc(now.year, now.month, now.day-1, now.hour, now.minute),
  ),
  MedTile(
    complete: false,
    id: Uuid().generateV4(),
    name: "Paracetamol",
    form: "tablet",
    dose: "1",
    doses: "10",
    schedule: "20:30",
    frequency: 2,
    start: new DateTime.utc(now.year, now.month, now.day-1, now.hour, now.minute),
  ),
  MedTile(
    complete: false,
    id: Uuid().generateV4(),
    name: 'Аспиринец',
    form: 'tablet',
    dose: '2',
    doses: '20',
    schedule: '14:20',
    frequency: 2,
    start: new DateTime.utc(now.year, now.month, now.day-1, now.hour, now.minute),
  ),
];

