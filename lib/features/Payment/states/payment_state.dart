import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState(
      {required bool isLoading,
      required List<PostModel> postModels,
      required List<PostModel> myPostList,
    required List<String> postUrls,
      required UserModel user,
      }) = _PaymentState;
  factory PaymentState.initial() => PaymentState(
        isLoading: false,
        postModels: [],
        myPostList: [],
        postUrls: [],
        user: const UserModel(uid: '', userName: '', email: '', createdAt: null, photoUrl: '',balance: null),
        
      );
}