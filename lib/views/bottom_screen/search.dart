import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../seats.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,this.restorationId = 'main'});
  final String? restorationId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin,RestorationMixin{
  late final TabController _tabController;

  final TextEditingController _form1TypeCarDepartController = TextEditingController();
  final TextEditingController _form1VilleDepartController = TextEditingController();
  final TextEditingController _form1VilleDestController = TextEditingController();
  final TextEditingController _form1dateDepartController = TextEditingController();

  final TextEditingController _form2TypeCarDepartController = TextEditingController();
  final TextEditingController _form2VilleDepartController = TextEditingController();
  final TextEditingController _form2VilleDestController = TextEditingController();
  final TextEditingController _form2dateDestController = TextEditingController();
  final TextEditingController _form2dateDepartController = TextEditingController();
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
  // TODO: implement restorationId
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day),
          lastDate: DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        _form1dateDepartController.text = "${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }
  final List<String> villes = [
    'Ouagadougou',
    'Bobo-Dioulasso',
    'Koudougou'
  ];
  final List<String> type = [
    'SIMPLE',
    'VIP',
  ];
  String? selectedValue;
  final _form1Key = GlobalKey<FormState>();
  final _form2Key = GlobalKey<FormState>();
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
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              TabBar.secondary(
                controller: _tabController,
                tabs:  <Widget>[
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.double_arrow_outlined,color: Theme.of(context).primaryColor,),
                        Text("ALLER SIMPLE"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.double_arrow_outlined,color: Theme.of(context).primaryColor,),
                        Text("ALLER-RETOUR"),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    SingleChildScrollView(
                     padding: EdgeInsets.only(left: 20,right: 20),
                     child: Form(
                       key: _form1Key,
                       child: Column(
                         children: [
                           const SizedBox(height: 30),
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
                               'Départ',
                               style: TextStyle(fontSize: 14),
                             ),
                             items: villes
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
                               selectedValue = value.toString();
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
                           const SizedBox(height: 30),
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
                               'Destination',
                               style: TextStyle(fontSize: 14),
                             ),
                             items: villes
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
                               selectedValue = value.toString();
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
                           const SizedBox(height: 30),
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
                               'Type',
                               style: TextStyle(fontSize: 14),
                             ),
                             items: type
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
                               selectedValue = value.toString();
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
                             controller: _form1dateDepartController,
                             readOnly: true,
                             textAlign: TextAlign.center,
                             decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 prefixIcon: const Icon(Icons.date_range_outlined),
                                 labelText: "Date de départ"
                             ),
                             onTap: (){
                               print("object");
                               _restorableDatePickerRouteFuture.present();
                             },
                             validator: (value){

                             },
                           ),
                           SizedBox(height: 30,),
                           SizedBox(
                             width: double.infinity,
                             height: 50,
                             child: ElevatedButton(
                                 style: Theme.of(context).elevatedButtonTheme.style,
                                 onPressed: () {
                                   showModalBottomSheet<void>(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return SizedBox(
                                         height: MediaQuery.of(context).size.height/2,
                                         child: Center(
                                           child: Padding(
                                             padding: const EdgeInsets.all(25.0),
                                             child: Column(
                                               children: <Widget>[
                                                 const Text('Départs disponible',style: TextStyle(fontSize: 25),),
                                                 Expanded(
                                                     child: ListView.separated(itemBuilder: (context,index){
                                                       return ListTile(
                                                         title: Text("Départ 25"),
                                                         subtitle: Text("Date : 25 Aout 2023"),
                                                         trailing: const Column(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                           children: [
                                                             Text("14h 15min"),
                                                             Text("8 places dispo"),
                                                           ],
                                                         ),
                                                         onTap: (){
                                                           Navigator.of(context).pop();
                                                           Navigator.push(context, MaterialPageRoute(builder: (context){
                                                             return BusLayout();
                                                           }));
                                                         },
                                                       );
                                                     }, separatorBuilder: (BuildContext context, int index) {
                                                       return Divider();
                                                     }, itemCount: 5,)
                                                 )
                                               ],
                                             ),
                                           ),
                                         ),
                                       );
                                     },
                                   );
                                 }, child: const Text("Rechercher",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                             ),
                           ),
                         ],
                       ),
                     ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Form(
                        key: _form2Key,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
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
                                'Départ',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: villes
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
                                selectedValue = value.toString();
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
                            const SizedBox(height: 30),
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
                                'Destination',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: villes
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
                                selectedValue = value.toString();
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
                            const SizedBox(height: 30),
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
                                'Type',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: type
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
                                selectedValue = value.toString();
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
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: const Icon(Icons.date_range_outlined),
                                  labelText: "Date de départ"
                              ),
                              onTap: (){
                                print("object");
                                _restorableDatePickerRouteFuture.present();
                              },
                              validator: (value){

                              },
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: const Icon(Icons.date_range_outlined),
                                  labelText: "Date de retour"
                              ),
                              onTap: (){
                                print("object");
                                _restorableDatePickerRouteFuture.present();
                              },
                              validator: (value){

                              },
                            ),
                            SizedBox(height: 30,),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  style: Theme.of(context).elevatedButtonTheme.style,
                                  onPressed: (){
                                  }, child: const Text("Rechercher",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}