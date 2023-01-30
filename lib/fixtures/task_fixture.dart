import 'package:todo_chal1/constants/app_images.dart';
import 'package:todo_chal1/views/home/models/task_model.dart';

class TaskFixture {
  static final List<String> avatars = [
    AppImages.avatar2,
    AppImages.avatar1,
    AppImages.avatar3,
    AppImages.avatar4
  ];
  static List<TaskModel> get tasks => [
        TaskModel(
            title: "Meeting with front-end developers",
            subtitle: "Flose Real Estate project",
            duration: "9:50 AM - 10:50 AM",
            startTime: "10:00 AM",
            status: false,
            avatars: avatars,
            id: 1),
        TaskModel(
            title: "Internal marketing session",
            subtitle: "Marketing department",
            duration: "11:50 AM - 12:50 AM",
            startTime: "11:00 AM",
            status: true,
            avatars: [...avatars, ...avatars],
            id: 2),
        TaskModel(
            title: "Learn flutter in depth",
            subtitle: "Personal",
            duration: "13:50 AM - 15:00 AM",
            startTime: "13:40 AM",
            status: false,
            id: 3),
      ];
}
