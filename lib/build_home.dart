import 'package:demo/bottom_nav_items.dart';
import 'package:demo/home_page.dart';
import 'package:flutter/material.dart';

class BuildHomeWidget extends StatefulWidget {
  const BuildHomeWidget({super.key});

  @override
  State<BuildHomeWidget> createState() => _BuildHomeWidgetState();
}

class _BuildHomeWidgetState extends State<BuildHomeWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: const Color.fromARGB(255, 7, 152, 255),
        onTap: (index) {
          _onItemTapped(index);
        },
        currentIndex: _selectedIndex,
        items: [
          ...NavItems.icons()
              .entries
              .map(
                (e) => BottomNavigationBarItem(
                  label: e.key,
                  icon: Icon(
                    e.value,
                  ),
                ),
              )
              .toList(),
        ],
      ),
      // backgroundColor: Colors.black,
      body: bottomWidgets[_selectedIndex],
    );
  }
}

List<Widget> bottomWidgets = [
  HomePage(),
  const Center(
    child: Text('To do'),
  ),
  const Center(
    child: Text('To do'),
  ),
];
