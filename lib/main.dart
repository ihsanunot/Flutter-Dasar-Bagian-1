import 'package:flutter/cupertino.dart';
import 'search_page.dart';
import 'setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

/* Contoh CupertinoTabScaffold */
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        //tabBuilder nya buat nampilin halaman berdasarkan indeks tab yg dipilih
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FeedsPage();
            case 1:
              return SearchPage();
            case 2:
              return SettingPage();
            default:
              return Center(
                child: Text('Halaman nya Gak ketemu...'),
              );
          } // switch
        });
  }
}
