/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool? isSelected;
  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
    this.isSelected,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: widget.selectionColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if(widget.isSelected == true)
              Text(new DateFormat("E", widget.locale).format(widget.date), // WeekDay
                  style: widget.dayTextStyle),
            Text(widget.date.day.toString(), // Date
                style: widget.dateTextStyle),
            if(widget.isSelected == true)
              Text(new DateFormat("MMM", widget.locale).format(widget.date), // Month
                  style: widget.monthTextStyle),
          ],
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (widget.onDateSelected != null) {
          // Call the onDateSelected Function
          widget.onDateSelected!(this.widget.date);
        }
      },
    );
  }
}
