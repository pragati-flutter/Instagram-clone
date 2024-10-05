import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class ResponsiveScreenLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveScreenLayout({super.key,required this.webScreenLayout,required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraints){
          if(constraints.maxWidth> webScreenSize){
            return webScreenLayout;
          }
          return mobileScreenLayout;
    },


    );
  }
}
