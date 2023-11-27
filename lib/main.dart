import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isListVisible = false;
  List genderList = ['male', 'female'];


  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('Register Form'),
          backgroundColor:Colors.greenAccent,
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
            TextField(
              decoration: InputDecoration(
                labelText: 'username',
                hintText: 'username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto
              ),
            ),


          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Text('Select your gender:'),
            
            ElevatedButton(
            onPressed: () {
              setState(() {
                isListVisible = !isListVisible;
              });
            },
            child: const Text('Gender'),
          ),
          Visibility(
            visible: isListVisible,
            child: Column(
              children: genderList
                  .map(
                    (gender) => Draggable<String>(
                      data: gender,
                      child: ListTile(
                        title: Text(gender),
                      ),
                      feedback: Material(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(gender),
                          tileColor: Colors.grey[300],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),






          ElevatedButton(onPressed: () {

          },
           

          child: Text('Submit'),
          )

          ],
        ),
      ),
    );

    
  }
}
