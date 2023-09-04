
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/states/forgot_password_state.dart';

final homeProvider =
    NotifierProvider.autoDispose<ForgotNotifier, ForgorPasswordState>(ForgotNotifier.new);

class ForgotNotifier extends AutoDisposeNotifier<ForgorPasswordState> {
  @override
  ForgorPasswordState build() {
    
    return ForgorPasswordState.initial();
  }

 
}
