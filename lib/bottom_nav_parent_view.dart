import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_webview_app/webview.dart';
import 'package:flutter/material.dart';

class BottomNavParentView extends StatefulWidget {

  @override
  _BottomNavParentViewState createState() => _BottomNavParentViewState();
}

class _BottomNavParentViewState extends State<BottomNavParentView> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            WebViewTest('https://www.asia-quest.jp/'),
            WebViewTest('https://dx-navigator.com/'),
            WebViewTest('https://www.asia-quest.jp/company/'),
            WebViewTest('https://www.asia-quest.jp/contact/'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('ホーム'),
              icon: Icon(Icons.home),
              activeColor: Colors.black,
              inactiveColor: Colors.black38
          ),
          BottomNavyBarItem(
              title: Text('DX'),
              icon: Icon(Icons.ballot),
              activeColor: Colors.black,
              inactiveColor: Colors.black38
          ),
          BottomNavyBarItem(
              title: Text('会社情報'),
              icon: Icon(Icons.home_work),
              activeColor: Colors.black,
              inactiveColor: Colors.black38
          ),
          BottomNavyBarItem(
              title: Text('お問合せ'),
              icon: Icon(Icons.question_answer),
              activeColor: Colors.black,
              inactiveColor: Colors.black38
          ),
        ],
      ),
    );
  }
}