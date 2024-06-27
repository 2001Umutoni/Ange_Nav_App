import 'package:flutter/material.dart';
import 'Register.dart';
import 'Signin.dart';
import 'Mycalculators.dart';
import 'my_drawer_header.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.Register;

  @override
  Widget build(BuildContext context) {
    Widget container;
    if (currentPage == DrawerSections.Register) {
      container = SignUpScreen();
    } else if (currentPage == DrawerSections.Signin) {
      container = SignInScreen();
    } else if (currentPage == DrawerSections.MyCalculators) {
      container = CalculatorHomePage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Ange Tech"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Register", Icons.dashboard_outlined,
              currentPage == DrawerSections.Register ? true : false),
          menuItem(2, "Signin", Icons.people_alt_outlined,
              currentPage == DrawerSections.Signin ? true : false),
          menuItem(3, "My Calculators", Icons.calculate,
              currentPage == DrawerSections.MyCalculators ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.Register;
            } else if (id == 2) {
              currentPage = DrawerSections.Signin;
            } else if (id == 3) {
              currentPage = DrawerSections.MyCalculators;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  Register,
  Signin,
  MyCalculators,
}
