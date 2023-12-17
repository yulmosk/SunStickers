<img src="assets/images/profile_pic.png" align="right" />

# Стикеры
Учебный Flutter проект.
В ветке main реализована верстка нескольких экранов. 
Верстку предлагается использовать как тренажер для освоения и отработки нюансов бизнес логики.
<br/>
<br/>
<br/>
Бизнес логику будем реализовывать следующими средствами:

> План:
> 
> 
> - **Без библиотек**. Без использования дополнительных библиотек.
> - **GetX**. Бизнес логика на GetX.
> - **BLoC**. Бизнес логика на BLoC.
> - **Cubit**. Бизнес логика на Cubit.
> - **MobX**. Бизнес логика на MobX.
> - **Redux**. Бизнес логика на Redux.
> - **Provider**. Бизнес логика на Provider.
> - **Riverpod**. Бизнес логика на Riverpod.


### :bulb:  :star:  :classical_building:  :mag_right:  :test_tube:  :toolbox: :book:

<br/>

## :construction: Версии Dart && Flutter

```cmd
doctor --verbose
[✓] Flutter (Channel stable, 3.16.4, on macOS 14.0 23A344 darwin-arm64, locale ru-RU)
    • Flutter version 3.16.4 
    ...
    • Dart version 3.2.3
```

Описание основных веток:

## Ветка :star: main

- [Учебник](https://yulmosk.github.io/SunStickers/tutorials/Stickers.pdf) - В учебнике пошагово рассмотренно создание верстки проекта. В главе 8 учебника бизнес логика приложения реализована без дополнительных библиотек.
<details>
    <summary> :warning: Правка для Material 3 </summary>

### :warning: Правка для Material 3

Верстка в учебнике реализована в условиях Material 2. В ветке main сделана правка, отменяющая Мaterial 3 
Листинг файла lib >> ui_kit >> app_theme.dart
```dart
class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    //...
  );

  static ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
    //...
  );
}
```

</details>

## Ветка state_structure_stateless

Для упрощения перехода от логики на основе setState к использованию  библиотек, в ветке state_structure_stateless виджеты экранов преобразованы со StatefulWidget на StatelessWidget.  