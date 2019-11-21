import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MedIdEntity extends Equatable {
  final int id;
  final List<Map> patientInfo;
  final List<Map> doctorInfo;

  const MedIdEntity({
    @required this.id,
    @required this.patientInfo,
    @required this.doctorInfo,
  });

  @override
  List<Object> get props => [id, patientInfo, doctorInfo];

  Map<String, Object> toMap() {
    return{
      "id" : this.id,
      "patientInfo" : this.patientInfo,
      "doctorInfo" : this.doctorInfo,
    };
  }

  static MedIdEntity fromMap(Map<String, Object> json) {
    return MedIdEntity(
      id: json["id"],
      patientInfo: json["patientInfo"],
      doctorInfo: json["doctorInfo"],
    );
  }
}
