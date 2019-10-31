import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:proba123/util/uuid.dart';


@immutable
class MedId extends Equatable {
  final String id;
  final String patientName;
  final String doctorName;
  final String doctorNumber;

  MedId({
    String id,
    @required this.patientName,
    @required this.doctorName,
    @required this.doctorNumber,
  }) : 
        this.id = id ?? Uuid().generateV4();

  @override
  List<Object> get props => [id, patientName, doctorName, doctorNumber];
}