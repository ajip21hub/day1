import 'package:flutter/material.dart';
import 'BoxContent.dart';

class InstagramFeedScreen extends StatefulWidget {
  const InstagramFeedScreen({super.key});

  @override
  State<InstagramFeedScreen> createState() => _InstagramFeedScreenState();
}

class _InstagramFeedScreenState extends State<InstagramFeedScreen> {
  // Dynamic data for BoxContent widgets
  final List<Map<String, String>> boxData = [
    {
      'imageUrl':
          'https://play-lh.googleusercontent.com/wnBLkioNZetwPWZxO5-rlS05dRZpc6Vs7vQS1uGJhW5XCiBuxfqlxEp5Zv8D4nZW1bc',
      'title': 'Alex',
      'subtitle': 'Software Engineer',
    },
    {
      'imageUrl': 'https://flutter.dev/images/flutter-logo-sharing.png',
      'title': 'Ben',
      'subtitle': 'Product Designer',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&q=80',
      'title': 'Cara',
      'subtitle': 'Mobile Developer',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1545996124-1b7a5b6f0f40?w=400&q=80',
      'title': 'Dana',
      'subtitle': 'QA Engineer',
    },
  ];

  // Data untuk Instagram Stories
  final List<Map<String, dynamic>> storiesData = [
    {'username': 'Your Story', 'isAddStory': true, 'hasStory': false},
    {'username': 'alex_dev', 'isAddStory': false, 'hasStory': true},
    {'username': 'ben_design', 'isAddStory': false, 'hasStory': true},
    {'username': 'cara_mobile', 'isAddStory': false, 'hasStory': true},
    {'username': 'dana_qa', 'isAddStory': false, 'hasStory': true},
    {'username': 'erin_ui', 'isAddStory': false, 'hasStory': true},
    {'username': 'frank_pm', 'isAddStory': false, 'hasStory': true},
    {'username': 'grace_backend', 'isAddStory': false, 'hasStory': true},
    {'username': 'henry_frontend', 'isAddStory': false, 'hasStory': true},
    {'username': 'iris_devops', 'isAddStory': false, 'hasStory': true},
  ];

  /// Method untuk membangun Instagram Stories Section
  Widget _buildInstagramStories() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: storiesData.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(storiesData[index], index);
        },
      ),
    );
  }

  /// Method untuk membangun individual story item
  Widget _buildStoryItem(Map<String, dynamic> story, int index) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          _buildStoryCircle(story),
          const SizedBox(height: 4),
          _buildUsernameText(story['username']),
        ],
      ),
    );
  }

  /// Method untuk membangun story circle dengan gradient border
  Widget _buildStoryCircle(Map<String, dynamic> story) {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: _getGradientForStory(story),
      ),
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: _buildStoryContent(story),
      ),
    );
  }

  /// Method untuk menentukan gradient berdasarkan status story
  LinearGradient _getGradientForStory(Map<String, dynamic> story) {
    if (story['isAddStory']) {
      return const LinearGradient(
        colors: [Colors.blue, Colors.lightBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (story['hasStory']) {
      return const LinearGradient(
        colors: [Colors.purple, Colors.pink, Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      return LinearGradient(
        colors: [Colors.grey[400]!, Colors.grey[300]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
  }

  /// Method untuk membangun content di dalam story circle
  Widget _buildStoryContent(Map<String, dynamic> story) {
    if (story['isAddStory']) {
      return const Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(
          'https://picsum.photos/seed/${story['username']}/100',
        ),
        backgroundColor: Colors.grey[300],
      );
    }
  }

  /// Method untuk membangun username text
  Widget _buildUsernameText(String username) {
    return Text(
      username,
      style: const TextStyle(
        fontSize: 11,
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Instagram Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Action for info button
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        children: <Widget>[
          _buildInstagramStories(),
          const Divider(height: 20),
          const SizedBox(height: 12.0),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 3 / 4,
            children: boxData.map((data) {
              return BoxContent(
                imageUrl: data['imageUrl']!,
                title: data['title']!,
                subtitle: data['subtitle']!,
                imageSize: 200,
              );
            }).toList(),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}