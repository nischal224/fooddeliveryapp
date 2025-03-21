// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:fooddeliveryapp/pages/home.dart';
// import 'package:fooddeliveryapp/pages/order.dart';
// import 'package:fooddeliveryapp/pages/profile.dart';
// import 'package:fooddeliveryapp/pages/wallet.dart';

// class Bottonnav extends StatefulWidget {
//   const Bottonnav({super.key});

//   @override
//   State<Bottonnav> createState() => _BottonnavState();
// }

// class _BottonnavState extends State<Bottonnav> {
//   int currentTabIndex = 0;

//   late List<Widget> pages;
//   late Widget currentPage;
//   late Home homepage;
//   late Profile profile;
//   late Wallet wallet;
//   late Order order;

//   @override
//   void initstate() {
//     super.initState();
//     homepage = Home();
//     order = Order();
//     wallet = Wallet();
//     profile = Profile();
//     pages = [homepage, order, wallet, profile];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 65,
//         backgroundColor: Colors.white,
//         color: Colors.black,
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (int index) {
//           setState(() {
//             currentTabIndex = index;
//           });
//         },
//         items: const [
//           Icon(Icons.home_outlined, color: Colors.black),
//           Icon(Icons.shopping_bag_outlined, color: Colors.black),
//           Icon(Icons.wallet_outlined, color: Colors.black),
//           Icon(Icons.person_2_outlined, color: Colors.black),
//         ],
//       ),
//       body: pages[currentTabIndex],
//     );
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home.dart';
import 'package:fooddeliveryapp/pages/order.dart';
import 'package:fooddeliveryapp/pages/profile.dart';
import 'package:fooddeliveryapp/pages/wallet.dart';

class Bottonnav extends StatefulWidget {
  const Bottonnav({super.key});

  @override
  State<Bottonnav> createState() => _BottonnavState();
}

class _BottonnavState extends State<Bottonnav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;

  late Home homepage;
  late Profile profile;
  late Wallet wallet;
  late Order order;

  @override
  void initState() {
    super.initState();
    homepage = Home();
    order = Order();
    wallet = Wallet();
    profile = Profile();
    pages = [homepage, order, wallet, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 75, 32, 46),
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.shopping_bag_outlined, color: Colors.white),
          Icon(Icons.wallet_outlined, color: Colors.white),
          Icon(Icons.person_2_outlined, color: Colors.white),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
