import 'package:flutter/material.dart';
import 'package:hotel_app/components/drawerlisttile.dart';
import 'package:hotel_app/components/hotelcard.dart';
import 'package:hotel_app/components/search.dart';
import 'package:hotel_app/core/consts.dart';
import 'package:hotel_app/core/lists.dart';
import 'package:hotel_app/core/navbaritems.dart';
import 'package:hotel_app/view/roomdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [orangeGradient, Colors.white])),
                padding: const EdgeInsets.all(10),
                child: ListView(children: [
                  Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset('images/hhotel.jpg',
                            width: 100, height: 100, fit: BoxFit.cover)),
                    const Expanded(
                        child: ListTile(
                            title: Text('Hotel Name',
                                style: TextStyle(fontSize: 22)),
                            subtitle: Text('0944876334')))
                  ]),
                  const SizedBox(height: 15),
                  const DrawerListTile(
                      icon: Icons.person_outline_outlined,
                      text: 'Account',
                      wheretogo: 'account'),
                  const DrawerListTile(
                      icon: Icons.comments_disabled,
                      text: 'Our Terms',
                      wheretogo: 'ourterms'),
                  const DrawerListTile(
                      icon: Icons.info_outline_rounded,
                      text: 'About',
                      wheretogo: 'aboutus'),
                  const DrawerListTile(
                      icon: Icons.logout_outlined,
                      text: 'Log out',
                      wheretogo: 'login'),
                  const DrawerListTile(
                      icon: Icons.arrow_back_ios,
                      text: 'back',
                      wheretogo: 'homepage')
                ]))),
        backgroundColor: bgcolor,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: bgcolor,
            title: const Text('HotelName',
                style: TextStyle(
                    fontSize: 30,
                    color: myorange,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3)),
            centerTitle: true),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Welcome To The Hotel',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600)),
                const Text('pick your room',
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.w300)),
                const SizedBox(height: 20.0),
                Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: const Color(0x55434343),
                    child: InkWell(
                      onTap: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.search,
                                size: 30,
                                color: myorange,
                              ),
                            ),
                            Text(
                              'Search for a room by number..',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    )),
                const SizedBox(height: 30.0),
                DefaultTabController(
                    length: 2,
                    child: Column(children: [
                      const TabBar(
                          indicatorColor: myorange,
                          unselectedLabelColor: Color(0xFF555555),
                          labelColor: myorange,
                          labelPadding: EdgeInsets.symmetric(vertical: 4.0),
                          tabs: [
                            Tab(text: 'High Class'),
                            Tab(text: 'Standard Class')
                          ]),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          height: 300,
                          child: TabBarView(children: [
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => RoomDetails(
                                                  data: highClass[index])));
                                    },
                                    child: travelCard(
                                        highClass[index]['image'],
                                        highClass[index]['roomNumber'],
                                        highClass[index]['starNumber'],
                                        highClass[index]['floor']));
                              },
                              itemCount: highClass.length,
                            ),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => RoomDetails(
                                                  data: standardClass[index])));
                                    },
                                    child: travelCard(
                                        standardClass[index]['image'],
                                        standardClass[index]['roomNumber'],
                                        standardClass[index]['starNumber'],
                                        standardClass[index]['floor']));
                              },
                              itemCount: standardClass.length,
                            )
                          ]))
                    ])),
                const SizedBox(height: 40),
                const Row(children: [
                  Text('16 ', style: TextStyle(fontSize: 35, color: myorange)),
                  Text('Available Rooms ',
                      style: TextStyle(fontSize: 35, color: Colors.black))
                ])
              ])
            ])),
        bottomNavigationBar: const NavBar(
            index: 0, v1: 2, v2: 1, name1: 'account', name2: 'myroom'));
  }
}
