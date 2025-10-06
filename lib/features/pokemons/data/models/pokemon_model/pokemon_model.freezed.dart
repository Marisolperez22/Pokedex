// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonModel {

 int get id; String get name; List<String> get types; String get image; int get weight; int get height;
/// Create a copy of PokemonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonModelCopyWith<PokemonModel> get copyWith => _$PokemonModelCopyWithImpl<PokemonModel>(this as PokemonModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.image, image) || other.image == image)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(types),image,weight,height);

@override
String toString() {
  return 'PokemonModel(id: $id, name: $name, types: $types, image: $image, weight: $weight, height: $height)';
}


}

/// @nodoc
abstract mixin class $PokemonModelCopyWith<$Res>  {
  factory $PokemonModelCopyWith(PokemonModel value, $Res Function(PokemonModel) _then) = _$PokemonModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<String> types, String image, int weight, int height
});




}
/// @nodoc
class _$PokemonModelCopyWithImpl<$Res>
    implements $PokemonModelCopyWith<$Res> {
  _$PokemonModelCopyWithImpl(this._self, this._then);

  final PokemonModel _self;
  final $Res Function(PokemonModel) _then;

/// Create a copy of PokemonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? types = null,Object? image = null,Object? weight = null,Object? height = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonModel].
extension PokemonModelPatterns on PokemonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonModel value)  $default,){
final _that = this;
switch (_that) {
case _PokemonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonModel value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<String> types,  String image,  int weight,  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonModel() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.image,_that.weight,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<String> types,  String image,  int weight,  int height)  $default,) {final _that = this;
switch (_that) {
case _PokemonModel():
return $default(_that.id,_that.name,_that.types,_that.image,_that.weight,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<String> types,  String image,  int weight,  int height)?  $default,) {final _that = this;
switch (_that) {
case _PokemonModel() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.image,_that.weight,_that.height);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonModel implements PokemonModel {
  const _PokemonModel({required this.id, required this.name, required final  List<String> types, required this.image, required this.weight, required this.height}): _types = types;
  

@override final  int id;
@override final  String name;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  String image;
@override final  int weight;
@override final  int height;

/// Create a copy of PokemonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonModelCopyWith<_PokemonModel> get copyWith => __$PokemonModelCopyWithImpl<_PokemonModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.image, image) || other.image == image)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_types),image,weight,height);

@override
String toString() {
  return 'PokemonModel(id: $id, name: $name, types: $types, image: $image, weight: $weight, height: $height)';
}


}

/// @nodoc
abstract mixin class _$PokemonModelCopyWith<$Res> implements $PokemonModelCopyWith<$Res> {
  factory _$PokemonModelCopyWith(_PokemonModel value, $Res Function(_PokemonModel) _then) = __$PokemonModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<String> types, String image, int weight, int height
});




}
/// @nodoc
class __$PokemonModelCopyWithImpl<$Res>
    implements _$PokemonModelCopyWith<$Res> {
  __$PokemonModelCopyWithImpl(this._self, this._then);

  final _PokemonModel _self;
  final $Res Function(_PokemonModel) _then;

/// Create a copy of PokemonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? types = null,Object? image = null,Object? weight = null,Object? height = null,}) {
  return _then(_PokemonModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
