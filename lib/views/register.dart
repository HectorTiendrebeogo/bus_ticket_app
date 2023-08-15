import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0,right: 25.0),
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: SingleChildScrollView(
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
                            labelText: "Votre nom"
                        ),
                        validator: (value){
                        },
                      ),
                      const SizedBox(height:20),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            labelText: "Votre prenom"
                        ),
                        validator: (value){
                        },
                      ),
                      const SizedBox(height:20),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(Icons.phone_enabled_outlined),
                            labelText: "Votre numéro de téléphone"
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
                            labelText: "Confirmer votre mot de passe"
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

                            }, child: const Text("S'inscrire",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                        ),
                      ),
                    ],
                  )
              ),
            )
        ),
      ),
    );
  }
}
