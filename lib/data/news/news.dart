class News {
  final int id;
  final String title;
  final String shortTitle;
  final String body;
  final DateTime date;
  final String imagePath;

  const News({
    required this.id,
    required this.shortTitle,
    required this.title,
    required this.body,
    required this.date,
    required this.imagePath,
  });
}