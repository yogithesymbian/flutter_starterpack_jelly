import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewScreen extends StatefulWidget {
  static const String id = '/list_view_screen';
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Headline',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(child: Text('Dummy Card Text')),
                ),
              ),
            ),
            Text(
              'Demo Headline 2',
              style: TextStyle(fontSize: 18),
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Card(
                child: ListTile(
                  title: Text('Motivation $int'),
                  subtitle: Text('this is a description of the motivation'),
                ),
              ),
            ),
            Text(
              'Demo Headline 3',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              height: 300.0,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                // physics: ClampingScrollPhysics(),
                // shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) => Card(
                  margin: EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text('Motivation $int'),
                    subtitle: Text('this is a description of the motivation'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
