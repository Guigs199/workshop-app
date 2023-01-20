// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WheelStore on _WheelStoreBase, Store {
  Computed<List<FortuneItem>>? _$wheelItemsComputed;

  @override
  List<FortuneItem> get wheelItems => (_$wheelItemsComputed ??=
          Computed<List<FortuneItem>>(() => super.wheelItems,
              name: '_WheelStoreBase.wheelItems'))
      .value;

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

  late final _$didDrawAtom =
      Atom(name: '_WheelStoreBase.didDraw', context: context);

  @override
  bool get didDraw {
    _$didDrawAtom.reportRead();
    return super.didDraw;
  }

  @override
  set didDraw(bool value) {
    _$didDrawAtom.reportWrite(value, super.didDraw, () {
      super.didDraw = value;
    });
  }

  late final _$drawingAtom =
      Atom(name: '_WheelStoreBase.drawing', context: context);

  @override
  bool get drawing {
    _$drawingAtom.reportRead();
    return super.drawing;
  }

  @override
  set drawing(bool value) {
    _$drawingAtom.reportWrite(value, super.drawing, () {
      super.drawing = value;
    });
  }

  late final _$didLoseAtom =
      Atom(name: '_WheelStoreBase.didLose', context: context);

  @override
  bool get didLose {
    _$didLoseAtom.reportRead();
    return super.didLose;
  }

  @override
  set didLose(bool value) {
    _$didLoseAtom.reportWrite(value, super.didLose, () {
      super.didLose = value;
    });
  }

  late final _$userDrawAtom =
      Atom(name: '_WheelStoreBase.userDraw', context: context);

  @override
  DrawModel get userDraw {
    _$userDrawAtom.reportRead();
    return super.userDraw;
  }

  @override
  set userDraw(DrawModel value) {
    _$userDrawAtom.reportWrite(value, super.userDraw, () {
      super.userDraw = value;
    });
  }

  late final _$selectedGiftAtom =
      Atom(name: '_WheelStoreBase.selectedGift', context: context);

  @override
  GiftModel? get selectedGift {
    _$selectedGiftAtom.reportRead();
    return super.selectedGift;
  }

  @override
  set selectedGift(GiftModel? value) {
    _$selectedGiftAtom.reportWrite(value, super.selectedGift, () {
      super.selectedGift = value;
    });
  }

  late final _$drawAsyncAction =
      AsyncAction('_WheelStoreBase.draw', context: context);

  @override
  Future<void> draw() {
    return _$drawAsyncAction.run(() => super.draw());
  }

  late final _$fetchGiftsAsyncAction =
      AsyncAction('_WheelStoreBase.fetchGifts', context: context);

  @override
  Future<void> fetchGifts() {
    return _$fetchGiftsAsyncAction.run(() => super.fetchGifts());
  }

  late final _$fetchDrawAsyncAction =
      AsyncAction('_WheelStoreBase.fetchDraw', context: context);

  @override
  Future<void> fetchDraw() {
    return _$fetchDrawAsyncAction.run(() => super.fetchDraw());
  }

  late final _$_WheelStoreBaseActionController =
      ActionController(name: '_WheelStoreBase', context: context);

  @override
  void start() {
    final _$actionInfo = _$_WheelStoreBaseActionController.startAction(
        name: '_WheelStoreBase.start');
    try {
      return super.start();
    } finally {
      _$_WheelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endDrawing() {
    final _$actionInfo = _$_WheelStoreBaseActionController.startAction(
        name: '_WheelStoreBase.endDrawing');
    try {
      return super.endDrawing();
    } finally {
      _$_WheelStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
gifts: ${gifts},
didDraw: ${didDraw},
drawing: ${drawing},
didLose: ${didLose},
userDraw: ${userDraw},
selectedGift: ${selectedGift},
wheelItems: ${wheelItems}
    ''';
  }
}
