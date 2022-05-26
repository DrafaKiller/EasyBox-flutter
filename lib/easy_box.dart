library easy_box;

import 'package:flutter/widgets.dart';

class Box extends StatelessWidget {
  final Widget? child;



  // -= List =-
  final List<Widget>? children;
  final Widget Function(BuildContext context, int index)? itemBuilder;
  final int? itemCount;
  final Axis? direction;
  final ScrollPhysics? physics;



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

  // -= Alignment =-
  final Alignment? alignment;
  final Spacing? spacing;

  // -= Expanded =-
  final bool? expanded;



  // -= Text Style =-
  final TextStyle? textStyle;



  // -= Transform =-
  final Offset? translate;
  final double? scale;
  final double? rotate;
  final Offset? origin;



// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// -=                          Constructor                              =-
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  const Box({
    super.key,
    this.child,

    // -= List =-
    this.children,
    this.itemBuilder,
    this.itemCount,
    this.physics,
    this.direction,



    // -= Padding and Margin =-
    this.padding,
    this.margin,

    // -= Background =-
    this.backgroundColor,
    this.backgroundGradient,
    this.backgroundImage,

    // -= Size =-
    this.width,
    this.height,

    // -= Border =-
    this.border,
    this.borderRadius,

    // -= Shape =-
    this.shape,

    // -= Alignment =-
    this.alignment,
    this.spacing,

    // -= Expanded =-
    this.expanded,



    // -= Transform =-
    this.translate,
    this.scale,
    this.rotate,
    this.origin,



    // -= Text Style =-
    this.textStyle,
  });

  

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// -=                             Checks                                =-
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  bool get hasList =>
    (itemBuilder != null || children != null) &&
    alignment == null;



  bool get hasColumnRow => 
    (itemBuilder != null || children != null) &&
    alignment != null;
  


  bool get hasContainer =>
    // -= Padding and Margin =-
    (
      (padding != null || alignment != null) &&
      !hasList && !hasColumnRow
    ) || 
    margin != null ||

    // -= Size =-
    width != null ||
    height != null ||

    // -= Expanded =-
    expanded != null ||
    
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
      
      composedWidget = Column(
        children: itemList,
        mainAxisAlignment: spacing?.alignment ?? alignment?.toMainAxisAlignment() ?? MainAxisAlignment.start,
        crossAxisAlignment: alignment?.toCrossAxisAlignment() ?? CrossAxisAlignment.center,
      );
    }
    


    // -= Container =-
    if (hasContainer) {
      composedWidget = Container(
        // -= Padding and Margin =-
        padding: padding,
        margin: margin,

        // -= Size and Expanded =-
        width: width ?? (expanded ?? false ? double.infinity : null),
        height: height ?? (expanded ?? false ? double.infinity : null),

        // -= Alignment =-
        alignment: (!hasList && !hasColumnRow) ? alignment : null,

        decoration:
          hasDecoration ? BoxDecoration(
            // -= Background =-
            color: backgroundColor,
            gradient: backgroundGradient,
            image: backgroundImage,

            // -= Border =-
            border: border,
            borderRadius: borderRadius,

            // -= Shape =-
            shape: shape ?? BoxShape.rectangle,
          ) : null,
        child: composedWidget,
      );
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
      composedWidget = DefaultTextStyle(
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
    if (this == Alignment.bottomCenter || this == Alignment.bottomLeft || this == Alignment.bottomRight)
      return MainAxisAlignment.start;

    if (this == Alignment.center || this == Alignment.centerLeft ||this == Alignment.centerRight)
      return MainAxisAlignment.center;

    if (this == Alignment.topCenter || this == Alignment.topLeft || this == Alignment.topRight)
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

    return CrossAxisAlignment.center;
  }
}