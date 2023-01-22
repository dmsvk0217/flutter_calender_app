import 'package:flutter/material.dart';
import 'package:flutter_calender/const/color.dart';

class ScheduleCard extends StatefulWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;
  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primary_color, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Time(startTime: widget.startTime, endTime: widget.endTime),
              SizedBox(
                width: 16,
              ),
              _Content(content: widget.content),
              _Category(color: widget.color),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          content,
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    Key? key,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final int startTime;
  final int endTime;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      color: primary_color,
      fontWeight: FontWeight.w700,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${startTime.toString().padLeft(2, '0')}:00",
          style: textStyle,
        ),
        Text("${endTime.toString().padLeft(2, '0')}:00",
            style: textStyle.copyWith(fontSize: 10)),
      ],
    );
  }
}

class _Category extends StatelessWidget {
  final Color color;
  const _Category({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
