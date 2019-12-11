import 'package:diary/views/calendarPage.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'diary.dart';
class HeaderMain extends StatefulWidget {
  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<HeaderMain> {
  String typeText = '所有';
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return StickyHeader(
        header: Container(
          height: 50,
          color: Color.fromRGBO(66, 68, 70, 1),
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(top: paddingTop),
          child: Row(
            children: <Widget>[
              Material(
                  color: Colors.transparent,
                  child: PopupMenuButton(
                      offset: Offset(0, 60),
                      color: Color.fromRGBO(66, 68, 70, 1),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              typeText,
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      onSelected: (String value){
                        setState(() {
                          typeText = value;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<String>>[
                            PopupMenuItem(
                                value: '所有',
                                child: new Text(
                                  "所有",
                                  style: TextStyle(color: Colors.white),
                                )),
                            PopupMenuItem(
                                value: '今日',
                                child: new Text(
                                  "今日",
                                  style: TextStyle(color: Colors.white),
                                )),
                                PopupMenuItem(
                                value: '本周',
                                child: new Text(
                                  "本周",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ])),
              Expanded(
                flex: 1,
                child: Material(),
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                clipBehavior: Clip.antiAlias,
                child: Ink(
                  child: InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CalendarPage();
                        }));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.calendar_today, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        content: Container(
          color: Color.fromRGBO(66, 68, 70, 1),
          child: Diary(),
        ) 
        );
  }
}
