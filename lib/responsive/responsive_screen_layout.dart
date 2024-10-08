import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';

class ResponsiveScreenLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveScreenLayout({super.key,required this.webScreenLayout,required this.mobileScreenLayout});

  @override
  State<ResponsiveScreenLayout> createState() => _ResponsiveScreenLayoutState();
}

class _ResponsiveScreenLayoutState extends State<ResponsiveScreenLayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData()async{
    UserProvider _userProvider = Provider.of(context,listen:false);
    await _userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder:(context,constraints){
          if(constraints.maxWidth> webScreenSize){
            return widget.webScreenLayout;
          }
          return widget.mobileScreenLayout;
    },


    );
  }
}
