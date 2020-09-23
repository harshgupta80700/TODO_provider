import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/buttonprovider.dart';
import 'package:provider_practice/providers/supplyProvider.dart';
import 'package:provider_practice/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: supplyProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
        initialRoute: "/",
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonProvider>(
      builder: (context,provider,child){
        return Scaffold(

            appBar: AppBar(),

            floatingActionButton: FloatingActionButton(
              onPressed:(){
                provider.tapCount = provider.tapCount + 1;
                print(provider.tapCount);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),

            body: Center(
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
            )
        );
      },
    );
  }
}
