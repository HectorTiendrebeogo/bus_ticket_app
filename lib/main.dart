import 'package:bus_ticket_app/views/login.dart';
import 'package:bus_ticket_app/views/register.dart';
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
      title: 'Flutter Demo',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 50, 0, 1),
        primaryColorLight: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(255, 50, 0, 1),foregroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 50, 0, 1)),
        primaryTextTheme: const TextTheme(
          displayLarge: TextStyle(color: Color.fromRGBO(255, 50, 0, 1)),
          titleMedium: TextStyle(color: Color.fromRGBO(255, 50, 0, 1)),
        ),
        dividerTheme: const DividerThemeData(color:Color.fromRGBO(255, 50, 0, 1)),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white),backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 50, 0, 1)))),
        useMaterial3: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("COMPANY",style: Theme.of(context).textTheme.displayLarge),
                    Text("La passion de prendre la route",style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: (){
                              Navigator.pushReplacement(context,
                                  PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
                                    return LoginScreen();
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
                            }, child: const Text("Se connecter",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Pas de compte ?'),
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context,
                              PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
                                return const RegisterScreen();
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
                          }, child: const Text("Créer un compte"))
                        ],
                      )
                    ],
                  )
              )
            ],
          )
        ),
      ),
    );
  }
}
