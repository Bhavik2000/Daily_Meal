import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';
import './categories.dart';
import '../screens/favorites.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  Tabs(this.favoriteMeals);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': Categories(),
        'title': 'Categories',
      },
      {
        'page': Favorites(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              //tab
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              //tab
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ]),
    );
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(tabs: <Widget>[
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Category',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',
    //         ),
    //       ]),
    //     ),
    //     body: TabBarView(children: <Widget>[
    //       Categories(),
    //       Favorites(),
    //     ]),
    //   ),
    // );
  }
}
