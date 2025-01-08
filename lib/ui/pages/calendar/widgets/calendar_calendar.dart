import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../_core/utils/utils.dart';

class CalendarCalendar extends StatelessWidget {
  const CalendarCalendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.getEventsForDay,
    required this.onDaySelected,
    required this.onFormatChanged,
    required this.onPageChanged,
  });

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<Event> Function(DateTime p1) getEventsForDay;
  final Function(DateTime p1, DateTime p2) onDaySelected;
  final Function(CalendarFormat p1) onFormatChanged;
  final Function(DateTime p1) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100, // 달력 뒷배경 색깔
      child: TableCalendar<Event>(
        headerVisible: false,
        firstDay: DateTime(DateTime.now().year - 10, 1, 1),
        // 최소 날짜
        lastDay: DateTime(DateTime.now().year + 10, 12, 31),
        // 최대 날짜
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        eventLoader: getEventsForDay,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Colors.blue, // 선택한 날짜 색깔
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.blue.shade200, // 당일 날짜 색깔
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: onDaySelected,
        onFormatChanged: onFormatChanged,
        onPageChanged: onPageChanged,
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isNotEmpty) {
              // 작업이 있을 경우 점 하나 표시
              return Positioned(
                bottom: 1,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }
            // 작업이 없을 경우 아무 것도 표시하지 않음
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
