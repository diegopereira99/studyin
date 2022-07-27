class Content {
  String banner;
  String introduction;
  String title;
  String subject;
  bool favorite;
  List<Map<String, dynamic>> tips;

  Content(
      {
      required this.banner,  
      required this.introduction,
      required this.title,
      required this.subject,
      required this.favorite,
      required this.tips});
}
