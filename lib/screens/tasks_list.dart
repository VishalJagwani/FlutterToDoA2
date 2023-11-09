import 'package:a2_to_do_list/screens/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a2_to_do_list/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (
        context,
        taskData,
        child,
      ) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              deleteCallback: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete task'),
                      content:
                          Text('Are you sure you want to delete this task ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            taskData.deleteTask(task);
                            Navigator.pop(context);
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
