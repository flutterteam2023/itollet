
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Verification/presentation/states/verification_state.dart';

final verificationProvider =
    NotifierProvider.autoDispose<VerificationNotifier, VerificationState>(VerificationNotifier.new);

class VerificationNotifier extends AutoDisposeNotifier<VerificationState> {
  @override
  VerificationState build() {

    return VerificationState.initial();
  }

  
}
