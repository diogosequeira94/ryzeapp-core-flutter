// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'note_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$NoteFormEventTearOff {
  const _$NoteFormEventTearOff();

  _Initialized initialized(Option<Note> existingInitialNote) {
    return _Initialized(
      existingInitialNote,
    );
  }

  _BodyChanged bodyChanged(String bodyString) {
    return _BodyChanged(
      bodyString,
    );
  }

  _ColorChanged colorChanged(Color color) {
    return _ColorChanged(
      color,
    );
  }

  _TodosChanged todosChanged(List<TodoItemPrimitive> todoList) {
    return _TodosChanged(
      todoList,
    );
  }

  Saved saved() {
    return const Saved();
  }
}

// ignore: unused_element
const $NoteFormEvent = _$NoteFormEventTearOff();

mixin _$NoteFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  });
}

abstract class $NoteFormEventCopyWith<$Res> {
  factory $NoteFormEventCopyWith(
          NoteFormEvent value, $Res Function(NoteFormEvent) then) =
      _$NoteFormEventCopyWithImpl<$Res>;
}

class _$NoteFormEventCopyWithImpl<$Res>
    implements $NoteFormEventCopyWith<$Res> {
  _$NoteFormEventCopyWithImpl(this._value, this._then);

  final NoteFormEvent _value;
  // ignore: unused_field
  final $Res Function(NoteFormEvent) _then;
}

abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Note> existingInitialNote});
}

class __$InitializedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object existingInitialNote = freezed,
  }) {
    return _then(_Initialized(
      existingInitialNote == freezed
          ? _value.existingInitialNote
          : existingInitialNote as Option<Note>,
    ));
  }
}

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.existingInitialNote)
      : assert(existingInitialNote != null);

  @override
  final Option<Note> existingInitialNote;

  @override
  String toString() {
    return 'NoteFormEvent.initialized(existingInitialNote: $existingInitialNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.existingInitialNote, existingInitialNote) ||
                const DeepCollectionEquality()
                    .equals(other.existingInitialNote, existingInitialNote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(existingInitialNote);

  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return initialized(existingInitialNote);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(existingInitialNote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements NoteFormEvent {
  const factory _Initialized(Option<Note> existingInitialNote) = _$_Initialized;

  Option<Note> get existingInitialNote;
  _$InitializedCopyWith<_Initialized> get copyWith;
}

abstract class _$BodyChangedCopyWith<$Res> {
  factory _$BodyChangedCopyWith(
          _BodyChanged value, $Res Function(_BodyChanged) then) =
      __$BodyChangedCopyWithImpl<$Res>;
  $Res call({String bodyString});
}

class __$BodyChangedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$BodyChangedCopyWith<$Res> {
  __$BodyChangedCopyWithImpl(
      _BodyChanged _value, $Res Function(_BodyChanged) _then)
      : super(_value, (v) => _then(v as _BodyChanged));

  @override
  _BodyChanged get _value => super._value as _BodyChanged;

  @override
  $Res call({
    Object bodyString = freezed,
  }) {
    return _then(_BodyChanged(
      bodyString == freezed ? _value.bodyString : bodyString as String,
    ));
  }
}

class _$_BodyChanged implements _BodyChanged {
  const _$_BodyChanged(this.bodyString) : assert(bodyString != null);

  @override
  final String bodyString;

  @override
  String toString() {
    return 'NoteFormEvent.bodyChanged(bodyString: $bodyString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BodyChanged &&
            (identical(other.bodyString, bodyString) ||
                const DeepCollectionEquality()
                    .equals(other.bodyString, bodyString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bodyString);

  @override
  _$BodyChangedCopyWith<_BodyChanged> get copyWith =>
      __$BodyChangedCopyWithImpl<_BodyChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return bodyChanged(bodyString);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (bodyChanged != null) {
      return bodyChanged(bodyString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return bodyChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (bodyChanged != null) {
      return bodyChanged(this);
    }
    return orElse();
  }
}

abstract class _BodyChanged implements NoteFormEvent {
  const factory _BodyChanged(String bodyString) = _$_BodyChanged;

  String get bodyString;
  _$BodyChangedCopyWith<_BodyChanged> get copyWith;
}

abstract class _$ColorChangedCopyWith<$Res> {
  factory _$ColorChangedCopyWith(
          _ColorChanged value, $Res Function(_ColorChanged) then) =
      __$ColorChangedCopyWithImpl<$Res>;
  $Res call({Color color});
}

class __$ColorChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$ColorChangedCopyWith<$Res> {
  __$ColorChangedCopyWithImpl(
      _ColorChanged _value, $Res Function(_ColorChanged) _then)
      : super(_value, (v) => _then(v as _ColorChanged));

  @override
  _ColorChanged get _value => super._value as _ColorChanged;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_ColorChanged(
      color == freezed ? _value.color : color as Color,
    ));
  }
}

class _$_ColorChanged implements _ColorChanged {
  const _$_ColorChanged(this.color) : assert(color != null);

  @override
  final Color color;

  @override
  String toString() {
    return 'NoteFormEvent.colorChanged(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorChanged &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @override
  _$ColorChangedCopyWith<_ColorChanged> get copyWith =>
      __$ColorChangedCopyWithImpl<_ColorChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return colorChanged(color);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (colorChanged != null) {
      return colorChanged(color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return colorChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (colorChanged != null) {
      return colorChanged(this);
    }
    return orElse();
  }
}

abstract class _ColorChanged implements NoteFormEvent {
  const factory _ColorChanged(Color color) = _$_ColorChanged;

  Color get color;
  _$ColorChangedCopyWith<_ColorChanged> get copyWith;
}

abstract class _$TodosChangedCopyWith<$Res> {
  factory _$TodosChangedCopyWith(
          _TodosChanged value, $Res Function(_TodosChanged) then) =
      __$TodosChangedCopyWithImpl<$Res>;
  $Res call({List<TodoItemPrimitive> todoList});
}

class __$TodosChangedCopyWithImpl<$Res>
    extends _$NoteFormEventCopyWithImpl<$Res>
    implements _$TodosChangedCopyWith<$Res> {
  __$TodosChangedCopyWithImpl(
      _TodosChanged _value, $Res Function(_TodosChanged) _then)
      : super(_value, (v) => _then(v as _TodosChanged));

  @override
  _TodosChanged get _value => super._value as _TodosChanged;

  @override
  $Res call({
    Object todoList = freezed,
  }) {
    return _then(_TodosChanged(
      todoList == freezed
          ? _value.todoList
          : todoList as List<TodoItemPrimitive>,
    ));
  }
}

class _$_TodosChanged implements _TodosChanged {
  const _$_TodosChanged(this.todoList) : assert(todoList != null);

  @override
  final List<TodoItemPrimitive> todoList;

  @override
  String toString() {
    return 'NoteFormEvent.todosChanged(todoList: $todoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodosChanged &&
            (identical(other.todoList, todoList) ||
                const DeepCollectionEquality()
                    .equals(other.todoList, todoList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todoList);

  @override
  _$TodosChangedCopyWith<_TodosChanged> get copyWith =>
      __$TodosChangedCopyWithImpl<_TodosChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return todosChanged(todoList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (todosChanged != null) {
      return todosChanged(todoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return todosChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (todosChanged != null) {
      return todosChanged(this);
    }
    return orElse();
  }
}

abstract class _TodosChanged implements NoteFormEvent {
  const factory _TodosChanged(List<TodoItemPrimitive> todoList) =
      _$_TodosChanged;

  List<TodoItemPrimitive> get todoList;
  _$TodosChangedCopyWith<_TodosChanged> get copyWith;
}

abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
}

class _$SavedCopyWithImpl<$Res> extends _$NoteFormEventCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;
}

class _$Saved implements Saved {
  const _$Saved();

  @override
  String toString() {
    return 'NoteFormEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Note> existingInitialNote),
    @required Result bodyChanged(String bodyString),
    @required Result colorChanged(Color color),
    @required Result todosChanged(List<TodoItemPrimitive> todoList),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Note> existingInitialNote),
    Result bodyChanged(String bodyString),
    Result colorChanged(Color color),
    Result todosChanged(List<TodoItemPrimitive> todoList),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result bodyChanged(_BodyChanged value),
    @required Result colorChanged(_ColorChanged value),
    @required Result todosChanged(_TodosChanged value),
    @required Result saved(Saved value),
  }) {
    assert(initialized != null);
    assert(bodyChanged != null);
    assert(colorChanged != null);
    assert(todosChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result bodyChanged(_BodyChanged value),
    Result colorChanged(_ColorChanged value),
    Result todosChanged(_TodosChanged value),
    Result saved(Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements NoteFormEvent {
  const factory Saved() = _$Saved;
}
