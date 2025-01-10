import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileCalendar extends StatefulWidget {
  final List<DateTime> highlightedDates;

  ProfileCalendar(this.highlightedDates);

  @override
  _ProfileCalendar createState() => _ProfileCalendar();
}

class _ProfileCalendar extends State<ProfileCalendar> {
  late DateTime _focusedDay; // 현재 포커스된 날짜
  late DateTime _firstDay; // 캘린더 시작 날짜
  late DateTime _lastDay; // 캘린더 종료 날짜

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now(); // 현재 날짜로 초기화
    _firstDay = DateTime(_focusedDay.year, _focusedDay.month, 1); // 해당 월의 첫째 날
    _lastDay =
        DateTime(_focusedDay.year, _focusedDay.month + 1, 0); // 해당 월의 마지막 날
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 캘린더 위젯
        Container(
          height: 400,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100, // 배경색
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: TableCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            locale: 'ko-KR',
            // 한국어 설정
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false, // 이전/다음 달 날짜 숨김
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              todayDecoration: BoxDecoration(), // 오늘 강조 제거
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              // 형식 버튼 숨김
              titleCentered: true,
              // 제목 중앙 정렬
              leftChevronVisible: false,
              // 좌측 화살표 숨김
              rightChevronVisible: false,
              // 우측 화살표 숨김
              headerPadding:
                  EdgeInsets.symmetric(vertical: 10), // 헤더와 캘린더 간격 추가
            ),
            onDaySelected: (selectedDay, focusedDay) {
              // 날짜 선택 시 포커스 날짜 업데이트
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                // 강조할 날짜 여부 확인
                bool isHighlighted = widget.highlightedDates.any(
                    (highlightedDay) =>
                        highlightedDay.year == day.year &&
                        highlightedDay.month == day.month &&
                        highlightedDay.day == day.day);

                // 기본 날짜 스타일
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isHighlighted
                        ? Colors.blue // 강조된 날짜 배경색
                        : Colors.grey.shade300, // 기본 날짜 배경색
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isHighlighted
                          ? Colors.white
                          : Colors.black, // 강조된 날짜 텍스트 색상
                    ),
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                // 오늘 날짜 스타일
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300, // 오늘 날짜 배경색
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: Colors.black, // 오늘 날짜 텍스트 색상
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
                Icon(Icons.access_time, color: Colors.blue, size: 30), // 시간 아이콘
                Text(
                  "88%", // 완료 퍼센트
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
                // 완료 아이콘
                Text(
                  "22", // 완료 개수
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
