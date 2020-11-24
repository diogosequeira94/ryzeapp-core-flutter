// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TodoItemTearOff {
  const _$TodoItemTearOff();

  _TodoItem call(
      {@required UniqueId uniqueId,
      @required TodoName name,
      @required bool done}) {
    return _TodoItem(
      uniqueId: uniqueId,
      name: name,
      done: done,
    );
  }
}

// ignore: unused_element
const $TodoItem = _$TodoItemTearOff();

mixin _$TodoItem {
  UniqueId get uniqueId;
  TodoName get name;
  bool get done;

  $TodoItemCopyWith<TodoItem> get copyWith;
}

abstract class $TodoItemCopyWith<$Res> {
  factory $TodoItemCopyWith(TodoItem value, $Res Function(TodoItem) then) =
      _$TodoItemCopyWithImpl<$Res>;
  $Res call({UniqueId uniqueId, TodoName name, bool done});
}

class _$TodoItemCopyWithImpl<$Res> implements $TodoItemCopyWith<$Res> {
  _$TodoItemCopyWithImpl(this._value, this._then);

  final TodoItem _value;
  // ignore: unused_field
  final $Res Function(TodoItem) _then;

  @override
  $Res call({
    Object uniqueId = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      uniqueId: uniqueId == freezed ? _value.uniqueId : uniqueId as UniqueId,
      name: name == freezed ? _value.name : name as TodoName,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

abstract class _$TodoItemCopyWith<$Res> implements $TodoItemCopyWith<$Res> {
  factory _$TodoItemCopyWith(_TodoItem value, $Res Function(_TodoItem) then) =
      __$TodoItemCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId uniqueId, TodoName name, bool done});
}

class __$TodoItemCopyWithImpl<$Res> extends _$TodoItemCopyWithImpl<$Res>
    implements _$TodoItemCopyWith<$Res> {
  __$TodoItemCopyWithImpl(_TodoItem _value, $Res Function(_TodoItem) _then)
      : super(_value, (v) => _then(v as _TodoItem));

  @override
  _TodoItem get _value => super._value as _TodoItem;

  @override
  $Res call({
    Object uniqueId = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_TodoItem(
      uniqueId: uniqueId == freezed ? _value.uniqueId : uniqueId as UniqueId,
      name: name == freezed ? _value.name : name as TodoName,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

class _$_TodoItem implements _TodoItem {
  const _$_TodoItem(
      {@required this.uniqueId, @required this.name, @required this.done})
      : assert(uniqueId != null),
        assert(name != null),
        assert(done != null);

  @override
  final UniqueId uniqueId;
  @override
  final TodoName name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItem(uniqueId: $uniqueId, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoItem &&
            (identical(other.uniqueId, uniqueId) ||
                const DeepCollectionEquality()
                    .equals(other.uniqueId, uniqueId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uniqueId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(done);

  @override
  _$TodoItemCopyWith<_TodoItem> get copyWith =>
      __$TodoItemCopyWithImpl<_TodoItem>(this, _$identity);
}

abstract class _TodoItem implements TodoItem {
  const factory _TodoItem(
      {@required UniqueId uniqueId,
      @required TodoName name,
      @required bool done}) = _$_TodoItem;

  @override
  UniqueId get uniqueId;
  @override
  TodoName get name;
  @override
  bool get done;
  @override
  _$TodoItemCopyWith<_TodoItem> get copyWith;
}
