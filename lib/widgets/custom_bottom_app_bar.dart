import 'package:flutter/material.dart';

class MyCustomBottomAppBar extends StatelessWidget {
  const MyCustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      elevation: 0,
      child: TabBar(
        indicatorColor: Colors.red,
        dividerColor: Colors.transparent,
        unselectedLabelColor: Colors.black,
        tabs: [
          FittedBox(
              child: Tab(
                  icon: Icon(
            Icons.list_outlined,
            color: Colors.red,
            size: 30,
          ))),
          FittedBox(
            child: Tab(
                icon: Icon(Icons.map_outlined, color: Colors.red, size: 30)),
          ),
          FittedBox(
            child: Tab(
                icon: Icon(Icons.search_outlined, color: Colors.red, size: 30)),
          ),
        ],
      ),
    );
  }
}
