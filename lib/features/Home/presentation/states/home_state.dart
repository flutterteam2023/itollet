import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
      {required bool isLoading,
      required List<PostModel> postModels,
      required List<PostModel> myPostList,
    required List<String> postUrls,
      required UserModel user,
      required UserModel streamUser,

      }) = _HomeState;
  factory HomeState.initial() => HomeState(
        isLoading: false,
        postModels: [],
        myPostList: [],
        postUrls: [],
        streamUser: const UserModel(
          totalBilling: 0,
          uid: '', userName: '', email: '', createdAt: null, photoUrl: '',balance: 0),
        user: const UserModel(
          totalBilling: 0,
          uid: '', userName: '', email: '', createdAt: null, photoUrl: '',balance: 0),
        
      );
}