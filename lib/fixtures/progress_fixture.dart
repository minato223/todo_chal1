import 'package:todo_chal1/views/home/models/progress_model.dart';

class ProgressFixture {
  static List<ProgressModel> get tasks => [
        ProgressModel(
            id: 1,
            title: "Working\nHours",
            subtitle: "Working hours exceeded by 3 hours",
            progression: 19),
        ProgressModel(
            id: 2,
            title: "Your\nEfficiency",
            subtitle: "Excellent results",
            progression: 32.8),
      ];
}
