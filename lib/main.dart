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
 bool isObscure = true;

  List<String> genderList = ['Male', 'Female'];

  var formKey = GlobalKey<FormState>();

  String selectedValue = "Male";



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
          backgroundColor: Colors.greenAccent,
        ),
        body: ListView(
          key: formKey,
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration:
                  const InputDecoration(hintText: "Name", labelText: "Name"),
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
                return (value == '') ? 'Please enter email' : null;
              },
            ),



            const SizedBox(height: 20),
            TextFormField(
              obscureText: isObscure,
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'password',
                labelText: 'password',
                
                suffixIcon:  IconButton(
                      icon: Icon(
                        isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        
                      ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  }
          
                
                
             
                )
                

                   
              )
            ),
            


            const SizedBox(height: 20),
            Text('Select your gender:'),


            const SizedBox(height: 20),

            
            DropdownButton<String>(
              value: selectedValue,
              isExpanded: false,
              isDense: true,
              
              items: genderList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );

                
              }).toList(),
              onChanged: (String? newValue) {
                if(newValue != null) {
                  setState(() {
                selectedValue = newValue; // Update the selected value using setState
              });


                }

              },
              hint: Text(selectedValue),
    
            ),



            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var isFormValid = formKey.currentState!.validate();
                if (isFormValid) {}
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
