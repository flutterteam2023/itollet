import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/utils/timestamp_serializer.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required String fromUID,
    required String title,
    required String photoUrl,
    required String categoryID,
    required String? balanceMin,
    required String? balanceMax,
    required String description,
    @TimestampSerializer() required DateTime? createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
