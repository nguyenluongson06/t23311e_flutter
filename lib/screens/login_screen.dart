
import 'package:flutter/material.dart';
import 'package:t2311e_demo/providers/user_provider.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black12,
                offset:  Offset(0,4)
              )
            ]
          ),
          child: Form(
             key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  Icon(Icons.lock, size: 60, color: Colors.blueAccent),
                  SizedBox(height: 16),
                  Text("LOGIN", style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: "Enter Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    validator: (value){
                      // todo  : valiate input
                    }
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      validator: (value){
                        // todo  : valiate input
                      }
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  )
                ],
              )
          ),

        ),
      ),
    );
  }


}
