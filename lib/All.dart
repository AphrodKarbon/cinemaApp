
import 'package:flutter/material.dart';
import './component/CustomSearchDelegate.dart';
import 'package:cinema/View/MoviesPage.dart';
import 'package:cinema/View/HomePage.dart';
import 'package:cinema/View/AccountPage.dart';
import 'package:sliver_tools/sliver_tools.dart';




class All extends StatefulWidget {
  const All({super.key, required this.title});
  final String title;

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  int selectedIndex = 1;
  List<Widget> pages = const [
    MoviesPage(),
    HomePage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverStack(
            children: [
              SliverToBoxAdapter(
                child: IndexedStack(
                  index: selectedIndex,
                  children: pages,
                ),
              ),
              mySearchBar(),
            ]
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          itemNav(Icons.mode_standby_outlined, "Films"),
          itemNav(Icons.home, "Acceuil"),
          itemNav(Icons.account_box, "Compte"),
        ],
        iconSize: 35,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        onTap: (int index) => taped(index),
      ),
    );
  }

  void taped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  SliverAppBar mySearchBar() {
    return SliverAppBar(
      pinned: selectedIndex == 0 ? false : true,
      floating: true,
      snap: true,
      stretch: true,
      backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black,  Colors.transparent ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
            }, 
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            )
          )
        ],
      );
  }

  BottomNavigationBarItem itemNav(IconData i, String lab) {
    return BottomNavigationBarItem(
      icon: Icon(
        i,
        color: Colors.white
      ),
      label: lab,
    );
  }
}