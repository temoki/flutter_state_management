// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyCartState {
  Set<Item> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCartStateCopyWith<MyCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCartStateCopyWith<$Res> {
  factory $MyCartStateCopyWith(
          MyCartState value, $Res Function(MyCartState) then) =
      _$MyCartStateCopyWithImpl<$Res, MyCartState>;
  @useResult
  $Res call({Set<Item> items});
}

/// @nodoc
class _$MyCartStateCopyWithImpl<$Res, $Val extends MyCartState>
    implements $MyCartStateCopyWith<$Res> {
  _$MyCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyCartStateCopyWith<$Res>
    implements $MyCartStateCopyWith<$Res> {
  factory _$$_MyCartStateCopyWith(
          _$_MyCartState value, $Res Function(_$_MyCartState) then) =
      __$$_MyCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Item> items});
}

/// @nodoc
class __$$_MyCartStateCopyWithImpl<$Res>
    extends _$MyCartStateCopyWithImpl<$Res, _$_MyCartState>
    implements _$$_MyCartStateCopyWith<$Res> {
  __$$_MyCartStateCopyWithImpl(
      _$_MyCartState _value, $Res Function(_$_MyCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_MyCartState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<Item>,
    ));
  }
}

/// @nodoc

class _$_MyCartState extends _MyCartState {
  const _$_MyCartState({final Set<Item> items = const {}})
      : _items = items,
        super._();

  final Set<Item> _items;
  @override
  @JsonKey()
  Set<Item> get items {
    if (_items is EqualUnmodifiableSetView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_items);
  }

  @override
  String toString() {
    return 'MyCartState(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCartState &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyCartStateCopyWith<_$_MyCartState> get copyWith =>
      __$$_MyCartStateCopyWithImpl<_$_MyCartState>(this, _$identity);
}

abstract class _MyCartState extends MyCartState {
  const factory _MyCartState({final Set<Item> items}) = _$_MyCartState;
  const _MyCartState._() : super._();

  @override
  Set<Item> get items;
  @override
  @JsonKey(ignore: true)
  _$$_MyCartStateCopyWith<_$_MyCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
