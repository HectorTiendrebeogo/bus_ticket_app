import 'package:book_my_seat/book_my_seat.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class BusLayout extends StatefulWidget {
  const BusLayout({Key? key}) : super(key: key);

  @override
  State<BusLayout> createState() => _BusLayoutState();
}

class _BusLayoutState extends State<BusLayout> with TickerProviderStateMixin{
  late final TabController _tabController;
  //Set<SeatNumber> selectedSeats = {};
  final List<int> seats = [1,2,3,4,8,14,28];
  int? selectedValue;
  String? payementselectedValue;
  final List<String> payement = [
    'Orange money',
    'Moov money',
  ];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siège"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TabBar.secondary(
              controller: _tabController,
              tabs:  <Widget>[
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.double_arrow_outlined,color: Theme.of(context).primaryColor,),
                      Text("Pour moi"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.double_arrow_outlined,color: Theme.of(context).primaryColor,),
                      Text("Pour un autre"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Form(child: Column(
                      children: [
                        SizedBox(height: 30,),
                        DropdownButtonFormField2<int>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            prefixIcon: Icon(Icons.airplane_ticket_outlined),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Sièges disponible',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: seats
                              .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              item.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 30,),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            prefixIcon: Icon(Icons.airplane_ticket_outlined),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Moyens de paiements',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: payement
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                          },
                          onSaved: (value) {
                            payementselectedValue = value;
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Numéro du paiement",prefixIcon: Icon(Icons.phone_enabled_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return OtpScreen();
                                }));
                              }, child: const Text("Valider",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                          ),
                        ),
                      ],
                    )),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nom et prénom",prefixIcon: Icon(Icons.account_circle_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Numéro de téléphone",prefixIcon: Icon(Icons.phone_enabled_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          DropdownButtonFormField2<int>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              // Add Horizontal padding using menuItemStyleData.padding so it matches
                              // the menu padding when button's width is not specified.
                              prefixIcon: Icon(Icons.airplane_ticket_outlined),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Add more decoration..
                            ),
                            hint: const Text(
                              'Sièges disponible',
                              style: TextStyle(fontSize: 14),
                            ),
                            items: seats
                                .map((item) => DropdownMenuItem<int>(
                              value: item,
                              child: Text(
                                item.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //Do something when selected item is changed.
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          SizedBox(height: 30,),
                          DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              // Add Horizontal padding using menuItemStyleData.padding so it matches
                              // the menu padding when button's width is not specified.
                              prefixIcon: Icon(Icons.airplane_ticket_outlined),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Add more decoration..
                            ),
                            hint: const Text(
                              'Moyens de paiements',
                              style: TextStyle(fontSize: 14),
                            ),
                            items: payement
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //Do something when selected item is changed.
                            },
                            onSaved: (value) {
                              payementselectedValue = value;
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Numéro du paiement",prefixIcon: Icon(Icons.phone_enabled_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: Theme.of(context).elevatedButtonTheme.style,
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return OtpScreen();
                                  }));
                                }, child: const Text("Valider",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                            ),
                          ),
                        ],
                      )
                ),
                  )
                ]
              ),
            ),
          ],
        ),
      ) /*CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: seat(true),
          )
          /*SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: SeatLayoutWidget(
                    onSeatStateChanged: (rowI, colI, seatState) {
                      if (seatState == SeatState.selected) {
                        selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                      } else {
                        selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                      }
                    },
                    stateModel: const SeatLayoutStateModel(
                      rows: 18,
                      cols: 4,
                      seatSvgSize: 50,
                      pathSelectedSeat: 'assets/seat_selected.svg',
                      pathDisabledSeat: 'assets/seat_disabled.svg',
                      pathSoldSeat: 'assets/seat_sold.svg',
                      pathUnSelectedSeat: 'assets/seat_unselected.svg',
                      currentSeatsState: [
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [
                          SeatState.selected,
                          SeatState.unselected,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                        [SeatState.unselected,
                          SeatState.sold,
                          SeatState.unselected,
                          SeatState.unselected,
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            color: Colors.grey.shade700,
                          ),
                          const SizedBox(width: 2),
                          const Text('Disabled')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            color: Colors.lightBlueAccent,
                          ),
                          const SizedBox(width: 2),
                          const Text('Sold')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(border: Border.all(color: const Color(0xff0FFF50))),
                          ),
                          const SizedBox(width: 2),
                          const Text('Available')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            color: const Color(0xff0FFF50),
                          ),
                          const SizedBox(width: 2),
                          const Text('Selected by you')
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFFfc4c4e)),
                  ),
                  child: const Text('Show my selected seat numbers'),
                ),
                const SizedBox(height: 12),
                Text(selectedSeats.join(" , "))
              ],
            ),
          )*/
        ]
      ),*/
    );
  }
}

Widget seat(bool isAvailable,int number){
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Couleur de la bordure
          width: 2.0,
        ),
      borderRadius: const BorderRadius.all(Radius.circular(10))
    ),
    height: 50,
    width: 50,
    child: Text(number.toString()),
  );
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == (other).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}