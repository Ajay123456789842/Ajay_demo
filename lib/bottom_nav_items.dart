import 'package:flutter/material.dart';

class NavItems {
  // static List<IconData> icons = [
  //   Icons.home,
  //   Icons.sim_card,
  //   Icons.launch,
  // ];
  static Map<String, IconData> icons() {
    return {
      'Home': Icons.home,
      'eSim': Icons.sim_card,
      'Account': Icons.person,
    };
  }
//   static List<Widget> getBotNavItems() {
//     // return
// //
//     return BottomNavigationBarItem(icon: )
//   }
}
