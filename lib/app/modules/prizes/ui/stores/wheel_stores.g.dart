// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WheelStore on _WheelStoreBase, Store {
  late final _$giftsAtom =
      Atom(name: '_WheelStoreBase.gifts', context: context);

  @override
  List<GiftModel> get gifts {
    _$giftsAtom.reportRead();
    return super.gifts;
  }

  @override
  set gifts(List<GiftModel> value) {
    _$giftsAtom.reportWrite(value, super.gifts, () {
      super.gifts = value;
    });
  }

  late final _$fetchGiftsAsyncAction =
      AsyncAction('_WheelStoreBase.fetchGifts', context: context);

  @override
  Future<void> fetchGifts() {
    return _$fetchGiftsAsyncAction.run(() => super.fetchGifts());
  }

  late final _$_WheelStoreBaseActionController =
      ActionController(name: '_WheelStoreBase', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_WheelStoreBaseActionController.startAction(
        name: '_WheelStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_WheelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gifts: ${gifts}
    ''';
  }
}
