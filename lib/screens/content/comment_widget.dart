import "package:android_dev/screens/home_screen/models/comment_model.dart";
import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  final CommentModel comment;
  

  const CommentWidget({
    super.key,
    required this.comment,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool isLiked = false;

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 8),
        Text(widget.comment.username),
        const SizedBox(width: 8),
        Expanded(
          child: Text(widget.comment.text),
        ),
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size: 18,
            color: isLiked ? Colors.red : null,
          ),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
        ),
      ],
    );
  }
}
