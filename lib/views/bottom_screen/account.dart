import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
        toolbarHeight: 60,
        flexibleSpace: SafeArea(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                  ),
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Bienvenue",style: TextStyle(fontSize: 12,color: Theme.of(context).primaryColorLight),),
                          Text("Mr Tiendrebeogo", style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColorLight),),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.no_accounts_outlined))
        ],
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
                            labelText: "Tiendrebeogo"
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
                            labelText: "Hector"
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
                            labelText: "HectorTiendre"
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
                            labelText: "+226 74 86 64 22"
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
                            labelText: "***********"
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

                            }, child: const Text("Modifier",style: TextStyle(fontSize: 20,letterSpacing: 2),)
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
