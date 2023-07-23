import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../controller/get_controller.dart';
import '../../layout/main_layout.dart';
import '../login/login_view.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
 var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
    final GController controller = Get.put(GController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text(
          "Sing up",
          style:
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("account");
              },
              icon: Icon(Icons.account_box)),
          IconButton(
              onPressed: () {
                print("phone");
              },
              icon: Icon(Icons.phone)),
          IconButton(
              onPressed: () {
                print("account");
              },
              icon: Icon(Icons.account_box)),
          IconButton(
              onPressed: () {
                print("phone");
              },
              icon: Icon(Icons.phone)),
        ],
        foregroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,  
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image(
                  width: 120,
                  height: 200,
                  image: NetworkImage(
                      "https://thumbs.dreamstime.com/b/sun-flower-transparent-background-additional-png-file-greeting-cards-holiday-wishes-sun-flower-transparent-129371261.jpg")),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email", 
                  prefixIcon: Icon(Icons.email),
                ),
                controller: _emailController,
                validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    return null;
  },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("password");
                    },
                    icon: Icon(Icons.visibility),
                  ),
                ),
                controller: _passwordController,
                validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  },
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async{
             if (_formKey.currentState!.validate())  {
 try {      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text,);

    Get.to(MainLayot());

 }catch(e){
print(e);
 }
  
  
      }
                },
                child: Text("sing up"),
                color: Colors.amber,
                hoverColor: Colors.green,
                minWidth: double.infinity,
                height: 50,
              ),
              SizedBox(
                height: 20,
              ),
           
              TextButton(onPressed: () {

Get.to(LoginPage());
                
              }, child: Text("Sing in")),
              SizedBox(
                height: 20,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}