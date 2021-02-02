import 'screen/animations.dart';
import 'screen/form_validate.dart';
import 'screen/long_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Full App',
      //Quitamos el debug
       debugShowCheckedModeBanner: false,
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text(
                  'Drawer header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Formulario'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormValidate(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Listas en Flutter'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LongList()));
                },
              ),
              ListTile(
                title: Text('Animaciones'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Anim(),
                      ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Curso Flutter 2'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.history), text: 'Historial'),
              Tab(icon: Icon(Icons.person), text: 'Perfil'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.home, size: 36, color: Colors.blue),
            Icon(Icons.history, size: 36, color: Colors.blue),
            Icon(Icons.person, size: 36, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
