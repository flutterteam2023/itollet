import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgorPasswordState with _$ForgorPasswordState {
  factory ForgorPasswordState(
      {required bool isLoading,
      }) = _ForgorPasswordState;
  factory ForgorPasswordState.initial() => ForgorPasswordState(
        isLoading: false,
        
      );
}