import 'package:flutter/material.dart';
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
  TimeOfDay time;
  TimeOfDay picked;

  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: time);
    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  final _timeController = TextEditingController();

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

    var booking = BookingDetail.fromJson({
      "id": null,
      "checkIn": _checkInController.text,
      "checkOut": _checkOutController.text,
      "mobile": _mobileController.text,
      "email": _emailController.text,
      "userId": userId,
      "roomId": roomId
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookingDetails(
                booking: booking, room: widget.room, hotel: widget.hotel)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Enter You Details',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(315.0, 90.0, 0.0, 0.0),
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
                    Container(
                        padding:
                            EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1f1b51)),
                                    // hintText: 'EMAIL',
                                    // hintStyle: ,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1f1b51)))),
                              ),
                              SizedBox(height: 10.0),
                              InternationalPhoneNumberInput(
                                textStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1f1b51)),
                                onInputChanged: (PhoneNumber number) {},
                                onInputValidated: (bool value) {},
                                selectorConfig: SelectorConfig(
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.always,
                                selectorTextStyle:
                                    TextStyle(color: Color(0xff1f1b51)),
                                initialValue: number,
                                textFieldController: _mobileController,
                                formatInput: false,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                // inputBorder: OutlineInputBorder(),
                                onSaved: (PhoneNumber number) {
                                  print('On Saved: $number');
                                },
                              ),
                              SizedBox(height: 10.0),
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
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                                // This will add one year from current date
                                validator: (value) {
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
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                                // This will add one year from current date
                                validator: (value) {
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
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => selectTime(context),
                                child: AbsorbPointer(
                                  child: TextField(
                                    controller: _timeController,
                                    decoration: InputDecoration(
                                        icon: IconButton(
                                          icon:
                                              Icon(Icons.access_time_outlined),
                                          color: Color(0xff1f1b51),
                                        ),
                                        labelText: 'CHECK IN TIME ',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff1f1b51)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff1f1b51)))),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    labelText: 'FULL NAME ',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1f1b51)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1f1b51)))),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'TOTAL PERSON ',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1f1b51)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1f1b51)))),
                              ),
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    labelText: 'SPECIAL REQUEST ',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1f1b51)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff1f1b51)))),
                              ),
                              SizedBox(height: 50.0),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                    height: 40.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Colors.blueAccent,
                                      color: Color(0xff1f1b51),
                                      elevation: 7.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          confirDetails();
                                        },
                                        child: Center(
                                          child: Text(
                                            'Confirm Details',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )),
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
