import 'package:equatable/equatable.dart';
import '../../../data/models/outlet_model.dart';

enum OutletStatus {
  initial,
  loading,
  success,
  failure,
}

class OutletState extends Equatable {
  final OutletStatus status;
  final List<OutletModel> outlets;
  final String? errorMessage;

  const OutletState({
    this.status = OutletStatus.initial,
    this.outlets = const [],
    this.errorMessage,
  });

  OutletState copyWith({
    OutletStatus? status,
    List<OutletModel>? outlets,
    String? errorMessage,
  }) {
    return OutletState(
      status: status ?? this.status,
      outlets: outlets ?? this.outlets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    outlets,
    errorMessage,
  ];
}