import 'package:equatable/equatable.dart';


class MedIdEntity extends Equatable {
  final int id;
  final String patientName;
  final List<Map> patientInfo;
  final List<Map> doctorInfo;

  const MedIdEntity({
    this.id,
    this.patientName,
    this.patientInfo,
    this.doctorInfo,
  });

  @override
  List<Object> get props => [id, patientName, patientInfo, doctorInfo];
}