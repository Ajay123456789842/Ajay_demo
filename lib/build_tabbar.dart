import 'package:flutter/material.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 50,
            child: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.directions_car,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Bike',
                    ),
                  ),
                ),

                // second tab bar viiew widget
                Container(
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      'Car',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
