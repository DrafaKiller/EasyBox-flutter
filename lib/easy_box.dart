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



  // -= Transform =-
  final Offset? translate;
  final double? scale;
  final double? rotate;
  final Offset? origin;
  


  // -= Checks =-
  final bool hasList;
  final bool hasContainer;
  final bool hasDecoration;
  final bool hasTransform;



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



    // -= Transform =-
    this.translate,
    this.scale,
    this.rotate,
    this.origin,
  }) : 
    hasList =
      // -= List =-
      itemBuilder != null ||
      children != null,
      


    hasContainer =
      // -= Padding and Margin =-
      (
        padding != null && 
        !(
          // -= List =-
          itemBuilder != null ||
          children != null
        )
      ) || 
      margin != null || 
      
      // -= Background =-
      backgroundColor != null || 
      backgroundGradient != null || 
      backgroundImage != null || 

      // -= Border =-
      border != null || 
      borderRadius != null || 

      // -= Shape =-
      shape != null ||

      // -= Alignment =-
      alignment != null,



    hasDecoration =
      // -= Background =-
      backgroundColor != null || 
      backgroundGradient != null || 
      backgroundImage != null || 

      // -= Border =-
      border != null || 
      borderRadius != null || 

      // -= Shape =-
      shape != null,



    hasTransform =
      // -= Transform =-
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



    // -= Container =-
    if (hasContainer) {
      composedWidget = Container(
        // -= Padding and Margin =-
        padding: padding,
        margin: margin,

        // -= Size =-
        width: width,
        height: height,

        // -= Alignment =-
        alignment: alignment,

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

    return composedWidget;
  }
}