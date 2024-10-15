import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

import 'comment_card.dart';
class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CommentCard(),
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("comments"),
        centerTitle: false,
      ),
      bottomNavigationBar: SafeArea(child: Container(

        height: kToolbarHeight,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16,right: 8),
        child:  Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://imgs.search.brave.com/UPZgGcPqu58U8_DREvbHhAMcuIQdNjcpznRZ9KHJPCA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXhs/ci5jb20vaW1hZ2Vz/L2luZGV4L2FpLWlt/YWdlLWdlbmVyYXRv/ci1vbmUud2VicA'
              ),
              radius: 18,
            ),
            const Expanded(

              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 100),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Comment as username",
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal:8),
                child: const Text(
                  "Post",style: TextStyle(
                  color: Colors.blueAccent
                ),
                ),
              ),
            )

          ],
        ),
      ),



      ),
    );
  }
}
