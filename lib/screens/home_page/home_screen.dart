import 'package:app/data/data.dart';
import 'package:app/model/user_post_model.dart';
import 'package:app/widgets/constants.dart';
import 'package:app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'post_detail_screen.dart'; // Import the detail screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<UserPostModel>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = Data.fetchPosts(); // Chamada ao método assíncrono.
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: Colors.black12,
          appBar: CustomAppbar(sizingInformation: sizingInformation),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FutureBuilder<List<UserPostModel>>(
              future: _futurePosts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro ao carregar posts: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Nenhum post encontrado'),
                  );
                } else {
                  return _listPostWidget(sizingInformation, snapshot.data!);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _listPostWidget(
      SizingInformation sizingInformation, List<UserPostModel> posts) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostWidget(post: post, sizingInformation: sizingInformation);
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final UserPostModel post;
  final SizingInformation sizingInformation;

  const PostWidget(
      {required this.post, required this.sizingInformation, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the post detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(post: post),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 8, top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.black54, width: 0.50),
            bottom: BorderSide(color: Colors.black54, width: 0.50),
          ),
        ),
        child: Column(
          children: [
            // Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: sizingInformation.screenSize.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    // Use Expanded to make sure the title takes up available space
                    child: Text(
                      post.title ?? 'Título indisponível',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Description
            Text(
              post.description ?? 'Descrição indisponível',
              maxLines: 3, // Limit the number of lines
              overflow: TextOverflow.ellipsis, // Show ellipsis when truncated
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                post.category ?? '',
                style: const TextStyle(color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 10),
            // Logo Photo
            if (post.logoPhotoUrl != null)
              Container(
                width: sizingInformation.screenSize.width / 2,
                child: Image.network(
                  post.logoPhotoUrl!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
