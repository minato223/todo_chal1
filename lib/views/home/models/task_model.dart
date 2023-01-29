class TaskModel {
  int id;
  String title;
  String subtitle;
  String duration;
  String startTime;
  List<String>? avatars;
  bool status = false;
  TaskModel(
      {required this.title,
      required this.subtitle,
      required this.duration,
      required this.startTime,
      required this.status,
      required this.id,
      this.avatars});
}
