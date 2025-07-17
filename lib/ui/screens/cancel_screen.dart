import 'package:flutter/cupertino.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return task_card(
            taskType: TaskType.cancelled,
          );
        },
      ),
    );
    ;
  }
}
