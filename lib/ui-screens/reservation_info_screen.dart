import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:short_stay/models/BookingDetail.dart';
import 'package:short_stay/models/HotelDetails.dart';
import 'package:short_stay/models/RoomDetails.dart';
import 'package:short_stay/ui-screens/bookig_details.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:date_time_picker/date_time_picker.dart';

class ReservationInfo extends StatefulWidget {
  final RoomsDetails room;
  final HotelDetails hotel;

  const ReservationInfo({Key key, @required this.room, @required this.hotel})
      : super(key: key);

  @override
  _ReservationInfoState createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay time;
  TimeOfDay picked;
  bool asStatus = false;


  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  bool displayDate = true;
  bool displayAll = false;

  showData() {
    print("in func");
    print(displayDate);
    if (displayDate) {
      return Column(children: [
        DateTimePicker(
          initialValue: '',
          // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
          type: DateTimePickerType.date,
          dateLabelText: 'Check In Date',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Color(0xff1f1b51)),
          firstDate: DateTime(2001),
          lastDate: DateTime.now().add(Duration(days: 365)),
          // This will add one year from current date
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Enter check In Date';
            }
            return null;
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _checkInController.text = value;
              });
            }
          },
          // We can also use onSaved
          onSaved: (value) {
            if (value.isNotEmpty) {
              _checkInController.text = value;
            }
          },
        ),
        SizedBox(height: 10),
        DateTimePicker(
          initialValue: '',
          // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
          type: DateTimePickerType.date,
          cursorColor: Color(0xff1f1b51),
          dateLabelText: 'Check Out Date',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Color(0xff1f1b51)),
          firstDate: DateTime(2001),
          lastDate: DateTime.now().add(Duration(days: 365)),
          // This will add one year from current date
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Enter check Out Date';
            }
            return null;
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _checkOutController.text = value;
              });
            }
          },
          // We can also use onSaved
          onSaved: (value) {
            if (value.isNotEmpty) {
              _checkOutController.text = value;
            }
          },
        )
      ]);
    }
    else if (displayAll) {
      return Column(
          children: [
            DateTimePicker(
              initialValue: '',
              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
              type: DateTimePickerType.date,
              dateLabelText: 'Check In Date',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1f1b51)),
              firstDate: DateTime(2001),
              lastDate: DateTime.now().add(Duration(days: 365)),
              // This will add one year from current date
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter check In Date';
                }
                return null;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _checkInController.text = value;
                  });
                }
              },
              // We can also use onSaved
              onSaved: (value) {
                if (value.isNotEmpty) {
                  _checkInController.text = value;
                }
              },
            ),
            SizedBox(height: 10),
            DateTimePicker(
              initialValue: '',
              // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
              type: DateTimePickerType.date,
              cursorColor: Color(0xff1f1b51),
              dateLabelText: 'Check Out Date',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1f1b51)),
              firstDate: DateTime(2001),
              lastDate: DateTime.now().add(Duration(days: 365)),
              // This will add one year from current date
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter check Out Date';
                }
                return null;
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _checkOutController.text = value;
                  });
                }
              },
              // We can also use onSaved
              onSaved: (value) {
                if (value.isNotEmpty) {
                  _checkOutController.text = value;
                }
              },
            ),
            TextField(
              onTap: () {
                _selectCheckInTime(context);
              },
              readOnly: true,
              controller: _checkInTimeController,
              decoration: InputDecoration(
                  labelText: 'TIME CHECK-IN',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f1b51)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1f1b51)))),
            ),
            // Text("${selectedTime.hour}:${selectedTime.minute}")
            SizedBox(height: 10),
            TextField(
              onTap: () {
                _selectCheckOutTime(context);
              },
              readOnly: true,
              controller: _checkOutTimeController,
              decoration: InputDecoration(
                  labelText: 'TIME CHECK-OUT',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f1b51)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1f1b51)))),
            )
          ]);
    } else {
      return Text("");
    }
  }



  clickDisplay(String flag) {
    setState(() {
      if (flag == "date") {
        displayDate = true;
        displayAll = false;
      } else {
        displayDate = false;
        displayAll = true;
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _checkInTimeController = TextEditingController();
  final _checkOutTimeController = TextEditingController();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  String mobile, email, name;
  int userId, roomId;

  @override
  void initState() {
    fillFormData();
    super.initState();
    time = TimeOfDay.now();
  }

  Future<void> _selectCheckInTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime) {
      setState(() {
        _checkInTimeController.text =
            picked_s.hour.toString() + ":" + picked_s.minute.toString();
      });
    }else{
      setState(() {
        _checkInTimeController.text =
            selectedTime.hour.toString() + ":" + selectedTime.minute.toString();
      });
    }
  }

  Future<void> _selectCheckOutTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime) {
      setState(() {
        _checkOutTimeController.text =
            picked_s.hour.toString() + ":" + picked_s.minute.toString();
      });
    } else {
      setState(() {
        _checkOutTimeController.text =
            selectedTime.hour.toString() + ":" + selectedTime.minute.toString();
      });
    }
  }

  void fillFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("unique_code"));
    mobile = prefs.getString('mobile');
    email = prefs.getString('email');
    name = prefs.getString('full_name');
    userId = prefs.getInt('userId');
    roomId = prefs.getInt('roomId');
    _emailController.text = email;
    _mobileController.text = mobile;
    _nameController.text = name;
  }

  void confirDetails() {
    final form = _formKey.currentState;
    form.save();
    var booking = BookingDetail.fromJson(
        {
      "id": null,
      "checkIn": _checkInController.text,
      "checkOut": _checkOutController.text,
      "mobile": _mobileController.text,
      "email": _emailController.text,
      "userId": userId,
      "roomId": roomId,
      "checkInTime": _checkInTimeController.text,
      "checkOutTime": _checkOutTimeController.text
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BookingDetails(
                    booking: booking, room: widget.room, hotel: widget.hotel,ac_status:asStatus)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                    child: Text(
                      'Enter You Details',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(320.0, 40.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                FlutterSwitch(
                                  width: 85.0,
                                  height: 35.0,
                                  valueFontSize: 15.0,
                                  toggleSize: 30.0,
                                  borderRadius: 30.0,
                                  padding: 8.0,
                                  showOnOff: true,
                                  activeColor: Color(0xff1f1b51),
                                  value: asStatus,
                                  onToggle: (value) {
                                    setState(() {
                                      asStatus = value;
                                    });
                                  },
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('A/C', style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0
                                  ),),
                                ),


                              ],
                            ),

                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff1f1b51),
                                    ),
                                    onPressed: () {
                                      clickDisplay('date');
                                    },
                                    child: Text('Date')),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff1f1b51),
                                    ),
                                    onPressed: () {
                                      clickDisplay('time');
                                    },
                                    child: Text('Time '))
                              ],
                            ),
                            SizedBox(height: 10.0),
                            showData(),
                            SizedBox(height: 50),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff1f1b51),
                                ),
                                onPressed: () {
                                  if ((_formKey.currentState.validate())) {
                                    confirDetails();
                                  }
                                },
                                child: Text('Confirm Details'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
