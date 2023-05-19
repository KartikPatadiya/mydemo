import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Mytablecelendar extends StatefulWidget {
  const Mytablecelendar({super.key});

  @override
  State<Mytablecelendar> createState() => _MytablecelendarState();
}

class _MytablecelendarState extends State<Mytablecelendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Table Celendar"),
        ),
        body: content());
  }

  Widget content() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2001, 09, 12),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text("Selected Day = ${today.toString().split(" ")[0]}"),
      ],
    );
  }
}
