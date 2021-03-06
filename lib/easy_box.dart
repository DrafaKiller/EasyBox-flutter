library easy_box;

import 'package:flutter/material.dart';


/// # Easy Box
/// 
/// All in one widget, with all the most basic widget properties. Composing a tree of widgets depending on the properties that you request. Just organize everything with the Box.
/// 
/// ## Features
/// 
/// * Background
/// * Size
/// * Padding and Margin
/// * Border
/// * Shape
/// * List
/// * Alignment
/// * Expanded
/// * Transform
/// * Text Style
class Box extends StatelessWidget {
  final Widget? child;

  // -= List =-
  final List<Widget>? children;
  final Widget Function(BuildContext context, int index)? itemBuilder;
  final int? itemCount;
  final ScrollPhysics? physics;
  /// Direction of the items in a list.
  /// 
  /// Only used when `children` or `itemBuilder` are set.
  final Axis? direction;
  /// Alignment of the items in a list.
  /// 
  /// Using this property, will use a `Column/Row` instead of a `ListView`.
  /// 
  /// Only used when `children` or `itemBuilder` are set.
  final Alignment? alignment;
  /// Spacing of the items in a list.
  /// 
  /// Only used when `children` or `itemBuilder` are set.
  final Spacing? spacing;



  // -= Padding and Margin =-
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
    
  // -= Background =-
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final DecorationImage? backgroundImage;

  // -= Size =-
  final double? width;
  final double? height;
    
  // -= Border =-
  final Border? border;
  final BorderRadius? borderRadius;

  // -= Shape =-
  final BoxShape? shape;



  // -= Text Style =-
  /// Sets the default text style for all Text widgets within this Box.
  final TextStyle? textStyle;



  // -= Transform =-
  final Offset? translate;
  final double? scale;
  final double? rotate;
  /// Offset of the transform, relative to the center of the widget.
  /// 
  /// Affects `scale` and `rotate`.
  final Offset? origin;

  

  // -= Splash =-
  final Color? splashColor;
  final Color? highlightColor;
  final Color? hoverColor;
  /// Uses one color to set `splashColor`, `highlightColor` and `hoverColor` all at once, with different opacity.
  /// 
  /// Opacity:
  /// * splashColor: 30%
  /// * highlightColor: 15%
  /// * hoverColor: 5%
  final Color? buttonColor;



  // -= Gesture Detector =-
  /// Callback to when the Box is tapped.
  /// 
  /// This creates a GestureDetector widget.
  final Function()? onTap;
  /// Callback to when the Box is double tapped.
  /// 
  /// This creates a GestureDetector widget.
  final Function()? onDoubleTap;
  /// Callback to when the Box is pressed for a bit.
  /// 
  /// This creates a GestureDetector widget.
  final Function()? onLongPress;



// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// -=                          Constructor                              =-
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  /// # Easy Box
  /// 
  /// All in one widget, with all the most basic widget properties. Composing a tree of widgets depending on the properties that you request. Just organize everything with the Box.
  /// 
  /// ## Features
  /// 
  /// * Background
  /// * Size
  /// * Padding and Margin
  /// * Border
  /// * Shape
  /// * List
  /// * Alignment
  /// * Transform
  /// * Text Style
  const Box({
    super.key,
    this.child,
    // -= List =-
    this.children, this.itemBuilder, this.itemCount, this.physics, this.direction,
    // -= Padding and Margin =-
    this.padding, this.margin,
    // -= Background =-
    this.backgroundColor, this.backgroundGradient, this.backgroundImage,
    // -= Size =-
    this.width, this.height,
    // -= Border =-
    this.border, this.borderRadius,
    // -= Shape =-
    this.shape,
    // -= Alignment =-
    this.alignment,
    this.spacing,
    // -= Transform =-
    this.translate, this.scale, this.rotate, this.origin,
    // -= Text Style =-
    this.textStyle,
    // -= Button =-
    this.splashColor, this.highlightColor, this.hoverColor, this.buttonColor,
    // -= Gesture Detector =-
    this.onTap, this.onDoubleTap, this.onLongPress,
  });

  const Box.list({
    super.key,
    // -= List =-
    this.children, this.itemBuilder, this.itemCount, this.physics, this.direction,
    // -= Padding and Margin =-
    this.padding, this.margin,
    // -= Background =-
    this.backgroundColor, this.backgroundGradient, this.backgroundImage,
    // -= Size =-
    this.width, this.height,
    // -= Border =-
    this.border, this.borderRadius,
    // -= Shape =-
    this.shape,
    // -= Transform =-
    this.translate, this.scale, this.rotate, this.origin,
    // -= Text Style =-
    this.textStyle,
    // -= Button =-
    this.splashColor, this.highlightColor, this.hoverColor, this.buttonColor,
    // -= Gesture Detector =-
    this.onTap, this.onDoubleTap, this.onLongPress,
  }) : 
    child = null,
    alignment = null,
    spacing = null;

  const Box.column({
    super.key,
    // -= List =-
    this.children, this.itemBuilder, this.itemCount, this.physics,
    // -= Padding and Margin =-
    this.padding, this.margin,
    // -= Background =-
    this.backgroundColor, this.backgroundGradient, this.backgroundImage,
    // -= Size =-
    this.width, this.height,
    // -= Border =-
    this.border, this.borderRadius,
    // -= Shape =-
    this.shape,
    // -= Alignment =-
    this.alignment = Alignment.topLeft,
    this.spacing,
    // -= Transform =-
    this.translate, this.scale, this.rotate, this.origin,
    // -= Text Style =-
    this.textStyle,
    // -= Button =-
    this.splashColor, this.highlightColor, this.hoverColor, this.buttonColor,
    // -= Gesture Detector =-
    this.onTap, this.onDoubleTap, this.onLongPress,
  }) : 
    child = null,
    direction = Axis.vertical;

  const Box.row({
    super.key,
    // -= List =-
    this.children, this.itemBuilder, this.itemCount, this.physics,
    // -= Padding and Margin =-
    this.padding, this.margin,
    // -= Background =-
    this.backgroundColor, this.backgroundGradient, this.backgroundImage,
    // -= Size =-
    this.width, this.height,
    // -= Border =-
    this.border, this.borderRadius,
    // -= Shape =-
    this.shape,
    // -= Alignment =-
    this.alignment = Alignment.topLeft,
    this.spacing,
    // -= Transform =-
    this.translate, this.scale, this.rotate, this.origin,
    // -= Text Style =-
    this.textStyle,
    // -= Button =-
    this.splashColor, this.highlightColor, this.hoverColor, this.buttonColor,
    // -= Gesture Detector =-
    this.onTap, this.onDoubleTap, this.onLongPress,
  }) : 
    child = null,
    direction = Axis.horizontal;

  

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// -=                             Checks                                =-
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  bool get hasList =>
    (itemBuilder != null || children != null) &&
    (alignment == null && spacing == null);



  bool get hasColumnRow => 
    (itemBuilder != null || children != null) &&
    !(alignment == null && spacing == null);
  


  bool get hasContainer =>
    // -= Padding and Margin =-
    (
      (padding != null || alignment != null) &&
      !hasList && !hasColumnRow && !hasInkWell
    ) || 
    margin != null ||

    // -= Size =-
    width != null ||
    height != null ||
    
    hasDecoration;



  bool get hasDecoration =>
    // -= Background =-
    backgroundColor != null || 
    backgroundGradient != null || 
    backgroundImage != null || 

    // -= Border =-
    border != null || 
    borderRadius != null || 

    // -= Shape =-
    shape != null;



  bool get hasTransform =>
    translate != null ||
    scale != null ||
    rotate != null;



  bool get hasInkWell =>
    splashColor != null || 
    highlightColor != null ||
    hoverColor != null ||
    buttonColor != null;



  bool get hasGestureDetector =>
    onTap != null ||
    onDoubleTap != null ||
    onLongPress != null;



// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// -=                              Build                                =-
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  @override
  Widget build(BuildContext context) {
    Widget composedWidget = child ?? Container();
    
    // -= List =-
    if (hasList) {
      if (this.itemBuilder != null) {
        composedWidget = ListView.builder(
          itemCount: itemCount,
          itemBuilder:
            children != null ?
              (context, index) {
                if (children!.length < index) return children![index];
                return itemBuilder!(context, index);
              } : itemBuilder!,

          scrollDirection: direction ?? Axis.vertical,
          physics: physics,
          
          // -= Padding =-
          padding: padding,
        );
      } else if (this.children != null) {
        composedWidget = ListView(
          children: children!,
          scrollDirection: direction ?? Axis.vertical,
          physics: physics,

          // -= Padding =-
          padding: padding,
        );
      }
    } else if (hasColumnRow) {
      final itemList = children ?? <Widget>[];
      if (itemBuilder != null && itemCount != null && itemCount! > itemList.length) {
        for (int i = itemList.length; i < itemCount!; i++) {
          itemList.add(itemBuilder!(context, i));
        }
      }

      if (direction == Axis.vertical) {
        composedWidget = Column(
          children: itemList,
          mainAxisAlignment: spacing?.alignment ?? alignment?.toMainAxisAlignment() ?? MainAxisAlignment.start,
          crossAxisAlignment: alignment?.toCrossAxisAlignment() ?? CrossAxisAlignment.start,
        );
      } else {
        composedWidget = Row(
          children: itemList,
          mainAxisAlignment: spacing?.alignment ?? alignment?.toMainAxisAlignment() ?? MainAxisAlignment.start,
          crossAxisAlignment: alignment?.toCrossAxisAlignment() ?? CrossAxisAlignment.start,
        );
      }
    }



    // -= InkWell =-
    if (hasInkWell) {
      // -= Alignment =-
      if (alignment != null && !hasColumnRow) {
        composedWidget = Align(
          alignment: alignment!,
          child: composedWidget,
        );  
      }

      // -= Padding =-
      if (padding != null && !hasList) {
        composedWidget = Padding(
          padding: padding!,
          child: composedWidget,
        );
      }
      
      // -= Gesture Detector =-
      if (hasGestureDetector) {
        composedWidget = GestureDetector(
          child: composedWidget,
          behavior: HitTestBehavior.deferToChild,
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
        );
      }

      composedWidget = Material(
        // -= "Container" =-
        child: Ink(
          // -= Size =-
          width: width,
          height: height,

          decoration:
            hasDecoration ? BoxDecoration(
              // -= Background =-
              color: backgroundColor ?? Colors.transparent,
              gradient: backgroundGradient,
              image: backgroundImage,

              // -= Border =-
              border: border,
              borderRadius: borderRadius,

              // -= Shape =-
              shape: shape ?? BoxShape.rectangle,
            ) : null,
          
          // -= InkWell =-
          child: InkWell(
            splashColor: splashColor ?? buttonColor?.withOpacity(0.3),
            highlightColor: highlightColor ?? buttonColor?.withOpacity(0.15),
            hoverColor: hoverColor ?? buttonColor?.withOpacity(0.05),
            onTap: () {},
            child: composedWidget,
          )
        )
      );

      // -= Margin =-
      if (margin != null) {
        composedWidget = Padding(
          padding: margin!,
          child: composedWidget,
        );
      }
    }

    // -= Container =-
    else if (hasContainer) {
      composedWidget = SizedBox(
        child: Container(
          color: !hasDecoration ? Colors.transparent : null,
          // -= Padding and Margin =-
          padding: padding,
          margin: margin,

          // -= Size =-
          width: width,
          height: height,

          // -= Alignment =-
          alignment: !hasColumnRow ? alignment : null,
          
          decoration:
            hasDecoration ? BoxDecoration(
              // -= Background =-
              color: backgroundColor ?? Colors.transparent,
              gradient: backgroundGradient,
              image: backgroundImage,

              // -= Border =-
              border: border,
              borderRadius: borderRadius,

              // -= Shape =-
              shape: shape ?? BoxShape.rectangle,
            ) : null,
          child: composedWidget,
        ),
      );

      // -= Gesture Detector =-
      if (hasGestureDetector) {
        composedWidget = GestureDetector(
          child: composedWidget,
          behavior: HitTestBehavior.deferToChild,
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
        );
      }
    }



    // -= Transform =-
    if (hasTransform) {
      if (translate != null) {
        composedWidget = Transform.translate(
          offset: translate!,
          child: composedWidget,
        );
      }

      if (scale != null) {
        composedWidget = Transform.scale(
          scale: scale,
          origin: origin,
          child: composedWidget,
        );
      }

      if (rotate != null) {
        composedWidget = Transform.rotate(
          angle: rotate!,
          origin: origin,
          child: composedWidget,
        );
      }
    }



    // -= Text Style =-
    if (textStyle != null) {
      composedWidget = DefaultTextStyle.merge(
        child: composedWidget,
        style: textStyle!,
      );
    }

    return composedWidget;
  }
}



enum Spacing {
  spaceAround(MainAxisAlignment.spaceAround),
  spaceBetween(MainAxisAlignment.spaceBetween),
  spaceEvenly(MainAxisAlignment.spaceEvenly),
  none(MainAxisAlignment.center);

  final MainAxisAlignment alignment;
  const Spacing(this.alignment);
}



extension on Alignment {
  MainAxisAlignment toMainAxisAlignment() {
    if (this == Alignment.topCenter || this == Alignment.topLeft || this == Alignment.topRight)
      return MainAxisAlignment.start;

    if (this == Alignment.center || this == Alignment.centerLeft ||this == Alignment.centerRight)
      return MainAxisAlignment.center;

    if (this == Alignment.bottomCenter || this == Alignment.bottomLeft || this == Alignment.bottomRight)
      return MainAxisAlignment.end;

    return MainAxisAlignment.start;
  }

  CrossAxisAlignment toCrossAxisAlignment() {
    if (this == Alignment.bottomLeft || this == Alignment.centerLeft || this == Alignment.topLeft)
      return CrossAxisAlignment.start;

    if (this == Alignment.bottomCenter || this == Alignment.center || this == Alignment.topCenter)
      return CrossAxisAlignment.center;

    if (this == Alignment.bottomRight || this == Alignment.centerRight || this == Alignment.topRight)
      return CrossAxisAlignment.end;

    return CrossAxisAlignment.start;
  }
}