import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/record/const/record_card.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordCalendar extends StatefulWidget {
  const RecordCalendar({Key? key}) : super(key: key);

  @override
  State<RecordCalendar> createState() => _RecordCalendarState();
}

class _RecordCalendarState extends State<RecordCalendar> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    int grade = 5;
    //실제로 불러오는 데이터는 내용, 작성일자 -> 작성일자별로 구분하는 코드가 필요
    List<String> contents = ['내용1\n엄ㅊ청\n\n\n\n길어\n짱', '내용2', '내용3'];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR[grade],
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRecord(grade: grade),
                scrollable: true,
              );
            },
          );
        },
        child: Icon(Icons.add,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: ListView(
        children: [
          Calendar(
            selectedDay: selectedDay,
            grade: grade,
            focusedDay: focusedDay,
            onDaySelected: onDaySelected,
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            height: 30.0,
            color: PRIMARY_COLOR[grade],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedDay.year}.${selectedDay.month}.${selectedDay.day}',
                  style: TextStyle(
                      color: (grade == 0 ||
                              grade == 1 ||
                              grade == 2 ||
                              grade == 4 ||
                              grade == 8)
                          ? Colors.black
                          : Colors.white),
                ),
                Text(
                  '${contents.length}개',
                  style: TextStyle(
                      color: (grade == 0 ||
                              grade == 1 ||
                              grade == 2 ||
                              grade == 4 ||
                              grade == 8)
                          ? Colors.black
                          : Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          for (int i = 0; i < contents.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RecordCard(grade: grade, content: contents[i]),
            )
        ],
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class Calendar extends StatefulWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final int grade;

  const Calendar({
    required this.selectedDay,
    required this.grade,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: widget.focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: (DateTime date) {
        return date.year == widget.selectedDay!.year &&
            date.month == widget.selectedDay!.month &&
            date.day == widget.selectedDay!.day;
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          border: Border.all(
            color: widget.grade == 0
                ? Colors.grey.withOpacity(0.2)
                : PRIMARY_COLOR[widget.grade],
          ),
          color: widget.grade == 0
              ? Colors.grey.withOpacity(0.2)
              : PRIMARY_COLOR[widget.grade].withOpacity(0.2),
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
        selectedTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
