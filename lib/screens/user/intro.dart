import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'perfil.dart';
import 'pesquisa.dart';
import 'home.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _currentIndex = 0;

  final List<Widget> _screens = [Home(), Pesquisar(), Agenda()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: kBottomNavigationBarHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment(0, 2),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/house.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    activeIcon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/lupa.svg',
                      width: 24,
                      height: 24,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/images/lupaCheia.svg',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person,),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[400],
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          )
        ],
      ),
    );
  }
}
