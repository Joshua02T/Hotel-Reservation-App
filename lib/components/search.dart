import 'package:flutter/material.dart';
import 'package:hotel_app/components/hotelcardclass.dart';
import 'package:hotel_app/core/lists.dart';
import 'package:hotel_app/view/roomdetails.dart';

class CustomSearch extends SearchDelegate {
  List? filterCardItems;
  Map? selectedCard;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (selectedCard != null) {
      return ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RoomDetails(data: selectedCard)));
                },
                child: SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.29,
                    child: TravelCard(
                        imgurl: selectedCard!["image"],
                        roomNumber: selectedCard!["roomNumber"],
                        classs: selectedCard!["floor"],
                        rating: selectedCard!["starNumber"])));
          });
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (query.isEmpty) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  selectedCard = searchClass[index];
                  showResults(context);
                },
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Text("${searchClass[index]["roomNumber"]}",
                            style: const TextStyle(fontSize: 15)))));
          },
          itemCount: searchClass.length);
    } else {
      filterCardItems = searchClass
          .where((element) => element["roomNumber"].contains(query))
          .toList();
      return ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                selectedCard = filterCardItems![index];
                showResults(context);
              },
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Text("${filterCardItems![index]["roomNumber"]}",
                          style: const TextStyle(fontSize: 15)))),
            );
          },
          itemCount: filterCardItems!.length);
    }
  }
}
