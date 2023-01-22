import 'package:flutter/material.dart';
import 'package:flutter_calender/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDay;
  final DateTime focusedDay;
  Calendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDay,
    required this.focusedDay,
  });

  final defaultBoxDeco = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(6),
  );

  final defaultTextStyle = TextStyle(
    color: Colors.grey[600],
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ko_KR",
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: primary_color, width: 1),
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(
            color: primary_color,
          ),
          outsideDecoration: BoxDecoration(shape: BoxShape.rectangle)),
      onDaySelected: onDaySelected,
      selectedDayPredicate: ((DateTime day) {
        if (selectedDay == null) return false;
        return isSelected(day);
      }),
    );
  }

  bool isSelected(DateTime day) {
    return selectedDay.year == day.year &&
        selectedDay.month == day.month &&
        selectedDay.day == day.day;
  }
}
