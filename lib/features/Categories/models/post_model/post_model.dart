import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/utils/timestamp_serializer.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel(
      {required String? balanceMax,
      required String? balanceMin,
      required String categoryID,
      @TimestampSerializer() required DateTime? createdAt,
      required String description,
      required String fromUID,
      required String photoUrl,
      required String title}) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
