## Ветка :star: state_structure_stateless

Для упрощения перехода от логики на основе setState ([Учебник](https://yulmosk.github.io/SunStickers/tutorials/Stickers.pdf) Глава 8) к использованию  библиотек, в ветке state_structure_stateless виджеты экранов преобразованы со StatefulWidget на StatelessWidget.
В файле sticker_state.dart уже сформирован список переменных, реализованы методы и вспомогательные методы на основе которых можно реализовать логику приложения, не задумываясь о структуре сущностей и логике методов.
Задумка репозитория это реализация бизнес логики на основе одного и того же списка переменных, на основе одних и  тех же методов, но разными библиотеками.
Список переменных и реализованные методы позволяют не отвлекаться от сравнения синтанкисов и подходов библиотек управления состоянием.

В завершении файла зафиксированы 14 шагов логики, которые надо реализовывать.

Листинг файла lib >> states >> sticker_state.dart

```dart
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
    categories.map((e) {
      if (e.type == category.type) {
        e.isSelected = true;
      } else {
        e.isSelected = false;
      }
    }).toList();
    if (category.type == StickerType.all) {
      stickersByCategory = stickers;
    } else {
      stickersByCategory = stickers.where((e) => e.type == category.type).toList();
    }
  }

  Future<void> onIncreaseQuantityTap(Sticker sticker) async {
    sticker.quantity++;
  }

  Future<void> onDecreaseQuantityTap(Sticker sticker) async {
    if (sticker.quantity == 1) return;
    sticker.quantity--;
  }

  Future<void> onAddToCartTap(Sticker sticker) async {
    sticker.cart = true;
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onRemoveFromCartTap(Sticker sticker) async {
    sticker.cart = false;
    sticker.quantity = 1;
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onCheckOutTap() async {
    for (var e in cart) {
      e.cart = false;
      e.quantity = 1;
    }
    cart = stickers.where((e) => e.cart).toList();
  }

  Future<void> onAddRemoveFavoriteTap(Sticker sticker) async {
    sticker.favorite = !sticker.favorite;
    favorite = stickers.where((e) => e.favorite).toList();
  }

  void toggleTheme() {
    light = !light;
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

На основем этой ветки удобно реализовать бизнес логику приложения на **GetX** и **MobX**