import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/gradient.dart';
import 'package:hotel_app/view/myroom.dart';

class BottomSheetContainer extends StatefulWidget {
  final dynamic data;
  const BottomSheetContainer({super.key, required this.data});

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  double _currentSliderValue = 1;
  DateTime? picked1;
  DateTime? picked2;
  int? difference;
  int? cost;
  Future selectFirstDate() async {
    picked1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked1 != null) {
      setState(() {
        _dateContoller1.text = picked1.toString().split(' ')[0];
      });
    }
  }

  Future selectLastDate() async {
    picked2 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked2 != null) {
      setState(() {
        _dateContoller2.text = picked2.toString().split(' ')[0];
      });
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController _dateContoller1 = TextEditingController();
  final TextEditingController _dateContoller2 = TextEditingController();
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController idContoller = TextEditingController();
  final TextEditingController phoneContoller = TextEditingController();

  CollectionReference reservations =
      FirebaseFirestore.instance.collection('reservations');

  Future<void> addDataToFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference userReservations = FirebaseFirestore.instance
        .collection('reservations')
        .doc(user!.uid) // User-specific document ID
        .collection('userReservations');
    await userReservations.add({
      'name': nameContoller.text,
      'id': idContoller.text,
      'phone number': phoneContoller.text,
      'firstday': _dateContoller1.text,
      'lastday': _dateContoller2.text,
      'numberofpeople': _currentSliderValue.ceil(),
      'bookeddays': difference,
      'discount': widget.data['discount'],
      'taxes': widget.data['taxes'],
      'servicefee': widget.data['serviceFee'],
      'roomnumber': widget.data['roomNumber'],
      'cost': cost
    });
  }

  @override
  Widget build(BuildContext context) {
    if (picked1 != null && picked2 != null) {
      difference = (daysBetween(picked1!, picked2!)) + 1;
      cost = widget.data['cost'] * difference!;
    }
    return Form(
      key: formkey,
      child: Container(
          decoration: customBoxDecoration(),
          width: double.infinity,
          height: 700,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('please fill out the following fields:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.cancel_rounded,
                                  color: mypurple, size: 20))
                        ]),
                    const SizedBox(height: 20),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            border: Border.all(width: 2, color: myorange)),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'how many people will stay in room?',
                                      style: TextStyle(fontSize: 18)),
                                  Slider(
                                      value: _currentSliderValue,
                                      max: 5,
                                      min: 1,
                                      activeColor: mypurple,
                                      thumbColor: myorange,
                                      onChanged: (value) {
                                        setState(() {
                                          _currentSliderValue = value;
                                        });
                                      }),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('${_currentSliderValue.ceil()} ',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: mypurple,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          _currentSliderValue.ceil() == 1
                                              ? 'person'
                                              : 'people',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])
                                ]))),
                    const SizedBox(height: 20),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            border: Border.all(width: 2, color: myorange)),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('pick first night date booking:',
                                      style: TextStyle(fontSize: 18)),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please pick date';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: mypurple,
                                          fontWeight: FontWeight.bold),
                                      controller: _dateContoller1,
                                      decoration: const InputDecoration(
                                          hintText: 'DATE',
                                          filled: true,
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                          prefixIconColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                      readOnly: true,
                                      onTap: () {
                                        selectFirstDate();
                                      })
                                ]))),
                    const SizedBox(height: 20),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            border: Border.all(width: 2, color: myorange)),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('pick last night date booking:',
                                      style: TextStyle(fontSize: 18)),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please pick date';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: mypurple,
                                          fontWeight: FontWeight.bold),
                                      controller: _dateContoller2,
                                      decoration: const InputDecoration(
                                          hintText: 'DATE',
                                          filled: true,
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                          prefixIconColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)),
                                      readOnly: true,
                                      onTap: () {
                                        selectLastDate();
                                      }),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'you will stay ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        difference != null
                                            ? Text(
                                                '$difference ',
                                                style: const TextStyle(
                                                    color: mypurple,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )
                                            : const Text('? '),
                                        difference == 1
                                            ? const Text(
                                                'night ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text(
                                                'nights ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'it will cost you \$',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        cost != null
                                            ? Text(
                                                '$cost',
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: mypurple,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : const Text('')
                                      ])
                                ]))),
                    const SizedBox(height: 20),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            border: Border.all(width: 2, color: myorange)),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('please provide booker info:',
                                      style: TextStyle(fontSize: 18)),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 3) {
                                          return 'Name must be at least 3 characters';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: mypurple,
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.name,
                                      controller: nameContoller,
                                      decoration: const InputDecoration(
                                          hintText: 'NAME',
                                          filled: true,
                                          prefixIcon: Icon(Icons.person),
                                          prefixIconColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none))),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length != 11) {
                                          return 'Invalid ID';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: mypurple,
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.number,
                                      controller: idContoller,
                                      decoration: const InputDecoration(
                                          hintText: 'ID',
                                          filled: true,
                                          prefixIcon: Icon(Icons.numbers),
                                          prefixIconColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none))),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length != 10) {
                                          return 'Invalid phone number';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: mypurple,
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.phone,
                                      controller: phoneContoller,
                                      decoration: const InputDecoration(
                                          hintText: 'PHONE NUMBER',
                                          filled: true,
                                          prefixIcon: Icon(Icons.phone),
                                          prefixIconColor: Colors.black,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none)))
                                ]))),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                        color: mypurple, width: 2)),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    addDataToFirestore();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyRoom()));
                                  }
                                },
                                minWidth: 300,
                                height: 50,
                                textColor: Colors.white,
                                color: myorange,
                                child: const Text('Save Booking',
                                    style: TextStyle(fontSize: 22)))))
                  ])))),
    );
  }
}
