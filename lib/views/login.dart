import 'package:bus_ticket_app/views/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      labelText: "Votre login"
                    ),
                    validator: (value){
                    },
                  ),
                  const SizedBox(height:20),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    obscureText: _showPassword ? true:false,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        }, icon: _showPassword ? Icon(Icons.visibility_outlined):Icon(Icons.visibility_off_outlined)),
                        labelText: "Votre mot de passe"
                    ),
                    validator: (value){

                    },
                  ),
                  const SizedBox(height:20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return DispatchingScreen();
                          }));
                        }, child: const Text("Se connecter",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Récuperer son compte '),
                      TextButton(onPressed: (){

                      }, child: Text("ici"))
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Pas de compte ?'),
                      TextButton(onPressed: (){
                        Navigator.push(context,
                          PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
                            return RegisterScreen();
                          },
                              transitionsBuilder: (context,animation,secondaryAnimation,child){
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              }
                          ),
                        );
                      }, child: Text("Créer un compte"))
                    ],
                  )
                ],
              )
          )
        ),
      ),
    );
  }
}
