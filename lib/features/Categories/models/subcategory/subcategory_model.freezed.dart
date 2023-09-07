// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subcategory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) {
  return _SubcategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SubcategoryModel {
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  @ColorSerializer()
  Color? get color1 => throw _privateConstructorUsedError;
  @ColorSerializer()
  Color? get color2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubcategoryModelCopyWith<SubcategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryModelCopyWith<$Res> {
  factory $SubcategoryModelCopyWith(
          SubcategoryModel value, $Res Function(SubcategoryModel) then) =
      _$SubcategoryModelCopyWithImpl<$Res, SubcategoryModel>;
  @useResult
  $Res call(
      {String? name,
      String? iconUrl,
      @ColorSerializer() Color? color1,
      @ColorSerializer() Color? color2});
}

/// @nodoc
class _$SubcategoryModelCopyWithImpl<$Res, $Val extends SubcategoryModel>
    implements $SubcategoryModelCopyWith<$Res> {
  _$SubcategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? iconUrl = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as Color?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubcategoryModelCopyWith<$Res>
    implements $SubcategoryModelCopyWith<$Res> {
  factory _$$_SubcategoryModelCopyWith(
          _$_SubcategoryModel value, $Res Function(_$_SubcategoryModel) then) =
      __$$_SubcategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? iconUrl,
      @ColorSerializer() Color? color1,
      @ColorSerializer() Color? color2});
}

/// @nodoc
class __$$_SubcategoryModelCopyWithImpl<$Res>
    extends _$SubcategoryModelCopyWithImpl<$Res, _$_SubcategoryModel>
    implements _$$_SubcategoryModelCopyWith<$Res> {
  __$$_SubcategoryModelCopyWithImpl(
      _$_SubcategoryModel _value, $Res Function(_$_SubcategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? iconUrl = freezed,
    Object? color1 = freezed,
    Object? color2 = freezed,
  }) {
    return _then(_$_SubcategoryModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color1: freezed == color1
          ? _value.color1
          : color1 // ignore: cast_nullable_to_non_nullable
              as Color?,
      color2: freezed == color2
          ? _value.color2
          : color2 // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubcategoryModel implements _SubcategoryModel {
  _$_SubcategoryModel(
      {required this.name,
      required this.iconUrl,
      @ColorSerializer() required this.color1,
      @ColorSerializer() required this.color2});

  factory _$_SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubcategoryModelFromJson(json);

  @override
  final String? name;
  @override
  final String? iconUrl;
  @override
  @ColorSerializer()
  final Color? color1;
  @override
  @ColorSerializer()
  final Color? color2;

  @override
  String toString() {
    return 'SubcategoryModel(name: $name, iconUrl: $iconUrl, color1: $color1, color2: $color2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubcategoryModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.color1, color1) || other.color1 == color1) &&
            (identical(other.color2, color2) || other.color2 == color2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, iconUrl, color1, color2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubcategoryModelCopyWith<_$_SubcategoryModel> get copyWith =>
      __$$_SubcategoryModelCopyWithImpl<_$_SubcategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubcategoryModelToJson(
      this,
    );
  }
}

abstract class _SubcategoryModel implements SubcategoryModel {
  factory _SubcategoryModel(
      {required final String? name,
      required final String? iconUrl,
      @ColorSerializer() required final Color? color1,
      @ColorSerializer() required final Color? color2}) = _$_SubcategoryModel;

  factory _SubcategoryModel.fromJson(Map<String, dynamic> json) =
      _$_SubcategoryModel.fromJson;

  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @ColorSerializer()
  Color? get color1;
  @override
  @ColorSerializer()
  Color? get color2;
  @override
  @JsonKey(ignore: true)
  _$$_SubcategoryModelCopyWith<_$_SubcategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
