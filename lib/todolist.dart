import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key, required this.taskName, required this.taskCompleted,required this.onChanged, required this.deletFunction});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deletFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children:[
              SlidableAction(
                onPressed: deletFunction,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.brown,

              ),
            ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.lightGreen, // Only use this color property
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,checkColor: Colors.white,activeColor: Colors.brown,),
              Text(
                taskName,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
