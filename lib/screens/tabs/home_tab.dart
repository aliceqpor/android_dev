import "package:android_dev/screens/content/post_widget.dart";
import "package:android_dev/screens/content/story_widget.dart";
import "package:android_dev/screens/home_screen/providers/post_providers.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    final stories = ref.watch(storiesProvider);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Instagram'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return StoryWidget(story: stories[index]);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: PostWidget(post: posts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}