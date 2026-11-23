import "package:android_dev/screens/home_screen/models/story_model.dart";
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  const StoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(story.imageUrl),
        ),
        Text(story.username),
      ],
    );
  }
}