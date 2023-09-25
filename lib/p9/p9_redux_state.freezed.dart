// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'p9_redux_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$P9ReduxState {
  Future<List<Item>> get catalogItems => throw _privateConstructorUsedError;
  MyCartState get myCart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $P9ReduxStateCopyWith<P9ReduxState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $P9ReduxStateCopyWith<$Res> {
  factory $P9ReduxStateCopyWith(
          P9ReduxState value, $Res Function(P9ReduxState) then) =
      _$P9ReduxStateCopyWithImpl<$Res, P9ReduxState>;
  @useResult
  $Res call({Future<List<Item>> catalogItems, MyCartState myCart});

  $MyCartStateCopyWith<$Res> get myCart;
}

/// @nodoc
class _$P9ReduxStateCopyWithImpl<$Res, $Val extends P9ReduxState>
    implements $P9ReduxStateCopyWith<$Res> {
  _$P9ReduxStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalogItems = null,
    Object? myCart = null,
  }) {
    return _then(_value.copyWith(
      catalogItems: null == catalogItems
          ? _value.catalogItems
          : catalogItems // ignore: cast_nullable_to_non_nullable
              as Future<List<Item>>,
      myCart: null == myCart
          ? _value.myCart
          : myCart // ignore: cast_nullable_to_non_nullable
              as MyCartState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyCartStateCopyWith<$Res> get myCart {
    return $MyCartStateCopyWith<$Res>(_value.myCart, (value) {
      return _then(_value.copyWith(myCart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_P9ReduxStateCopyWith<$Res>
    implements $P9ReduxStateCopyWith<$Res> {
  factory _$$_P9ReduxStateCopyWith(
          _$_P9ReduxState value, $Res Function(_$_P9ReduxState) then) =
      __$$_P9ReduxStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Future<List<Item>> catalogItems, MyCartState myCart});

  @override
  $MyCartStateCopyWith<$Res> get myCart;
}

/// @nodoc
class __$$_P9ReduxStateCopyWithImpl<$Res>
    extends _$P9ReduxStateCopyWithImpl<$Res, _$_P9ReduxState>
    implements _$$_P9ReduxStateCopyWith<$Res> {
  __$$_P9ReduxStateCopyWithImpl(
      _$_P9ReduxState _value, $Res Function(_$_P9ReduxState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalogItems = null,
    Object? myCart = null,
  }) {
    return _then(_$_P9ReduxState(
      catalogItems: null == catalogItems
          ? _value.catalogItems
          : catalogItems // ignore: cast_nullable_to_non_nullable
              as Future<List<Item>>,
      myCart: null == myCart
          ? _value.myCart
          : myCart // ignore: cast_nullable_to_non_nullable
              as MyCartState,
    ));
  }
}

/// @nodoc

class _$_P9ReduxState implements _P9ReduxState {
  const _$_P9ReduxState({required this.catalogItems, required this.myCart});

  @override
  final Future<List<Item>> catalogItems;
  @override
  final MyCartState myCart;

  @override
  String toString() {
    return 'P9ReduxState(catalogItems: $catalogItems, myCart: $myCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_P9ReduxState &&
            (identical(other.catalogItems, catalogItems) ||
                other.catalogItems == catalogItems) &&
            (identical(other.myCart, myCart) || other.myCart == myCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, catalogItems, myCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_P9ReduxStateCopyWith<_$_P9ReduxState> get copyWith =>
      __$$_P9ReduxStateCopyWithImpl<_$_P9ReduxState>(this, _$identity);
}

abstract class _P9ReduxState implements P9ReduxState {
  const factory _P9ReduxState(
      {required final Future<List<Item>> catalogItems,
      required final MyCartState myCart}) = _$_P9ReduxState;

  @override
  Future<List<Item>> get catalogItems;
  @override
  MyCartState get myCart;
  @override
  @JsonKey(ignore: true)
  _$$_P9ReduxStateCopyWith<_$_P9ReduxState> get copyWith =>
      throw _privateConstructorUsedError;
}
