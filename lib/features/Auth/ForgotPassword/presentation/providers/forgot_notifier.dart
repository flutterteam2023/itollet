

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/auth_exception_code.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/states/forgot_password_state.dart';

final forgotProvider =
    NotifierProvider.autoDispose<ForgotNotifier, ForgorPasswordState>(ForgotNotifier.new);

class ForgotNotifier extends AutoDisposeNotifier<ForgorPasswordState> {
  final _auth = FirebaseAuth.instance;
  @override
  ForgorPasswordState build() {
    
    return ForgorPasswordState.initial();
  }
  Future<void> resetPassword(BuildContext context, String email)async{
    if (email.isNotEmpty) {
      try {
        await _auth.sendPasswordResetEmail(email: email);
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
              title: ConstantAuthExceptions.successfull,
              message:ConstantAuthExceptions.goToLink,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
      }on FirebaseAuthException catch (e) {
        if (e.code ==ConstantAuthExceptions.unKnown ) {
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
              message:ConstantAuthExceptions.emailEmptyMessage,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));
          
        }else if(e.code ==ConstantAuthExceptions.invalidEmail ){
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
              message:ConstantAuthExceptions.emailFormatError,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));

        }else if(e.code == ConstantAuthExceptions.userNotFound){
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
              message:ConstantAuthExceptions.notFoundUserMessage,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));

        }else if(e.code==ConstantAuthExceptions.networkRequestFailed){
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
              message:ConstantAuthExceptions.internetWarningMessage,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));


        }else if(e.code == ConstantAuthExceptions.missingEmail){
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
              message:ConstantAuthExceptions.emailIsMissing,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));


        }else{
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
              message:ConstantAuthExceptions.limitError,

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.warning,
            ),
          ));

        }
        
      }
      
    }
    
  }

 
}
