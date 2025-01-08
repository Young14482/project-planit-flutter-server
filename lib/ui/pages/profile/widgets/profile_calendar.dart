import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileCalendar extends StatefulWidget {
  @override
  _ProfileCalendar createState() => _ProfileCalendar();
}

class _ProfileCalendar extends State<ProfileCalendar> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  // 강조할 날짜 리스트
  final List<DateTime> highlightedDates = [
    DateTime(2025, 1, 5),
    DateTime(2025, 1, 10),
    DateTime(2025, 1, 15),
  ];

  @override
  void initState() {
    super.initState();

    _focusedDay = DateTime.now();
    _firstDay = DateTime(_focusedDay.year, _focusedDay.month, 1);
    _lastDay = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 캘린더
        Container(
          height: 400, // 캘린더 높이
          padding: EdgeInsets.all(16.0), // 내부 여백
          decoration: BoxDecoration(
            color: Colors.grey.shade100, // 배경
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TableCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            locale: 'ko-KR',
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false, // 전, 다음날 날짜 숨김
              selectedDecoration: BoxDecoration(
                color: Colors.blue, // 선택된 날짜
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              todayDecoration: BoxDecoration(), // 오늘 강조 제거
              // 날짜 간격을 띄우기 위해 날짜 영역의 padding 설정
              rowDecoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              // 해당 주 숨김
              titleCentered: true,
              // 제목 중앙 정렬
              leftChevronVisible: false,
              // 화살표 숨김
              rightChevronVisible: false,
              headerPadding:
                  EdgeInsets.symmetric(vertical: 10), // 요일과 날짜 사이에 간격 추가
            ),
            onDaySelected: (selectedDay, focusedDay) {
              // 날짜 선택 시 focusedDay 업데이트
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                // 강조할 날짜 체크
                bool isHighlighted = highlightedDates.any(
                  (highlightedDay) =>
                      highlightedDay.year == day.year &&
                      highlightedDay.month == day.month &&
                      highlightedDay.day == day.day,
                );
                // 강조된 날짜 네모 박스
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4), // 날짜 사이에 여백 추가
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? Colors.blue // 강조된 날짜 파란색
                        : Colors.grey.shade300, // 기본 회색
                    borderRadius: BorderRadius.circular(12.0), // 살짝 둥근 모서리
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isHighlighted
                          ? Colors.white
                          : Colors.black, // 강조된 날짜는 흰색
                    ),
                  ),
                );
              },
              // 오늘 날짜 - 기본 텍스트 스타일 적용
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4), // 날짜 사이에 여백 추가
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300, // 오늘 날짜는 회색 배경
                    borderRadius: BorderRadius.circular(12.0), // 살짝 둥근 모서리
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16),
        // 완료 퍼센트 및 완료 개수 표시
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, color: Colors.blue, size: 30),
                Text(
                  "88%",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.blue, size: 30),
                Text(
                  "22",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
