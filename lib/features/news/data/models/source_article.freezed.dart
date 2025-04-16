// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceArticle {

 String get id; String get name;
/// Create a copy of SourceArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceArticleCopyWith<SourceArticle> get copyWith => _$SourceArticleCopyWithImpl<SourceArticle>(this as SourceArticle, _$identity);

  /// Serializes this SourceArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceArticle(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SourceArticleCopyWith<$Res>  {
  factory $SourceArticleCopyWith(SourceArticle value, $Res Function(SourceArticle) _then) = _$SourceArticleCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$SourceArticleCopyWithImpl<$Res>
    implements $SourceArticleCopyWith<$Res> {
  _$SourceArticleCopyWithImpl(this._self, this._then);

  final SourceArticle _self;
  final $Res Function(SourceArticle) _then;

/// Create a copy of SourceArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SourceArticle implements SourceArticle {
  const _SourceArticle({this.id = '', this.name = ''});
  factory _SourceArticle.fromJson(Map<String, dynamic> json) => _$SourceArticleFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;

/// Create a copy of SourceArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceArticleCopyWith<_SourceArticle> get copyWith => __$SourceArticleCopyWithImpl<_SourceArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceArticle(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SourceArticleCopyWith<$Res> implements $SourceArticleCopyWith<$Res> {
  factory _$SourceArticleCopyWith(_SourceArticle value, $Res Function(_SourceArticle) _then) = __$SourceArticleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$SourceArticleCopyWithImpl<$Res>
    implements _$SourceArticleCopyWith<$Res> {
  __$SourceArticleCopyWithImpl(this._self, this._then);

  final _SourceArticle _self;
  final $Res Function(_SourceArticle) _then;

/// Create a copy of SourceArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SourceArticle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
