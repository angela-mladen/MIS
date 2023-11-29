import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '201157 subjects',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _courses = [
    'Intro to data science',
    'Management information systems',
    'Mobile information systems',
    'Team project',
    'Video games'
  ];
  

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar( 
      backgroundColor: Colors.grey,
      title: Text('201157'),
    ),
    body: Container(
      margin: EdgeInsets.all(10.0),
      color: Colors.blueGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My courses this semester',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_courses[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_rounded, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _courses.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: addCourse,
      child: const Icon(Icons.add),
    ),
  );
}


  void addCourse() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newCourse = "";
          return AlertDialog(
            title: const Text('Add your new course'),
            content: TextField(
              onChanged: (String string) {
                newCourse = string;
              },
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                 child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      if (newCourse.isNotEmpty) {
                        _courses.add(newCourse);
                      }
                    });
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}