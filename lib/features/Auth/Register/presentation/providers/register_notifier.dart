

import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/customer_register_model/customer_register_model.dart';
import 'package:itollet/features/Auth/Register/presentation/states/register_state.dart';
import 'package:itollet/routing/app_router.dart';

final registerProvider =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(RegisterNotifier.new);

class RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  final _auth = FirebaseAuth.instance;
  @override
  RegisterState build() {
    
    return RegisterState.initial();
  }
  
  Future<void> customerSignUp(
    BuildContext context,
    String email,
    String password,
    String rePassword
) async {
  try {
    final customerRegisterModel = CustomerRegisterModel(email: email, password: password, rePassword: rePassword);
    state = state.copyWith(customerRegisterModel: customerRegisterModel);

    // Firebase Authentication ile kullanıcı kaydı oluştur
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: state.customerRegisterModel.email!,
        password: state.customerRegisterModel.password!
    );

    // Kullanıcı oluşturulduysa Firebase'e e-posta doğrulama gönder
    if (userCredential.user != null) {
      await userCredential.user!.sendEmailVerification();
      // ignore: use_build_context_synchronously
      context.pushRoute(const VerificationRoute());
    }

    // E-posta doğrulama gönderildikten sonra kullanıcıyı yönlendir
    // E-posta doğrulama yapması gerektiğine dair bilgilendirme ekleyebilirsiniz
    // Örneğin bir snackbar veya ekran üzerinde bir iletişim kutusu kullanabilirsiniz.

  } catch (e) {
    // Hata durumlarını burada ele alabilirsiniz.
    // Örneğin, e-posta adresi zaten kullanımda olabilir veya şifre gereksinimlerini karşılamıyor olabilir.
    // Hataları kullanıcıya göstermek veya işlem yapmak için uygun bir şekilde işleyebilirsiniz.
  }
}
void isCustomerControl(){
  state = state.copyWith(iscustomer: true);
}
void isSalesControl(){
  state = state.copyWith(iscustomer: false);
}

  
}
