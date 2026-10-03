// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_actions_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuickActionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickActionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuickActionsState()';
}


}

/// @nodoc
class $QuickActionsStateCopyWith<$Res>  {
$QuickActionsStateCopyWith(QuickActionsState _, $Res Function(QuickActionsState) __);
}


/// Adds pattern-matching-related methods to [QuickActionsState].
extension QuickActionsStatePatterns on QuickActionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Sending value)?  sending,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Sending() when sending != null:
return sending(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Sending value)  sending,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Sending():
return sending(_that);case _Success():
return success(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Sending value)?  sending,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Sending() when sending != null:
return sending(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( CommandType type)?  sending,TResult Function( DeviceCommand command)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Sending() when sending != null:
return sending(_that.type);case _Success() when success != null:
return success(_that.command);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( CommandType type)  sending,required TResult Function( DeviceCommand command)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Sending():
return sending(_that.type);case _Success():
return success(_that.command);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( CommandType type)?  sending,TResult? Function( DeviceCommand command)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Sending() when sending != null:
return sending(_that.type);case _Success() when success != null:
return success(_that.command);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements QuickActionsState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuickActionsState.idle()';
}


}




/// @nodoc


class _Sending implements QuickActionsState {
  const _Sending(this.type);
  

 final  CommandType type;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendingCopyWith<_Sending> get copyWith => __$SendingCopyWithImpl<_Sending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sending&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'QuickActionsState.sending(type: $type)';
}


}

/// @nodoc
abstract mixin class _$SendingCopyWith<$Res> implements $QuickActionsStateCopyWith<$Res> {
  factory _$SendingCopyWith(_Sending value, $Res Function(_Sending) _then) = __$SendingCopyWithImpl;
@useResult
$Res call({
 CommandType type
});




}
/// @nodoc
class __$SendingCopyWithImpl<$Res>
    implements _$SendingCopyWith<$Res> {
  __$SendingCopyWithImpl(this._self, this._then);

  final _Sending _self;
  final $Res Function(_Sending) _then;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_Sending(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CommandType,
  ));
}


}

/// @nodoc


class _Success implements QuickActionsState {
  const _Success(this.command);
  

 final  DeviceCommand command;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.command, command) || other.command == command));
}


@override
int get hashCode => Object.hash(runtimeType,command);

@override
String toString() {
  return 'QuickActionsState.success(command: $command)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $QuickActionsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 DeviceCommand command
});


$DeviceCommandCopyWith<$Res> get command;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? command = null,}) {
  return _then(_Success(
null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as DeviceCommand,
  ));
}

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceCommandCopyWith<$Res> get command {
  
  return $DeviceCommandCopyWith<$Res>(_self.command, (value) {
    return _then(_self.copyWith(command: value));
  });
}
}

/// @nodoc


class _Error implements QuickActionsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'QuickActionsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $QuickActionsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of QuickActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
