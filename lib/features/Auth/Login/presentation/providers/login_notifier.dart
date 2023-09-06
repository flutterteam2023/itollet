import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/auth_exception_code.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/data/model/loginModel/login_model.dart';
import 'package:itollet/features/Auth/Login/presentation/states/login_state.dart';

final loginProvider =
    NotifierProvider.autoDispose<LoginNotifier, LoginState>(LoginNotifier.new);

class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  final _auth = FirebaseAuth.instance;

  @override
  LoginState build() {
    return LoginState.initial();
  }

  Future<void> login(
      BuildContext context,String email,String password) async {
         final login = LoginModel(email: email, password: password);
    state = state.copyWith(loginModel:login );
    if (state.loginModel.email!.isNotEmpty && state.loginModel.password!.isNotEmpty) {
      try {
        state = state.copyWith(isLoading: true);

        await _auth
            .signInWithEmailAndPassword(email: state.loginModel.email!, password: state.loginModel.password!)
            .then((value) {
              ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar( SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.successfull,
              message: ConstantAuthExceptions.signIn,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.success,
            ),
          ));
         
        });
      } on FirebaseAuthException catch (e) {
        state = state.copyWith(isLoading: false);
        if (e.code == ConstantAuthExceptions.invalidEmail) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar( SnackBar(
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
                  ..showSnackBar( SnackBar(
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
            ),)
          
          );
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
                  ..showSnackBar( SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,

            content: AwesomeSnackbarContent(
              color: secondary,
              title: ConstantAuthExceptions.unsuccessful,
              message:  ConstantAuthExceptions.emailPasswordEmptyMessage,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
     
      
    }
  }
  void isCustomerControl(){
    state = state.copyWith(iscustomer: true);
  }
  void isSalesControl(){
    state = state.copyWith(iscustomer: false);
  }
 
  void visibleControl(){
    if (state.isVisible==true) {
      state = state.copyWith(isVisible: false);
      
    }else{
      state = state.copyWith(isVisible: true);

    }
  }
}
