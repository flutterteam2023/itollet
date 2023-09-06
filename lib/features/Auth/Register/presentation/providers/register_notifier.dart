import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/auth_exception_code.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/customer_register_model/customer_register_model.dart';
import 'package:itollet/features/Auth/Login/data/model/registerModel/sales_reg%C5%9Fster_model/sales_register_model.dart';
import 'package:itollet/features/Auth/Register/presentation/states/register_state.dart';
import 'package:itollet/routing/app_router.dart';

final registerProvider =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
        RegisterNotifier.new);

class RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  RegisterState build() {
    return RegisterState.initial();
  }

  Future<void> customerSignUp(BuildContext context, String email,
      String password, String rePassword) async {
    try {
      if (password == rePassword &&
          password.isNotEmpty &&
          rePassword.isNotEmpty) {
        if (password.length<6) {
           ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,

              content: AwesomeSnackbarContent(
                color: secondary,
                title: ConstantAuthExceptions.unsuccessful,
                message: 'Şifreniz 6 karakterden küçül olamaz!',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            ));
          
        }else{
          state = state.copyWith(isLoading: true);
        final customerRegisterModel = CustomerRegisterModel(
            email: email, password: password, rePassword: rePassword);
        state = state.copyWith(customerRegisterModel: customerRegisterModel);
        DateTime dateTime = DateTime.now(); // Örnek bir DateTime nesnesi
        Timestamp timestamp = Timestamp.fromDate(dateTime);

        // Firebase Authentication ile kullanıcı kaydı oluştur
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: state.customerRegisterModel.email!,
            password: state.customerRegisterModel.password!);
        await _firestore
            .collection("customers")
            .doc(_auth.currentUser?.uid)
            .set({
          'email': state.customerRegisterModel.email,
          'createdAt': timestamp
        }).then((value) {
          state = state.copyWith(isLoading: false);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,

              content: AwesomeSnackbarContent(
                color: secondary,
                title: ConstantAuthExceptions.successfull,
                message: ConstantAuthExceptions.registerSuccessful,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.success,
              ),
            ));
          context.pushRoute(const VerificationRoute());
        });

        // Kullanıcı oluşturulduysa Firebase'e e-posta doğrulama gönder
        if (userCredential.user != null) {
          await userCredential.user!.sendEmailVerification();
          // ignore: use_build_context_synchronously
          context.pushRoute(const VerificationRoute());
          if (userCredential.user!.emailVerified) {
            // Yönlendirme kodu burada
            // Örneğin, Navigator kullanarak giriş sayfasına yönlendirebilirsiniz.
            // ignore: use_build_context_synchronously
            context.pushRoute(const LoginRoute());
          }
        }
        }
      } else if (password.isEmpty || rePassword.isEmpty || email.isEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Hiçbir alan boş geçilemez!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Şifreler uyuşmuyor!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }

      // E-posta doğrulama gönderildikten sonra kullanıcıyı yönlendir
      // E-posta doğrulama yapması gerektiğine dair bilgilendirme ekleyebilirsiniz
      // Örneğin bir snackbar veya ekran üzerinde bir iletişim kutusu kullanabilirsiniz.
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      if (e.code == ConstantAuthExceptions.invalidEmail) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.emailIsInvalid,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else if (e.code == ConstantAuthExceptions.weakPassword) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.passwordIsWeak,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else if (e.code == ConstantAuthExceptions.emailAlreadyInUse) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.usingEmail,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Hiçbir alan boş geçilemez!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }
      // Hata durumlarını burada ele alabilirsiniz.
      // Örneğin, e-posta adresi zaten kullanımda olabilir veya şifre gereksinimlerini karşılamıyor olabilir.
      // Hataları kullanıcıya göstermek veya işlem yapmak için uygun bir şekilde işleyebilirsiniz.
    }
  }
  //******************************** */

  Future<void> salesSignUp(
      BuildContext context,
      String companyName,
      String companyPhoneNum,
      String email,
      String password,
      String rePassword) async {
    try {
      if (password == rePassword &&
          password.isNotEmpty &&
          rePassword.isNotEmpty&&
          companyName.isNotEmpty&&
          companyPhoneNum.isNotEmpty
          ) {
        if (password.length<6) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,

              content: AwesomeSnackbarContent(
                color: secondary,
                title: ConstantAuthExceptions.unsuccessful,
                message: 'Şifrebizin uzunluğu 6 karakterden küçük olamaz!',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.warning,
              ),
            ));
          
        }else{
          state = state.copyWith(isLoading: true);
        final salesRegisterModel = SalesRegisterModel(
          companyName: companyName,
          companyPhone: companyPhoneNum,
            email: email, password: password, rePassword: rePassword, createdAt: DateTime.now());
        state = state.copyWith(salesRegisterModel: salesRegisterModel);
        DateTime dateTime = DateTime.now(); // Örnek bir DateTime nesnesi
        Timestamp timestamp = Timestamp.fromDate(dateTime);

        // Firebase Authentication ile kullanıcı kaydı oluştur
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: state.salesRegisterModel.email!,
            password: state.salesRegisterModel.password!);
        await _firestore.collection("sales").doc(_auth.currentUser?.uid).set({
          'companyName':state.salesRegisterModel.companyName,
          'companyPhone':state.salesRegisterModel.companyPhone,
          'email': state.salesRegisterModel.email,
          'createdAt': timestamp
        }).then((value) {
          state = state.copyWith(isLoading: false);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,

              content: AwesomeSnackbarContent(
                color: secondary,
                title: ConstantAuthExceptions.successfull,
                message: ConstantAuthExceptions.registerSuccessful,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.success,
              ),
            ));
          context.pushRoute(const VerificationRoute());
        });

        // Kullanıcı oluşturulduysa Firebase'e e-posta doğrulama gönder
        if (userCredential.user != null) {
          await userCredential.user!.sendEmailVerification();
          // ignore: use_build_context_synchronously
          context.pushRoute(const VerificationRoute());
          if (userCredential.user!.emailVerified) {
            print("doğrulama yapılıd");
            // Yönlendirme kodu burada
            // Örneğin, Navigator kullanarak giriş sayfasına yönlendirebilirsiniz.
            // ignore: use_build_context_synchronously
            context.pushRoute(const LoginRoute());
          }
        }
        }
      }else if(rePassword!=password){
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Şifreler uyuşmuyor!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));

      } 
      else if (password.isEmpty || rePassword.isEmpty || email.isEmpty || companyName.isEmpty||companyPhoneNum.isEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Hiçbir alan boş geçilemez!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Şifreler uyuşmuyor!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }

      // E-posta doğrulama gönderildikten sonra kullanıcıyı yönlendir
      // E-posta doğrulama yapması gerektiğine dair bilgilendirme ekleyebilirsiniz
      // Örneğin bir snackbar veya ekran üzerinde bir iletişim kutusu kullanabilirsiniz.
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false);
      if (e.code == ConstantAuthExceptions.invalidEmail) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.emailIsInvalid,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else if (e.code == ConstantAuthExceptions.weakPassword) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.passwordIsWeak,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      } else if (e.code == ConstantAuthExceptions.emailAlreadyInUse) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: ConstantAuthExceptions.usingEmail,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));

          
      } 
      else if (password!=rePassword) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Şifreler uyuşmuyor!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }
      else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message: 'Hiçbir alan boşşş geçilemez!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }
      // Hata durumlarını burada ele alabilirsiniz.
      // Örneğin, e-posta adresi zaten kullanımda olabilir veya şifre gereksinimlerini karşılamıyor olabilir.
      // Hataları kullanıcıya göstermek veya işlem yapmak için uygun bir şekilde işleyebilirsiniz.
    }
  }

  void isCustomerControl() {
    state = state.copyWith(iscustomer: true);
  }

  void isSalesControl() {
    state = state.copyWith(iscustomer: false);
  }

  void visibleConrol() {
    if (state.isVisible == true) {
      state = state.copyWith(isVisible: false);
    } else {
      state = state.copyWith(isVisible: true);
    }
  }

  void rePasswordvisibleConrol() {
    if (state.rePasswordVisible == true) {
      state = state.copyWith(rePasswordVisible: false);
    } else {
      state = state.copyWith(rePasswordVisible: true);
    }
  }

  void salesVisibleConrol() {
    if (state.salesIsVisible == true) {
      state = state.copyWith(salesIsVisible: false);
    } else {
      state = state.copyWith(salesIsVisible: true);
    }
  }

  void salesRePasswordvisibleConrol() {
    if (state.salesRePasswordVisible == true) {
      state = state.copyWith(salesRePasswordVisible: false);
    } else {
      state = state.copyWith(salesRePasswordVisible: true);
    }
  }
  void emailVerificationControl(bool verificate){
    state = state.copyWith(isEmailVerified: verificate);

  }
}
