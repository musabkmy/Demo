// import 'package:flutter/material.dart';
// import 'package:test3/Maxlook/shared/shared_funtions.dart';
// import 'package:test3/Maxlook/utils/constants.dart';
// import 'package:test3/Maxlook/utils/enums.dart';

// class ProducstsTabs extends StatefulWidget {
//   const ProducstsTabs({Key? key}) : super(key: key);

//   @override
//   State<ProducstsTabs> createState() => _ProducstsTabsState();
// }

// class _ProducstsTabsState extends State<ProducstsTabs>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     tabController = TabController(length: noOfTabsAvailable(), vsync: this);
//     tabController.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('in tabs');
//     return
//         // tabController.length == 1
//         //     ? SizedBox()
//         //     :
//         Container(
//       // width: double.maxFinite,
//       alignment: Alignment.centerLeft,
//       padding: const EdgeInsets.symmetric(vertical: minPadding),
//       child: Column(
//         children: [
//           TabBar(controller: tabController, tabs: _tabBarTitles()),
//           TabBarView(controller: tabController, children: _tabBarBodies()),
//         ],
//       ),
//     );
//   }

//   List<Widget> _tabBarTitles() {
//     late List<Widget> _titles = [];
//     int nextIndex = 1;
//     _titles.add(_tabBarTitle('All', 0));
//     if (productsHasNew()) {
//       _titles.add(_tabBarTitle('Newest', nextIndex));
//       nextIndex++;
//     }
//     if (productsHasPopular()) {
//       _titles.add(_tabBarTitle('Popular', nextIndex));
//       nextIndex++;
//     }
//     if (productsHasMan()) {
//       _titles.add(_tabBarTitle('Man', nextIndex));
//       nextIndex++;
//     }
//     if (productsHasWoman()) {
//       _titles.add(_tabBarTitle('Woman', nextIndex));
//       nextIndex++;
//     }

//     return _titles;
//   }

//   Widget _tabBarTitle(String title, int index) {
//     return Tab(
//       child: Text(title,
//           style: tabController.index == index
//               ? TextStyle(
//                   color: darkColor,
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.underline)
//               : TextStyle(
//                   color: darkColor.withOpacity(0.5),
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.normal)),
//     );
//   }

//   List<Widget> _tabBarBodies() {
//     late List<Widget> _bodies = [];
//     int nextIndex = 1;
//     _bodies.add(_tabBarBody(ProductsTab.all, 0));
//     if (productsHasNew()) {
//       _bodies.add(_tabBarBody(ProductsTab.newest, nextIndex));
//       nextIndex++;
//     }
//     if (productsHasPopular()) {
//       _bodies.add(_tabBarBody(ProductsTab.popular, nextIndex));
//       nextIndex++;
//     }
//     if (productsHasMan()) {
//       _bodies.add(_tabBarBody(ProductsTab.man, nextIndex));
//       nextIndex++;
//     }
//     if (productsHasWoman()) {
//       _bodies.add(_tabBarBody(ProductsTab.woman, nextIndex));
//       nextIndex++;
//     }

//     return _bodies;
//   }

//   Widget _tabBarBody(ProductsTab productsTab, int index) {
//     return SizedBox(
//       height: 10,
//     );
//     // return GridView(gridDelegate: gridDelegate);
//   }
// }
