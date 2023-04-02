import 'package:flutter/material.dart';
import 'package:testbzb/test.dart';
import 'SCREENAS/_campaigns.dart';
import 'SCREENAS/_favorite.dart';
import 'SCREENAS/_home.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TESTAPI(),
      ///home: const A(),
    );
  }
}

class TESTAPI extends StatefulWidget {
  const TESTAPI({Key? key}) : super(key: key);

  @override
  State<TESTAPI> createState() => _TESTAPIState();
}
class _TESTAPIState extends State<TESTAPI> {
  int index = 0;
  final screens = [
    Home(),
    Campaigns(),
    Favorite(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
      body: screens[index],
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.orange[100],
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 10,fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            backgroundColor: Colors.grey[100],
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (Index)=>
                setState(() => this.index = Index),
            destinations: [
              NavigationDestination(
                icon: Container(
                  height: 25,width: 25,
                    child: Image.asset('asset/icons/home.png')),
                label: 'Home',
              ),
              NavigationDestination(
                  icon: Container(
                    height: 25,width: 25,
                    child: Image.asset("asset/icons/gift.png"),
                  ),
                  label: 'Campaigns'),
              NavigationDestination(
                  icon: Container(
                      height: 25,width: 25,
                      child: Image.asset('asset/icons/heart.png')),
                  label: 'Favorite'),
            ],
          )
      )
  );
}




