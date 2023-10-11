import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/InAppPurchase/data/model/Response/response_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState with _$PaymentState {
  factory PaymentState(
      {required bool isLoading,
      required List<PostModel> postModels,
      required List<PostModel> myPostList,
    required List<String> postUrls,
      required UserModel user,
      required String? html,
      required ResponseModel responseModel,
       required   WebViewController? controller,

      }) = _PaymentState;
  factory PaymentState.initial() => PaymentState(
        isLoading: false,
        postModels: [],
        myPostList: [],
        html: "",
        controller: WebViewController(),
        postUrls: [],
        responseModel: const ResponseModel(status: "", locale: "", systemTime: null, conversationId:"", threeDSHtmlContent: ""),
        user: const UserModel(
          totalBilling: null,
          uid: '', userName: '', email: '', createdAt: null, photoUrl: '',balance: null),
        
      );
}