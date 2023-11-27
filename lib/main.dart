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

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('form handling'),
          backgroundColor:Colors.greenAccent,
        ),
        body: ListView(
          key: formKey,
          padding:  const EdgeInsets.all(20),
          children: [
            
            TextFormField(
              controller: nameController,
              keyboardType:  TextInputType.name,
              decoration: const InputDecoration(
                hintText: "Name",
                labelText: "Name"

              ),
              validator: (value) {
                return (value == '') ? 'Please enter name' : null;

              },
              
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
              validator: (value) {
                return(value == '') ? 'Please enter email': null;
              },
            ),

            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'password',
                labelText: 'password',
              ),
              

            ),

         
            Text('Select your gender:'),
       





          ElevatedButton(onPressed: () {
            var isFormValid = formKey.currentState!.validate();
            if (isFormValid) {


            }


          },
           

          child: Text('Submit'),
          )

          ],
        ),
      ),
    );

    
  }
}
