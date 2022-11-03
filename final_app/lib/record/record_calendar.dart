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
  int grade = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Calendar(
          selectedDay: selectedDay,
          grade: grade,
          focusedDay: focusedDay,
          onDaySelected: onDaySelected,
        ),
        SizedBox(height: 8.0),
        _RecordExercise(selectedDay: selectedDay, grade: grade),
      ],
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}

class _Calendar extends StatefulWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final int grade;

  const _Calendar({
    required this.selectedDay,
    required this.grade,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key,
  }) : super(key: key);

  @override
  State<_Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<_Calendar> {
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
            color: PRIMARY_COLOR[widget.grade],
          ),
          color: PRIMARY_COLOR[widget.grade].withOpacity(0.2),
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

class _RecordExercise extends StatelessWidget {
  final DateTime selectedDay;
  final int grade;

  const _RecordExercise({
    required this.selectedDay,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content = '길\n게\n말\n하\n기\n내\n용\n엄\n청\n많\n음';

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return RecordBottomSheet(
                    selectedDay: selectedDay, grade: grade, content: content);
              },
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
            child: ListView(
              children: [
                Text(
                    '${selectedDay.year}.${selectedDay.month}.${selectedDay.day} 운동 기록\n',
                    style:
                        TextStyle(color: PRIMARY_COLOR[grade], fontSize: 20.0)),
                content.length != 0 ? Text(content) : Text('운동기록이 없습니다'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecordBottomSheet extends StatefulWidget {
  final DateTime selectedDay;
  final int grade;
  String content;
  RecordBottomSheet({
    required this.selectedDay,
    required this.content,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordBottomSheet> createState() => _RecordBottomSheetState();
}

class _RecordBottomSheetState extends State<RecordBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  //String? content; //직접 db에서 가져오기 or 끌어오기?

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('운동 기록하기', style: TextStyle(fontSize: 20.0)),
            Form(
              key: formKey,
              child: RecordContent(
                initialValue: widget.content ?? '',
                onSaved: (String? val) {
                  widget.content = val!;
                },
              ),
            ),
            RecordSaveButton(onPressed: onSavePressed, grade: widget.grade)
          ],
        ),
      ),
    );
  }

  void onSavePressed() {
    //async로 바꾸기
    //if (formKey.currentState == null) return;
    //if (formKey.currentState!.validate()) formKey.currentState!.save();
    //db에 저장하는 코드
    Navigator.of(context).pop();
  }
}

class RecordSaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final grade;

  const RecordSaveButton({
    required this.onPressed,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: PRIMARY_COLOR[grade],
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}

class RecordContent extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final String initialValue;

  const RecordContent({
    required this.initialValue,
    required this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextFormField(
          onSaved: onSaved,
          initialValue: initialValue,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
          ),
          maxLines: null,
        ),
      ),
    );
  }
}
