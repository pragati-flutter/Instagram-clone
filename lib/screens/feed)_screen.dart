import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: mobileBackgroundColor,
  centerTitle: false,
  title: SvgPicture.asset('ic_instagram (1).svg',color:primaryColor,height: 32,),
  actions: [
    IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline,),)
  ],
),
      body: PostCard(),

    );
  }
}
