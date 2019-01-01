import 'package:flutter/material.dart';
import 'package:mysqltest/services/fetch_works.dart';
import 'package:mysqltest/widgets/app_background.dart';
import 'package:mysqltest/widgets/app_gradient.dart';
import 'package:mysqltest/widgets/work_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          backgroundImage,
          Container(
            decoration: gradient,
            child: FutureBuilder<List>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text('No data found!');
                  return snapshot.hasData
                      ? _buildItem(snapshot.data)
                      : Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add post',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(List list) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return WorkCard(title: list[index]['title'] ?? '', description: list[index]['description'] ?? '');
      },
    );
  }
}
