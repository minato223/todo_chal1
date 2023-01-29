class ProgressModel {
  static int progressMax = 40;
  int id;
  String title;
  String subtitle;
  double progression;
  ProgressModel(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.progression});
}
