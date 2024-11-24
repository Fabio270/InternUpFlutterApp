import 'package:app/model/user_post_model.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final UserPostModel post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(post.title ?? 'Detalhes do Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title ?? 'Título indisponível',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  post.description ?? 'Descrição indisponível',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                if (post.logoPhotoUrl != null)
                  Image.network(post.logoPhotoUrl!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
