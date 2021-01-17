import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2021, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title=' '}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Appointment with Dr.Agarwal at 1',
        'Radiation therapy at 3'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Radiation therapy at 3'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Appointment with Dr.Agarwal at 1',

      ],
      _selectedDay.subtract(Duration(days: 16)): [' Radiation therapy at 3', 'Appointment with Dr.Agarwal at 1'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Radiation therapy at 3',
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Radiation therapy at 3',
        'Appointment with Dr.Agarwal at 1',
        'Surgery at 5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Appointment with Dr.Agarwal at 1', 'Surgery at 5'],
      _selectedDay: ['Radiation therapy at 3 ',  'Appointment with Dr.Agarwal at 1'],
      _selectedDay.add(Duration(days: 1)): [
        'Radiation therapy at 3',
        'Appointment with Dr.Agarwal at 1',

      ],
      _selectedDay.add(Duration(days: 3)):
      Set.from(['Event A9', 'Appointment with Dr.Agarwal at 1', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
      ],
      _selectedDay.add(Duration(days: 1)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Appointment with Dr.Agarwal at 1',
        'Surgery at 5',

      ],
      _selectedDay.add(Duration(days: 22)): ['Surgery at 5', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Surgery at 5',
        'Appointment with Dr.Agarwal at 1',
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }
  void _create(BuildContext context) {
    String _name = "";
    var content = TextField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Appointments',
      ),
      onChanged: (value) {
        _name = value;
      },
    );
    var btn = FlatButton(
      child: Text('Save'),
      onPressed: () => Navigator.of(context).pop(false),
    );
    var cancelButton = FlatButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(false));
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text("Add Event"),
                  Container(padding: EdgeInsets.all(20), child: content),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[btn, cancelButton]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 50.0),
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          _buildButtons(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[100],
        onPressed: () => _create(context),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(6),
    gradient: LinearGradient(colors: [Colors.deepPurple[100], Colors.blue[100]]),
    boxShadow: <BoxShadow>[
    BoxShadow(
    color: Colors.black12,
    blurRadius: 5,
    offset: new Offset(0.0, 5)
    )
    ]
    ),
      child: TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.pink[200],
        todayColor: Colors.pink[300],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
        TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    ),);
  }


  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[300],
            gradient: LinearGradient(colors: [Colors.purple[100], Colors.blue[300]]),
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
        child: ListTile(
          title: Text('$event'),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }
}