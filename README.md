[![Pub.dev package](https://img.shields.io/badge/pub.dev-easy__box-blue)](https://pub.dev/packages/easy_box)
[![GitHub repository](https://img.shields.io/badge/GitHub-EasyBox--flutter-blue?logo=github)](https://github.com/DrafaKiller/EasyBox-flutter)

# Easy Box

All in one widget, with all the most basic widget properties. Composing a tree of widgets depending on the properties that you request. Just organize everything with the Box.

## Features

* Background
* Padding and Margin
* Button
* Border
* List
* Size
* Shape
* Alignment
* Transform
* Text Style

*The `Button` is an InkWell + GestureDetector*

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
Or not, you can also use it without any widget inside, whatever floats your boat.

```dart
Box(
  child: ... ,
)
```

Or wrap your list of widgets, using a `children` list or an `itemBuilder`. This will be a `ListView` or a `Column/Row`, depending on whether the `alignment` is set or not.

The `alignment` property is used for that because alignment is only possible using `Column/Row`. But another way to get that is by using the `Box.column()` and `Box.row()`.

```dart
Box(
  children: [ ... ],

  direction: Axis.horizontal,
  alignment: Alignment.center,
  spacing: Spacing.spaceAround
)
```

Choose your Box style and properties, it will create whatever structure it needs taking into account the widgets already requested above.

```dart
Box(
  width: 200,
  height: 300,

  backgroundColor: Colors.green,
  backgroundGrandient: LinearGradient( ... ),
  backgroundImage: DecorationImage( ... ),

  border: Border.all( ... ),
  borderRadius: BorderRadius.circular(10),

  shape: ... ,

  padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(10)
)
```

Do a quick **transform** using `translate`, `scale` and `rotate`:

```dart
Box(
  translate: Offset( ... ),
  scale: 1.5,
  rotate: math.pi / 4
)
```

Choose the default text style for all the Text widgets inside your Box.

```dart
Box(
  textStyle: TextStyle(
    ...
  )
)
```

Add button functionalities, like an `InkWell` or a `GestureDetector`:

```dart
Box(
  splashColor: ... ,
  highlightColor: ... ,
  hoverColor: ... ,
  
  // All the above at once
  buttonColor: ... ,

  onTap: () => ... ,
  onLongPress: () => ... ,
  onDoubleTap: () => ... ,
)
```

## GitHub

The widget code is available on Github: [Flutter - EasyBox](https://github.com/DrafaKiller/EasyBox-flutter)
