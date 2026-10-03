// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Device {

 String get id; String get name; String get status;// connected, offline, compromised
 int get batteryLevel; DateTime get lastSeen; bool get isProtected;
/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCopyWith<Device> get copyWith => _$DeviceCopyWithImpl<Device>(this as Device, _$identity);

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Device&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.isProtected, isProtected) || other.isProtected == isProtected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,batteryLevel,lastSeen,isProtected);

@override
String toString() {
  return 'Device(id: $id, name: $name, status: $status, batteryLevel: $batteryLevel, lastSeen: $lastSeen, isProtected: $isProtected)';
}


}

/// @nodoc
abstract mixin class $DeviceCopyWith<$Res>  {
  factory $DeviceCopyWith(Device value, $Res Function(Device) _then) = _$DeviceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String status, int batteryLevel, DateTime lastSeen, bool isProtected
});




}
/// @nodoc
class _$DeviceCopyWithImpl<$Res>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._self, this._then);

  final Device _self;
  final $Res Function(Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? batteryLevel = null,Object? lastSeen = null,Object? isProtected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,isProtected: null == isProtected ? _self.isProtected : isProtected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Device].
extension DevicePatterns on Device {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Device value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Device value)  $default,){
final _that = this;
switch (_that) {
case _Device():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Device value)?  $default,){
final _that = this;
switch (_that) {
case _Device() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int batteryLevel,  DateTime lastSeen,  bool isProtected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.batteryLevel,_that.lastSeen,_that.isProtected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int batteryLevel,  DateTime lastSeen,  bool isProtected)  $default,) {final _that = this;
switch (_that) {
case _Device():
return $default(_that.id,_that.name,_that.status,_that.batteryLevel,_that.lastSeen,_that.isProtected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String status,  int batteryLevel,  DateTime lastSeen,  bool isProtected)?  $default,) {final _that = this;
switch (_that) {
case _Device() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.batteryLevel,_that.lastSeen,_that.isProtected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Device implements Device {
  const _Device({required this.id, required this.name, required this.status, required this.batteryLevel, required this.lastSeen, required this.isProtected});
  factory _Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

@override final  String id;
@override final  String name;
@override final  String status;
// connected, offline, compromised
@override final  int batteryLevel;
@override final  DateTime lastSeen;
@override final  bool isProtected;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCopyWith<_Device> get copyWith => __$DeviceCopyWithImpl<_Device>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Device&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.batteryLevel, batteryLevel) || other.batteryLevel == batteryLevel)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.isProtected, isProtected) || other.isProtected == isProtected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,batteryLevel,lastSeen,isProtected);

@override
String toString() {
  return 'Device(id: $id, name: $name, status: $status, batteryLevel: $batteryLevel, lastSeen: $lastSeen, isProtected: $isProtected)';
}


}

/// @nodoc
abstract mixin class _$DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$DeviceCopyWith(_Device value, $Res Function(_Device) _then) = __$DeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String status, int batteryLevel, DateTime lastSeen, bool isProtected
});




}
/// @nodoc
class __$DeviceCopyWithImpl<$Res>
    implements _$DeviceCopyWith<$Res> {
  __$DeviceCopyWithImpl(this._self, this._then);

  final _Device _self;
  final $Res Function(_Device) _then;

/// Create a copy of Device
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? batteryLevel = null,Object? lastSeen = null,Object? isProtected = null,}) {
  return _then(_Device(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,batteryLevel: null == batteryLevel ? _self.batteryLevel : batteryLevel // ignore: cast_nullable_to_non_nullable
as int,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,isProtected: null == isProtected ? _self.isProtected : isProtected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
