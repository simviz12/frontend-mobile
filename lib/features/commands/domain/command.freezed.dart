// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceCommand {

 String get id; String get deviceId; CommandType get type; CommandStatus get status; String? get payload;// For message text or lock password
 DateTime get createdAt;
/// Create a copy of DeviceCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceCommandCopyWith<DeviceCommand> get copyWith => _$DeviceCommandCopyWithImpl<DeviceCommand>(this as DeviceCommand, _$identity);

  /// Serializes this DeviceCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceCommand&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,type,status,payload,createdAt);

@override
String toString() {
  return 'DeviceCommand(id: $id, deviceId: $deviceId, type: $type, status: $status, payload: $payload, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DeviceCommandCopyWith<$Res>  {
  factory $DeviceCommandCopyWith(DeviceCommand value, $Res Function(DeviceCommand) _then) = _$DeviceCommandCopyWithImpl;
@useResult
$Res call({
 String id, String deviceId, CommandType type, CommandStatus status, String? payload, DateTime createdAt
});




}
/// @nodoc
class _$DeviceCommandCopyWithImpl<$Res>
    implements $DeviceCommandCopyWith<$Res> {
  _$DeviceCommandCopyWithImpl(this._self, this._then);

  final DeviceCommand _self;
  final $Res Function(DeviceCommand) _then;

/// Create a copy of DeviceCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deviceId = null,Object? type = null,Object? status = null,Object? payload = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CommandType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommandStatus,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceCommand].
extension DeviceCommandPatterns on DeviceCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceCommand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceCommand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceCommand value)  $default,){
final _that = this;
switch (_that) {
case _DeviceCommand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceCommand value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceCommand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String deviceId,  CommandType type,  CommandStatus status,  String? payload,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceCommand() when $default != null:
return $default(_that.id,_that.deviceId,_that.type,_that.status,_that.payload,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String deviceId,  CommandType type,  CommandStatus status,  String? payload,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceCommand():
return $default(_that.id,_that.deviceId,_that.type,_that.status,_that.payload,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String deviceId,  CommandType type,  CommandStatus status,  String? payload,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceCommand() when $default != null:
return $default(_that.id,_that.deviceId,_that.type,_that.status,_that.payload,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceCommand implements DeviceCommand {
  const _DeviceCommand({required this.id, required this.deviceId, required this.type, required this.status, this.payload, required this.createdAt});
  factory _DeviceCommand.fromJson(Map<String, dynamic> json) => _$DeviceCommandFromJson(json);

@override final  String id;
@override final  String deviceId;
@override final  CommandType type;
@override final  CommandStatus status;
@override final  String? payload;
// For message text or lock password
@override final  DateTime createdAt;

/// Create a copy of DeviceCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceCommandCopyWith<_DeviceCommand> get copyWith => __$DeviceCommandCopyWithImpl<_DeviceCommand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceCommandToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceCommand&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceId,type,status,payload,createdAt);

@override
String toString() {
  return 'DeviceCommand(id: $id, deviceId: $deviceId, type: $type, status: $status, payload: $payload, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceCommandCopyWith<$Res> implements $DeviceCommandCopyWith<$Res> {
  factory _$DeviceCommandCopyWith(_DeviceCommand value, $Res Function(_DeviceCommand) _then) = __$DeviceCommandCopyWithImpl;
@override @useResult
$Res call({
 String id, String deviceId, CommandType type, CommandStatus status, String? payload, DateTime createdAt
});




}
/// @nodoc
class __$DeviceCommandCopyWithImpl<$Res>
    implements _$DeviceCommandCopyWith<$Res> {
  __$DeviceCommandCopyWithImpl(this._self, this._then);

  final _DeviceCommand _self;
  final $Res Function(_DeviceCommand) _then;

/// Create a copy of DeviceCommand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceId = null,Object? type = null,Object? status = null,Object? payload = freezed,Object? createdAt = null,}) {
  return _then(_DeviceCommand(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CommandType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommandStatus,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
