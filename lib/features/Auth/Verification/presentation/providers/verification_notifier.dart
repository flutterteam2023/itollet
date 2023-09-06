
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Verification/presentation/states/verification_state.dart';
import 'package:url_launcher/url_launcher.dart';

final verificationProvider =
    NotifierProvider.autoDispose<VerificationNotifier, VerificationState>(VerificationNotifier.new);

class VerificationNotifier extends AutoDisposeNotifier<VerificationState> {
  @override
  VerificationState build() {

    return VerificationState.initial();
  }
void launchEmailApp() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: ''
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'E-posta uygulaması başlatılamadı.';
    }
  }
  
}
