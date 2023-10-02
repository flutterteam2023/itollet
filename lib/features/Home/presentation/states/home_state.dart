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
      }) = _HomeState;
  factory HomeState.initial() => HomeState(
        isLoading: false,
        postModels: [],
        myPostList: [],
        postUrls: [],
        user: const UserModel(uid: '', userName: '', email: '', createdAt: null, photoUrl: '',balance: null),
        
      );
}