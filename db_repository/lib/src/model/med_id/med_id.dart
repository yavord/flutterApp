import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class MedId extends Equatable {
  final int id;
  final List<Map> patientInfo;
  final List<Map> doctorInfo;

  MedId({
    @required this.id,
    @required this.patientInfo,
    @required this.doctorInfo,
  });

  @override
  List<Object> get props => [id, patientInfo, doctorInfo];

  MedId copyWith({int id, String patientName, List<Map> patientInfo, List<Map> doctorInfo}) {
    return MedId(
      id: id,
      patientInfo: patientInfo,
      doctorInfo: doctorInfo,
    );
  }

  //TODO: add to and from entity
}
