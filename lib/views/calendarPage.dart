import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    CalendarController controller = new CalendarController(
        minYear: 1990,
        minYearMonth: 1,
        maxYear: 2020,
        maxYearMonth: 12,
        showMode: CalendarConstants.MODE_SHOW_MONTH_AND_WEEK);
    CalendarViewWidget calendar = CalendarViewWidget(
        calendarController: controller,
        dayWidgetBuilder: (DateModel dateModel) {
          Color bgColor = dateModel.isCurrentDay
              ? Color.fromRGBO(140, 242, 212, 1)
              : Colors.transparent;
          Color fgColor = dateModel.isCurrentDay
              ? Color.fromRGBO(0, 0, 0, 1)
              : Colors.white;
          Color lunarFgColor = dateModel.isCurrentDay
              ? Color.fromRGBO(0, 0, 0, 0.5)
              : Colors.white38;
          return Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              child: InkWell(
                  child: Container(
                alignment: Alignment.center,
                color: bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      dateModel.day.toString(),
                      style: TextStyle(color: fgColor),
                    ),
                    Text(
                      dateModel.lunarString,
                      style: TextStyle(color: lunarFgColor),
                    ),
                  ],
                ),
              ),
              onTap: (){
               
              },
              ),
            ),
          );
        }
        );
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(66, 68, 70, 1),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              color: Color.fromRGBO(66, 68, 70, 1),
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: paddingTop),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                        child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 40,
                      ),
                    )),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '日历',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: calendar,
            )
          ],
        ),
      ),
    );
  }
}
