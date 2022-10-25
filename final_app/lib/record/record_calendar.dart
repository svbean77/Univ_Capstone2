import 'package:final_app/record/const/record_list_exercise.dart';
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
          _RecordList(grade: grade, selectedDay: selectedDay),
        ],
      ),
    );
  }
}

class _RecordList extends StatelessWidget {
  final grade;
  final selectedDay;

  const _RecordList({
    required this.grade,
    required this.selectedDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //선택한 날짜에 해당하는 운동 기록 db에서 가져옴
    final routineName = ['루틴1', '루틴2', '루틴3'];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ListView(
            children: [
              for (int i = 0; i < routineName.length; i++)
                Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PRIMARY_COLOR[grade],
                          ),
                        ),
                        child: Text(routineName[i],
                            style: TextStyle(fontSize: 20.0)),
                      ),
                      onTap: () {
                        final exerciseNumber = [10, 20, 15, 30, 20];
                        final exerciseName = [
                          '운동1',
                          '운동2',
                          '운동3',
                          '운동4',
                          '운동5'
                        ];
                        final isTime = ['t', 't', 'f', 't', 'f'];

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RecordListExercise(
                                    exerciseNumber: exerciseNumber,
                                    exerciseName: exerciseName,
                                    isTime: isTime),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
