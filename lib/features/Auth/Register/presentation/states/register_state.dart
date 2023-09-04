import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState(
      {required bool isLoading,
      }) = _RegisterState;
  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        
      );
}