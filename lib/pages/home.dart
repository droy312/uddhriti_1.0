import 'package:flutter/material.dart';
import 'package:uddhriti/pages/screens/create_post_screen.dart';
import 'package:uddhriti/pages/screens/feed_screen.dart';
import 'package:uddhriti/pages/screens/search_screen.dart';
import 'package:uddhriti/pages/screens/notification_screen.dart';
import 'package:uddhriti/pages/screens/profile_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties
  int currentTab = 0;
  final List<Widget> screens = [
    FeedScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ]; //storing tab views

  // active page ( tab )

  Widget currentScreen = FeedScreen(); // initial screen in viewport

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      // FAB
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePostScreen()));
        },
      ),

      // FAB position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = FeedScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey[600],
                        ),
                        Text(
                          "Feed",
                          style: TextStyle(
                            color: currentTab == 0
                                ? Theme.of(context).primaryColor
                                : Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = SearchScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: currentTab == 1
                              ? Theme.of(context).primaryColor
                              : Colors.grey[600],
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: currentTab == 1
                                ? Theme.of(context).primaryColor
                                : Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = NotificationScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2
                              ? Theme.of(context).primaryColor
                              : Colors.grey[600],
                        ),
                        Text(
                          "Activity",
                          style: TextStyle(
                            color: currentTab == 2
                                ? Theme.of(context).primaryColor
                                : Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfileScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? Theme.of(context).primaryColor
                              : Colors.grey[600],
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: currentTab == 3
                                ? Theme.of(context).primaryColor
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
