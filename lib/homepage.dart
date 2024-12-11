import 'package:flutter_projects/todolist.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final con = TextEditingController();
  List todoList = [
    ['Learn Python',false],
    ['Go to Gym',false],
  ];

  void checkBox(int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void AddNewTask(){
    setState(() {
      todoList.add([con.text,false]);
      con.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade200,
      appBar: AppBar(
        title: const Text('TaskTorch'),

        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body:  ListView.builder(
               itemCount: todoList.length,
               itemBuilder: (BuildContext context,index){
        return Todolist(taskName: todoList[index][0],taskCompleted: todoList[index][1],onChanged: (value) => checkBox(index),deletFunction:(contex) => deleteTask(index),);
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(controller: con ,decoration:  InputDecoration(
              hintText: 'Add your new task',
              filled: true,
              fillColor: Colors.green.shade400,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.brown),borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.brown),borderRadius: BorderRadius.circular(15),
              ),
             ),
            ),
           ),
          ),
          FloatingActionButton(
              onPressed: AddNewTask,
              child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
