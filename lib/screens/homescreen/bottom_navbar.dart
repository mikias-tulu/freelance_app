import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:freelance_app/screens/homescreen/components/categories.dart';
import 'package:freelance_app/utils/colors.dart';
import 'package:freelance_app/screens/homescreen/components/posted_jobs.dart';
import 'package:freelance_app/screens/homescreen/sidebar.dart';
import 'package:freelance_app/screens/homescreen/bottom_navbar.dart';
import 'package:freelance_app/screens/search/search_screen.dart';
import 'package:popup_card/popup_card.dart';

import 'components/job_post.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationPage(
        title: "getJOBS",
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const Homepage(),
        //const Logs(),
        //ProgressPage(),
      ][currentIndex],
      floatingActionButton: PopupItemLauncher(
        tag: 'test',
        popUp: PopUpItem(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 2,
          tag: 'test',
          child: JobPosts(),
        ),
        child: Material(
          color: Colors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.add_rounded,
            size: 40,
            color: Colors.blueGrey,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Colors.white,
        hasNotch: false,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: 0.5,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(0),
        ), //border radius doesn't work when the notch is enabled.
        //elevation: 10,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),

        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text(
                "Search",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(
                Icons.library_books,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.library_books,
                color: Colors.white,
              ),
              title: Text(
                "Activity",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.blueGrey,
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_outline_rounded,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Color(0xFFFFFFFF)),
              )),
        ],
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 180),
          child: Text(
            "getJOBS",
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "Find Your Perfect ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Job",
                style: TextStyle(
                  color: yellow,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            Category(),
            SizedBox(
              height: 10,
            ),
            Postedjob(),
            //Bottomnavbar(),
          ],
        ),
      ),
    );
  }
}
