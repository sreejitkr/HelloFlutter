import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      showSemanticsDebugger: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }

}




class _HomeScreenState extends  State<HomeScreen> {
  List<String> items = <String>[];
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),

      body : Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Enter Item Name',
                    style: Theme.of(context).textTheme.display4,
                    key: ValueKey("labeltext"),
                  ),
                  Expanded(
                    child:  TextField(
                      onSubmitted: (newValue) {
                        setState(() {
                          text = newValue;
                        });
                      },
                      decoration: InputDecoration(
                          border:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                          ),
                          hintText: 'Enter a name'
                      ),
                    ),
                  )
                ],
              ),
              Expanded (
                child:  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Center(child: Text('${items[index]}')),
                      );
                    }
                ),
              )
            ],
          )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            if (text.length != 0) {
              setState(() {
                items.add(text);
              });
            }
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(
              'Add Item',
              key: ValueKey("textfield"),
          ),
        ),
      ),
    );
  }
}






