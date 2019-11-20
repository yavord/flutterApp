import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class MedId extends Equatable {
  final String id;
  final String patientName;
  final String doctorName;
  final String doctorNumber;

  MedId({
    @required this.id,
    @required this.patientName,
    @required this.doctorName,
    @required this.doctorNumber,
  });

  @override
  List<Object> get props => [id, patientName, doctorName, doctorNumber];
}
