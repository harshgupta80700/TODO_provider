import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/providers/floatingactionbuttonprovider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ButtonProvider buttonProvider = locator<ButtonProvider>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

        floatingActionButton: FloatingActionButton(
          onPressed:(){
            buttonProvider.tapCount = buttonProvider.tapCount + 1;
            print(buttonProvider.tapCount);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),

      body: Consumer<ButtonProvider>(
        builder: (ctx,provider,child){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    provider.tapCount.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
        }
      ),
    );
  }
}
