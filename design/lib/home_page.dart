import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Design'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.ac_unit_outlined)),
              Tab(icon: Icon(Icons.ac_unit_outlined)),
              Tab(icon: Icon(Icons.ac_unit_outlined)),
            ],
          ),
        ),
        drawer: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          padding: const EdgeInsets.symmetric(vertical: 40),
          constraints: BoxConstraints.tight(
            Size.fromWidth(MediaQuery.of(context).size.width * 0.7),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: const [Text('1'), Text('2')],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Tab 1')),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
          ],
        ),
      ),
    );
  }
}

// Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(child: Text('Drawer')),
//             ListTile(
//               leading: const Text('Feature 1'),
//               onTap: () => Navigator.pop(context),
//             ),
//             const ListTile(
//               leading: Text('Feature 2'),
//             ),
//           ],
//         ),
//       ),

// OrientationBuilder(
//           builder: (context, orientation) => GridView.count(
//             shrinkWrap: true,
//             crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
//             children: List.generate(
//               100,
//               (index) => Text('$index'),
//             ),
//           ),
//         ),