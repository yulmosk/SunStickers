## Ветка :star: state_structure_copy_with

В ветке state_structure_stateless как и в ветке state_structure_stateless виджеты экранов преобразованы со StatefulWidget на StatelessWidget.
В зависимости добавлена библиотека equatable.

```yaml
dependencies:
flutter:
sdk: flutter
#...
equatable: ^2.0.5
```
Для сущностей Sticker и StickerCategory реализованы методы copyWith

```dart
import 'package:equatable/equatable.dart';

enum StickerType { all, toy, fauna, plant, berry, fruit, other }

class Sticker extends Equatable{
  final int id;
  final String image;
  final String name;
  final double price;
  final int quantity;
  final bool favorite;
  final String description;
  final double score;
  final StickerType type;
  final int voter;
  final bool cart;

  Sticker({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.favorite,
    required this.description,
    required this.score,
    required this.type,
    required this.voter,
    required this.cart,
  });

  List<Object?> get props => [id, image, name, price, quantity, favorite, description, score, type, voter, cart];
  @override
  int get hashCode => id.hashCode^image.hashCode^name.hashCode^price.hashCode^quantity.hashCode^favorite.hashCode^description.hashCode^score.hashCode^type.hashCode^voter.hashCode^cart.hashCode;

  Sticker copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    int? quantity,
    bool? favorite,
    String? description,
    double? score,
    StickerType? type,
    int? voter,
    bool? cart,
  }) {
    return Sticker(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      favorite: favorite ?? this.favorite,
      description: description ?? this.description,
      score: score ?? this.score,
      type: type ?? this.type,
      voter: voter ?? this.voter,
      cart: cart ?? this.cart,
    );
  }
}
```

```dart
import 'package:equatable/equatable.dart';

import '_models.dart';

class StickerCategory extends Equatable {
  final StickerType type;
  final bool isSelected;

  StickerCategory({required this.type, required this.isSelected});

  @override
  List<Object?> get props => [type, isSelected];
  StickerCategory copyWith({StickerType? type, bool? isSelected}) {
    return StickerCategory(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}
```

В файле sticker_state.dart как и в ветке state_structure_stateless тоже сформирован список переменных, реализованы методы и вспомогательные методы на основе которых можно реализовать логику приложения, не задумываясь о структуре сущностей и логике методов.
Реализация методов в ветке state_structure_copy_with отличается от реализации в ветке state_structure_stateless использованием copyWith для сущностей.
Библиотеки **BLoC**, **Cubit**, **Provider**, **Riverpod**, **Redux** запускают механизмы обновления данных, только если данные меняются.
Для типа данных class, который имеет ссылочный тип, изменение свойств экземпляра класса не меняет ссылку на объект.
А значит с точки зрения Dart и с точки зрения библиотек управления состоянием при изменении свойств данные не меняются.
Чтобы библиотеки управления состояния заработали, изменеие свойств сущностей будем реализовывать с использованием метода copyWith.
Метод copyWith создает новый экземпляр (с новой ссылкой) класса с измененным свойством.

Листинг файла lib >> states >> sticker_state.dart

```dart
import 'package:flutter/material.dart';

import '../data/_data.dart';
import '../ui/_ui.dart';

class StickerState {
  StickerState._();
  static final _instance = StickerState._();
  factory StickerState() => _instance;

  //Переменные
  List<StickerCategory> categories = AppData.categories;
  List<Sticker> stickers = AppData.stickers;
  List<Sticker> stickersByCategory = AppData.stickers;
  List<Sticker> cart = <Sticker>[];
  List<Sticker> favorite = <Sticker>[];
  bool light = true;

  //Действия
  Future<void> onCategoryTap(StickerCategory category) async {
    categories = categories.map((e) {
      if (e.type == category.type) {
        return e.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();

    if (category.type == StickerType.all) {
      stickersByCategory = stickers;
    } else {
      stickersByCategory = stickers.where((e) => e.type == category.type).toList();
    }
  }

  Future<void> onIncreaseQuantityTap(int stickerId) async {
    stickers = stickers.map((e) {
      if (e.id == stickerId) {
        return e.copyWith(quantity: e.quantity + 1);
      } else {
        return e;
      }
    }).toList();
  }

  Future<void> onDecreaseQuantityTap(int stickerId) async {
    stickers = stickers.map((e) {
      if (e.id == stickerId) {
        return e.quantity == 1 ? e : e.copyWith(quantity: e.quantity - 1);
      } else {
        return e;
      }
    }).toList();
  }

  Future<void> onAddToCartTap(int stickerId) async {
    stickers = stickers.map((e) {
      if (e.id == stickerId) {
        return e.copyWith(cart: true);
      } else {
        return e;
      }
    }).toList();
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onRemoveFromCartTap(int stickerId) async {
    stickers = stickers.map((e) {
      if (e.id == stickerId) {
        return e.copyWith(cart: false, quantity: 1);
      } else {
        return e;
      }
    }).toList();
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onCheckOutTap() async {
    Set<int> cartIds = <int>{};
    for (var item in cart) {
      cartIds.add(item.id);
    }
    stickers = stickers.map((e) {
      if (cartIds.contains(e.id)) {
        return e.copyWith(cart: false, quantity: 1);
      } else {
        return e;
      }
    }).toList();
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onAddRemoveFavoriteTap(int stickerId) async {
    stickers = stickers.map((e) {
      if (e.id == stickerId) {
        return e.copyWith(favorite: !e.favorite);
      } else {
        return e;
      }
    }).toList();
    favorite = stickers.where((e) => e.favorite).toList();
  }

  void toggleTheme() {
    light = !light;
  }

  //List<Sticker> get cart => stickers.where((e) => e.cart).toList();
  //List<Sticker> get favorite => stickers.where((e) => e.favorite).toList();

  int getIndex(int stickerId) {
    int index = stickers.indexWhere((e) => e.id == stickerId);
    return index;
  }
  Sticker getStickerById(int stickerId) {
    return stickers[getIndex(stickerId)];
  }

  //Вспомогательные  методы
  String stickerPrice(Sticker sticker) {
    return (sticker.quantity * sticker.price).toString();
  }

  double get subtotal {
    double amount = 0.0;
    for (var e in cart) {
      amount = amount + e.price * e.quantity;
    }
    return amount;
  }


//BLoC, Cubit, GetX, MobX, Provider, Riverpod, Redux

// 14 шагов логики
//
//
// 1.  Подсветка выбранной категории
// 2.  Продукты по категории
// 3.  Детали: отображение продукта
// 4.  Детали: количество
// 5.  Корзина: управление пустой корзиной
// 6.  Детали: добавление в корзину
// 7.  Корзина: список в корзине
// 8.  Корзина: стоимость корзины
// 9.  Корзина: количество
// 10. Корзина: удаление
// 11. Корзина: чистка корзина на checkout
// 12. Любимые: управление пустым экраном
// 13. Детали: Добавление/удаление любимые
// 14. Смена темы
}
```

На основе этой ветки удобно реализовать бизнес логику приложения на **BLoC**, **Cubit**, **Provider**, **Riverpod**, **Redux**