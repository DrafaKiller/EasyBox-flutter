[![](https://img.shields.io/badge/pub.dev-easy__box-blue)](https://pub.dev/packages/easy_box)
[![](https://img.shields.io/badge/GitHub-EasyBox--flutter-blue?logo=github)](https://github.com/DrafaKiller/EasyBox-flutter)

# Easy Box

All in one widget, with all the most basic widget properties. Composing a tree of widgets depending on the properties that you request. Just organize everything with the Box.

## Features

* Background
* Size
* Padding and Margin
* Border
* Shape
* List
* Alignment
* Expanded
* Transform
* Text Style

## Getting started

Install it using pub:
```
flutter pub add easy_box
```

And import the package:
```dart
import 'package:easy_box/easy_box.dart';
```

## Usage

Wrap your widget with the things you need, the Box widget will do the rest.
Or not, you can also use it without a widget, whatever fits your boat.

```dart
Box(
  child: ... ,
)
```

Or wrap your list of widgets, using a `children` list or an `itemBuilder`. This will be a `ListView` or a `Column/Row`, depending on whether the `alignment` is set or not.

```dart
Box(
  children: [ ... ],

  direction: ... ,
  alignment: ... ,
  spacing: ...
)
```

Change how your Box looks like:

```dart
Box(
  width: ... ,
  height: ... ,

  backgroundColor: ... ,
  backgroundGrandient: ... ,
  backgroundImage: ... ,

  border: ... ,
  borderRadius: ... ,

  shape: ... ,

  padding: ... ,
  margin: ...
)
```

Do a quick **transform** using `translate`, `scale` and `rotate`:

```dart
Box(
  translate: ... ,
  scale: ... ,
  rotate: ...
)
```

Change the default text style of the Text widgets inside your Box:

```dart
Box(
  textStyle: TextStyle(
    ...
  )
)
```

## GitHub

The package code is available on Github: [Flutter - EasyBox](https://github.com/DrafaKiller/EasyBox-flutter)
