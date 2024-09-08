import 'package:flutter/material.dart';
import 'package:hackaton_terricon/widgets/button_border.dart';
import 'package:table_calendar/table_calendar.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TableCalendar(
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.white),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.chevron_left,color: Colors.white,),
                rightChevronIcon: Icon(Icons.chevron_right,color: Colors.white,)
              ),
              calendarStyle: CalendarStyle(
                rangeHighlightColor: Colors.white,
                defaultTextStyle: TextStyle(
                  color: Colors.white
                ),
                disabledTextStyle: TextStyle(
                  color: Colors.white
                ),
              ),
                focusedDay: DateTime(2024,10,15),
                firstDay: DateTime(2020,3,14),
                lastDay: DateTime(2025,3,14),
            ),
            const SizedBox(height: 10,),
            ButtonBorderWidget(text: 'Подать заявку', onTap:(){})
          ],
        ),
      ),
    );
  }
}
