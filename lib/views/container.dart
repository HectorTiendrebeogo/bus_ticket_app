import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'bottom_screen/account.dart';
import 'bottom_screen/search.dart';
import 'bottom_screen/ticket.dart';

class DispatchingScreen extends StatefulWidget {
  const DispatchingScreen({super.key});

  @override
  State<DispatchingScreen> createState() => _DispatchingScreenState();
}

class _DispatchingScreenState extends State<DispatchingScreen> {
  final List<TabItem> _tabItems = List.of([
    //TabItem(Icons.home, "Accueil", const Color.fromRGBO(255, 50, 0, 1), labelStyle: const TextStyle(fontWeight: FontWeight.normal,color: Color.fromRGBO(255, 50, 0, 1))),
    TabItem(Icons.search, "Rechercher", const Color.fromRGBO(255, 50, 0, 1), labelStyle: const TextStyle(fontWeight: FontWeight.normal,color: Color.fromRGBO(255, 50, 0, 1))),
    TabItem(Icons.airplane_ticket_outlined, "Tickets", const Color.fromRGBO(255, 50, 0, 1), labelStyle: const TextStyle(fontWeight: FontWeight.normal,color: Color.fromRGBO(255, 50, 0, 1))),
    TabItem(Icons.account_circle_outlined, "MOn compte", const Color.fromRGBO(255, 50, 0, 1),labelStyle: const TextStyle(fontWeight: FontWeight.normal,color: Color.fromRGBO(255, 50, 0, 1))),
  ]);
  final List<Widget> _screens = [
    //const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const AccountScreen()
  ];
  int _selectedPos = 0;
  late CircularBottomNavigationController _navigationController;
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(_selectedPos);
  }
  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedPos],
      bottomNavigationBar: CircularBottomNavigation(
        _tabItems,
        controller: _navigationController,
        selectedCallback: (int? selectedPos) {
          setState(() {
            this._selectedPos = selectedPos ?? 0;
          });
          print("clicked on $selectedPos");
        },
      ),
    );
  }
}
