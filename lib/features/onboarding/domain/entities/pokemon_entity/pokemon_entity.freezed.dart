// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonEntity {

 int get id; String get name; String get imageUrl; List<String> get types;
/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonEntityCopyWith<PokemonEntity> get copyWith => _$PokemonEntityCopyWithImpl<PokemonEntity>(this as PokemonEntity, _$identity);

  /// Serializes this PokemonEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.types, types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(types));

@override
String toString() {
  return 'PokemonEntity(id: $id, name: $name, imageUrl: $imageUrl, types: $types)';
}


}

/// @nodoc
abstract mixin class $PokemonEntityCopyWith<$Res>  {
  factory $PokemonEntityCopyWith(PokemonEntity value, $Res Function(PokemonEntity) _then) = _$PokemonEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String imageUrl, List<String> types
});




}
/// @nodoc
class _$PokemonEntityCopyWithImpl<$Res>
    implements $PokemonEntityCopyWith<$Res> {
  _$PokemonEntityCopyWithImpl(this._self, this._then);

  final PokemonEntity _self;
  final $Res Function(PokemonEntity) _then;

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? types = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonEntity].
extension PokemonEntityPatterns on PokemonEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonEntity value)  $default,){
final _that = this;
switch (_that) {
case _PokemonEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  List<String> types)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.types);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  List<String> types)  $default,) {final _that = this;
switch (_that) {
case _PokemonEntity():
return $default(_that.id,_that.name,_that.imageUrl,_that.types);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String imageUrl,  List<String> types)?  $default,) {final _that = this;
switch (_that) {
case _PokemonEntity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.types);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonEntity implements PokemonEntity {
  const _PokemonEntity({required this.id, required this.name, required this.imageUrl, required final  List<String> types}): _types = types;
  factory _PokemonEntity.fromJson(Map<String, dynamic> json) => _$PokemonEntityFromJson(json);

@override final  int id;
@override final  String name;
@override final  String imageUrl;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}


/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonEntityCopyWith<_PokemonEntity> get copyWith => __$PokemonEntityCopyWithImpl<_PokemonEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._types, _types));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(_types));

@override
String toString() {
  return 'PokemonEntity(id: $id, name: $name, imageUrl: $imageUrl, types: $types)';
}


}

/// @nodoc
abstract mixin class _$PokemonEntityCopyWith<$Res> implements $PokemonEntityCopyWith<$Res> {
  factory _$PokemonEntityCopyWith(_PokemonEntity value, $Res Function(_PokemonEntity) _then) = __$PokemonEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String imageUrl, List<String> types
});




}
/// @nodoc
class __$PokemonEntityCopyWithImpl<$Res>
    implements _$PokemonEntityCopyWith<$Res> {
  __$PokemonEntityCopyWithImpl(this._self, this._then);

  final _PokemonEntity _self;
  final $Res Function(_PokemonEntity) _then;

/// Create a copy of PokemonEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? types = null,}) {
  return _then(_PokemonEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
