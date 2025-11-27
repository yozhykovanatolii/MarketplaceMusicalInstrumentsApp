class ReviewEntity {
  final String id;
  final String authorAvatarUrl;
  final String authorFullName;
  final int rating;
  final String text;

  ReviewEntity({
    required this.id,
    required this.authorAvatarUrl,
    required this.authorFullName,
    required this.rating,
    required this.text,
  });
}
