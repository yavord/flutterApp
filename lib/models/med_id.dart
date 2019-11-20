import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class MedId extends Equatable {
  final int id;
  final String patientName;
  final List<Map> patientInfo;
  final List<Map> doctorInfo;

  MedId({
    @required this.id,
    @required this.patientName,
    @required this.patientInfo,
    @required this.doctorInfo,
  });

  @override
  List<Object> get props => [id, patientName, patientInfo, doctorInfo];
}
