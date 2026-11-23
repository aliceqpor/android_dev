import "package:android_dev/screens/home_screen/models/post_model.dart";
import "package:android_dev/screens/content/comment_widget.dart";
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:android_dev/screens/home_screen/providers/post_providers.dart";

class PostWidget extends ConsumerStatefulWidget {
  final PostModel? post;
  const PostWidget({super.key, required this.post});

  @override
  ConsumerState<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends ConsumerState<PostWidget> {
  bool isLiked = false;
  // This should ideally be managed by state management

  void openBottomSheet() {
    final comments = widget.post?.comments ?? [];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: comments.isEmpty
              ? const Center(child: Text("No comments yet"))
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return CommentWidget(comment: comments[index]);
                  },
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.post?.imageUrl ?? 'https://via.placeholder.com/150',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  final post = widget.post;
                  if (post == null) return;
                  final notifier = ref.read(postsProvider.notifier);
                  if (isLiked) {
                    notifier.unlike(post);
                  } else {
                    notifier.like(post);
                  }
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {
                  openBottomSheet();
                },
              ),
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            widget.post?.description ?? '',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
