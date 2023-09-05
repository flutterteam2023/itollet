import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/customer_register_model/customer_register_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState(
      {required bool isLoading,
      required CustomerRegisterModel customerRegisterModel,
      required bool iscustomer
      }) = _RegisterState;
  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        customerRegisterModel: CustomerRegisterModel( email: '', password: '',rePassword: ''),
        iscustomer: true
        
      );
}