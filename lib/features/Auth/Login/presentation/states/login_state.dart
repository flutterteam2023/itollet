import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/loginModel/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {required bool isLoading,
      required bool isVisible,
      required bool iscustomer,
      required LoginModel loginModel
      }) = _LoginState;
  factory LoginState.initial() => LoginState(
        isLoading: false,
        isVisible: true,
        iscustomer: true,
        loginModel: const LoginModel(email: '', password: '')
        
      );
}