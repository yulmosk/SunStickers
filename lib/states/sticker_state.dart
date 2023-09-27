import 'package:flutter/material.dart';

import '../data/_data.dart';
import '../ui/_ui.dart';

class StickerState {
  StickerState._();
  static final _instance = StickerState._();
  factory StickerState() => _instance;

  //Ключи
  GlobalKey<CartScreenState> cartKey = GlobalKey();
  GlobalKey<FavoriteScreenState> favoriteKey = GlobalKey();

  //Переменные
  List<StickerCategory> categories = AppData.categories;
  List<Sticker> stickers = AppData.stickers;
  List<Sticker> stickersByCategory = AppData.stickers;
  List<Sticker> get cart => stickers.where((element) => element.cart).toList();
  List<Sticker> get favorite => stickers.where((element) => element.isFavorite).toList();
  ValueNotifier<bool> isLigth = ValueNotifier(true);

  //Действия
  Future<void> onCategoryTap(StickerCategory category) async {}

  Future<void> onIncreaseQuantityTap(Sticker sticker) async {}

  Future<void> onDecreaseQuantityTap(Sticker sticker) async {}

  Future<void> onAddToCartTap(Sticker sticker) async {}

  Future<void> onRemoveFromCartTap(Sticker sticker) async {}

  Future<void> onCheckOutTap() async {}

  Future<void> onAddRemoveFavoriteTap(Sticker sticker) async {}

  void toggleTheme() {}

  //Вспомогательные  методы
  String stickerPrice(Sticker sticker) {
    return '';
  }

  double get subtotal {
    return 0.0;
  }

  //BLoC, Cubit, GetX, MobX, Provider, Riverpod, Redux

  // 15 шагов логики
  //
  //
  // 1. Подсветка выбранной категории
  // 2. Продукты по категории
  // 3. Детали: отображение продукта
  // 4. Детали: количество
  // 5.  Корзина: управление пустой корзиной
  // 6.  Детали: добавление в корзину
  // 7. Корзина: список в корзине
  // 8. Корзина: стоимость корзины
  // 9. Корзина: количество
  // 10. Корзина: удаление
  // 11. Корзина: чистка корзина на checkout
  // 12. Любимые: управление пустым экраном
  // 13. Детали: Добавление/удаление любимые
  // 14. Любимые: список любимых
  // 15. Смена темы
}
