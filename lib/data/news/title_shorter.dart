class NewsTitleShorter {
  final String title;
  final int maxLength;
  const NewsTitleShorter(this.title, {
    required this.maxLength,
  });


  String shorten() {
    if(title.length <= maxLength) {
      return title;
    }
    return title.substring(0, maxLength);
  }
}