import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itollet/features/Categories/utils/color_serializer.dart';

part 'response_data_model.freezed.dart';
part 'response_data_model.g.dart';

@freezed
class ResponseDataModel with _$ResponseDataModel {
  factory ResponseDataModel({
    required String? status,
    required String? locale,
    required int? systemTime,
    required String? conversationId,
    required String? threeDSHtmlContent,

   
  }) = _ResponseDataModel;

  factory ResponseDataModel.fromJson(Map<String, dynamic> json) => _$ResponseDataModelFromJson(json);
}
