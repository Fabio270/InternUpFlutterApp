class UserPostModel {
  final String? id;
  final String? title;
  final String? description;
  final String? companyName;
  final String? location;
  final String? category;
  final String? sourceUrl;
  final String? datePosted;
  final String? logoPhotoUrl;

  UserPostModel({
    this.id,
    this.title,
    this.description,
    this.companyName,
    this.location,
    this.category,
    this.sourceUrl,
    this.datePosted,
    this.logoPhotoUrl,
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    return UserPostModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      companyName: json['companyName'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      sourceUrl: json['source_url'] as String?,
      datePosted: json['date_posted'] as String?,
      logoPhotoUrl: json['company']?['logo_photo_url'] as String?,
    );
  }
}

class JobPostsResponse {
  final int? total;
  final List<UserPostModel>? results;

  JobPostsResponse({this.total, this.results});

  factory JobPostsResponse.fromJson(Map<String, dynamic> json) {
    return JobPostsResponse(
      total: json['total'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((post) => UserPostModel.fromJson(post as Map<String, dynamic>))
          .toList(),
    );
  }
}
