

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Register/presentation/states/register_state.dart';

final registerProvider =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(RegisterNotifier.new);

class RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  @override
  RegisterState build() {
    
    return RegisterState.initial();
  }

  
}
