import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MedIdEntity extends Equatable {
  final int id;
  final String patientName;
  final List<Map> patientInfo;
  final List<Map> doctorInfo;

  const MedIdEntity({
    @required this.id,
    @required this.patientName,
    @required this.patientInfo,
    @required this.doctorInfo,
  });

  @override
  List<Object> get props => [id, patientName, patientInfo, doctorInfo];

  Map<String, Object> toMap() {
    return{
      "id" : this.id,
      "patientName" : this.patientName,
      "patientInfo" : this.patientInfo,
      "doctorInfo" : this.doctorInfo,
    };
  }

  static MedIdEntity fromMap(Map<String, Object> json) {
    return MedIdEntity(
      id: json["id"],
      patientName:  json["patientName"],
      patientInfo: json["patientInfo"],
      doctorInfo: json["doctorInfo"],
    );
  }

  @override
  String toString() => 'MedIdEntity : { $patientName }';
}
