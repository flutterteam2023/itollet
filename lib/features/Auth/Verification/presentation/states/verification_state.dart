import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_state.freezed.dart';

@freezed
class VerificationState with _$VerificationState {
  factory VerificationState(
      {required bool isLoading,
      }) = _VerificationState;
  factory VerificationState.initial() => VerificationState(
        isLoading: false,
        
      );
}