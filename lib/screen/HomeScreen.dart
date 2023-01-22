import 'package:flutter/material.dart';
import 'package:flutter_calender/component/calendar.dart';
import 'package:flutter_calender/component/schedule_card.dart';
import 'package:flutter_calender/component/schedule_modal_bottom_sheet.dart';
import 'package:flutter_calender/component/tody_banner.dart';
import 'package:flutter_calender/const/color.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: renderFloatingActionButton(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              onDaySelected: onDaySelected,
              selectedDay: selectedDay,
              focusedDay: focusedDay,
            ),
            SizedBox(
              height: 8,
            ),
            TodayBanner(
              scheduleCount: 2,
              selectedDay: selectedDay,
            ),
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: ((_) {
            print("showModalBottomSheet builder!!!!!");
            return ModalBottomSheet();
          }),
        );
      },
      backgroundColor: primary_color,
      child: Icon(Icons.add),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: 8,
          separatorBuilder: (context, index) {
            return SizedBox(height: 8);
          },
          itemBuilder: (context, index) {
            return ScheduleCard(
              startTime: 2,
              endTime: 4,
              content: "프로그래밍",
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
