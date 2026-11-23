import 'package:android_dev/screens/home_screen/models/comment_model.dart';
import 'package:android_dev/screens/home_screen/models/post_model.dart';
import 'package:android_dev/screens/home_screen/models/story_model.dart';
import 'package:android_dev/screens/home_screen/services/post_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final postServicesProvider = Provider<PostServices>((ref) {
  return PostServices();
});

// 2. Posts manager
class PostsNotifier extends Notifier<List<PostModel>> {
  @override
  List<PostModel> build() {
    final service = ref.read(postServicesProvider);

    service.batchAddPosts(List.generate(
      10,
      (index) => PostModel(
        imageUrl: 'https://picsum.photos/seed/$index/400/300',
        description: 'This is post number $index',
        likeCount: 0,
        comments: [
          CommentModel(username: 'john', text: 'Nice post $index!'),
          CommentModel(username: 'mia', text: 'Love it'),
        ],
      ),
    ));

    return [...service.posts];
  }

  void addPost(PostModel post) {
    final service = ref.read(postServicesProvider);
    service.addPost(post);
    state = [...service.posts];
  }

  void like(PostModel post) {
    final service = ref.read(postServicesProvider);
    service.likePost(post);
    state = [...service.posts];
  }

  void unlike(PostModel post) {
    final service = ref.read(postServicesProvider);
    service.unlikePost(post);
    state = [...service.posts];
  }
}

final postsProvider = NotifierProvider<PostsNotifier, List<PostModel>>(
  PostsNotifier.new,
);

// 3. Stories manager
class StoriesNotifier extends Notifier<List<StoryModel>> {
  @override
  List<StoryModel> build() {
    final service = ref.read(postServicesProvider);

    service.batchAddStories([
      StoryModel(username: 'anna', imageUrl: 'https://i.pravatar.cc/150?img=1'),
      StoryModel(username: 'john', imageUrl: 'https://i.pravatar.cc/150?img=2'),
      StoryModel(username: 'mia', imageUrl: 'https://i.pravatar.cc/150?img=3'),
      StoryModel(username: 'alex', imageUrl: 'https://i.pravatar.cc/150?img=4'),
      StoryModel(username: 'sara', imageUrl: 'https://i.pravatar.cc/150?img=5'),
    ]);

    return [...service.stories];
  }

  void addStory(StoryModel story) {
    final service = ref.read(postServicesProvider);
    service.addStory(story);
    state = [...service.stories];
  }
}

final storiesProvider = NotifierProvider<StoriesNotifier, List<StoryModel>>(
  StoriesNotifier.new,
);