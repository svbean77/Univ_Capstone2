import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReportCalendar extends StatefulWidget {
  const ReportCalendar({Key? key}) : super(key: key);

  @override
  State<ReportCalendar> createState() => _ReportCalendarState();
}

class _ReportCalendarState extends State<ReportCalendar> {
  DateTime? selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int grade = 0;

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(),
      body: Column(
        children: [
          TableCalendar(
            locale: 'ko_KR',
            focusedDay: focusedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
                this.focusedDay = selectedDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return date.year == selectedDay!.year &&
                  date.month == selectedDay!.month &&
                  date.day == selectedDay!.day;
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: false,
              selectedDecoration: BoxDecoration(
                border: Border.all(
                  color: PRIMARY_COLOR[grade],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              outsideDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: TextStyle(color: PRIMARY_COLOR[grade]),
            ),
          ),
        ],
      ),
    );
  }
}
