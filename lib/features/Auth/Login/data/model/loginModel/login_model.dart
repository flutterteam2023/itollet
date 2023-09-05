// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/utils/timestamp_serializer.dart';
// required: associates our `main.dart` with the code generated by Freezed
part 'login_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String? email,
    required String? password,
    


  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) => _$LoginModelFromJson(json);
}