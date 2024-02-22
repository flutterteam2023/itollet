// ignore_for_file: use_build_context_synchronously, await_only_futures

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/auth_exception_code.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/data/model/loginModel/login_model.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Auth/Login/presentation/states/login_state.dart';
import 'package:itollet/routing/app_router.dart';

final loginProvider = NotifierProvider.autoDispose<LoginNotifier, LoginState>(LoginNotifier.new);

class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  final _auth = FirebaseAuth.instance;

  @override
  LoginState build() {
    return LoginState.initial();
  }

  Future<void> login(BuildContext context, String email, String password, WidgetRef ref) async {
    final login = LoginModel(email: email, password: password);
    state = state.copyWith(loginModel: login);
    if (state.loginModel.email!.isNotEmpty && state.loginModel.password!.isNotEmpty) {
      try {
        state = state.copyWith(isLoading: true);

        await _auth
            .signInWithEmailAndPassword(email: state.loginModel.email!, password: state.loginModel.password!)
            .then((value) {
          if (_auth.currentUser!.emailVerified) {
            context.pushRoute(const HomeRoute());
          } else {
            context.replaceRoute(const VerificationRoute());
          }
        });
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
                contentType: ContentType.failure,
              ),
            ));
        } else if (e.code == ConstantAuthExceptions.wrongPassword) {
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
                message: ConstantAuthExceptions.passwordIsWrong,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            ));
        } else if (e.code == ConstantAuthExceptions.userNotFound) {
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
                message: ConstantAuthExceptions.notFoundUserMessage,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            ));
        } else if (state.loginModel.email!.isEmpty || state.loginModel.password!.isEmpty) {
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
                message: ConstantAuthExceptions.emailPasswordEmptyMessage,

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            ));
        }
      }
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
            message: ConstantAuthExceptions.emailPasswordEmptyMessage,

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.warning,
          ),
        ));
    }
  }

  Future<void> deleteCollectionUser() async {
    final account = FirebaseFirestore.instance.collection("users").doc(_auth.currentUser?.uid);
    await account.delete();
  }

  Future<void> deleteUser(BuildContext context, String email, String password) async {
    try {
      User user = _auth.currentUser!;
    // ignore: unnecessary_null_comparison
    if (user != null) {
      await user
          .reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      )
          .then((value) async {
        try {
          await deleteCollectionUser();

          await user.delete();
        await  ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,

              content: AwesomeSnackbarContent(
                color: secondary,
                title: ConstantAuthExceptions.successfull,
                message: "Hesabınız Başarılı Bir Şekilde Silindi",

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            ));
          context.replaceRoute(const LoginRoute());
          print("User deleted successfully.");
        } on FirebaseAuthException catch (e) {
          if (e.code == ConstantAuthExceptions.passwordIsWrong) {
            // ignore: use_build_context_synchronously
          return  ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.white,

                content: AwesomeSnackbarContent(
                  color: secondary,
                  title: ConstantAuthExceptions.successfull,
                  message: 'Şifreniz Yanlış',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.failure,
                ),
              ));
          }else if(e.code == ConstantAuthExceptions.passwordIsWeak){
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
                  message: 'Şifreniz Yanlış',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.failure,
                ),
              ));

          }
        }
      });
    } else {
      print("No user found.");
    }
      
    } catch (e) {
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
                  message: 'Şifreyi Doğrulayamadık Lütfen Tekrar Deneyiniz',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.failure,
                ),
              ));

      
    }
    // try {

    // } catch (error) {
    //   ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(SnackBar(
    //       /// need to set following properties for best effect of awesome_snackbar_content
    //       elevation: 0,
    //       behavior: SnackBarBehavior.floating,
    //       backgroundColor: Colors.white,

    //       content: AwesomeSnackbarContent(
    //         color: secondary,
    //         title: ConstantAuthExceptions.successfull,
    //         message: "Bir Sorun Oluştu Lütfen Sonra Bir Daha Deneyiniz",

    //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //         contentType: ContentType.failure,
    //       ),
    //     ));
    // }
  }

  void isCustomerControl() {
    state = state.copyWith(iscustomer: true);
  }

  void isSalesControl() {
    state = state.copyWith(iscustomer: false);
  }

  void visibleControl() {
    if (state.isVisible == true) {
      state = state.copyWith(isVisible: false);
    } else {
      state = state.copyWith(isVisible: true);
    }
  }

  ///get document function
  Future<void> getUser() async {
    final db = FirebaseFirestore.instance;
    UserModel? user;
    try {
      await db
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .get()
          .then((value) {
        user = value.data()!;
        print("user geldi");
      });
    } catch (e) {
      print("users başarısız");
    }
    state = state.copyWith(user: user!);
  }
}
