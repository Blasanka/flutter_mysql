import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  WorkCard({this.title, this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 1.42;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Card(
        color: Color(0xFF355D76),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                child: Container(
                  child: Text(title.substring(0, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(title, style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ), overflow: TextOverflow.fade,),
                    ),
                    Container(
                      width: width,
                      child: Text(description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
