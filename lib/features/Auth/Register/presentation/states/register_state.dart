import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/customer_register_model/customer_register_model.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/sales_reg%C5%9Fster_model/sales_register_model.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState(
      {required bool isLoading,
      required CustomerRegisterModel customerRegisterModel,
      required SalesRegisterModel salesRegisterModel,

      
      required bool iscustomer,
      required bool isVisible,
      required bool rePasswordVisible,
       required bool salesIsVisible,
       required bool isEmailVerified,
      required bool salesRePasswordVisible
      
      }) = _RegisterState;
  factory RegisterState.initial() => RegisterState(
    isEmailVerified: false,
        isLoading: false,
        customerRegisterModel: const CustomerRegisterModel( email: '', password: '',rePassword: '',userName: '',uid: '',photoUrl: '',balance: null),
        salesRegisterModel: SalesRegisterModel(email: '', companyName: '', companyPhone: '', password: '', rePassword: '', createdAt: DateTime.now()),
        iscustomer: true,
        isVisible:true ,
        rePasswordVisible: true,
        salesIsVisible: true,
        salesRePasswordVisible: true
        
      );
}