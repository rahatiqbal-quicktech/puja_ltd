import 'package:flutter/material.dart';
import 'package:puja_ltd/common/screens/blank_screen.dart';
import 'package:puja_ltd/features/history/history_screen.dart';
import 'package:puja_ltd/features/home/home_screen.dart';
import 'package:puja_ltd/features/navigation_drawer/navigation_drawer.dart';
import 'package:puja_ltd/features/request/requests_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<Widget> screensList = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    const RequestScreen(),
  ];
  var _currentIndex = 0;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _onItemTapped(int index) {
    index == 3
        ? _drawerKey.currentState?.openDrawer()
        : setState(() {
            _currentIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SideNavigationDrawer(),
      body: screensList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.grey.shade200,
        onTap: _onItemTapped,
        //  (value) {
        //   setState(() {
        //     _currentIndex = value;
        //   });
        // },
      ),
    );
  }
}
