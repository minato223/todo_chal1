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
        ProgressModel(
            id: 3,
            title: "Lorem\nIpsum Dolor",
            subtitle: "lorem Ipsum Dolor",
            progression: 13),
        ProgressModel(
            id: 4,
            title: "Namikaze\nMinato",
            subtitle: "Yondaime Hokage",
            progression: 38.8),
        ProgressModel(
            id: 5,
            title: "Apex\nLegends",
            subtitle: "R301,Flatline",
            progression: 32.8),
      ];
}
