// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoardRepo {
  DashBoardRepo._internal();
  static DashBoardRepo instance = DashBoardRepo._internal();
  factory DashBoardRepo() {
    return instance;
  }

  Future<List<Map<String, dynamic>>> getMostSoldProducts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("items")
        .where("isSold", isEqualTo: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Create a map to store product type counts
      Map<String, int> productTypeCount = {};

      for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        String productType = doc.data()!['productType'];

        // Increment the count for each product type
        productTypeCount[productType] =
            (productTypeCount[productType] ?? 0) + 1;
      }

      // Convert the map to a list of maps
      List<Map<String, dynamic>> mostSoldProducts = productTypeCount.entries
          .map((entry) => {'productType': entry.key, 'count': entry.value})
          .toList();

      return mostSoldProducts;
    } else {
      // Handle the case where there are no sold items
      return [];
    }
  }

  Future<List<String>> getAllDealersNames() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("items").get();

    QuerySnapshot<Map<String, dynamic>> userQurySnapshot =
        await FirebaseFirestore.instance.collection("users").get();

    if (querySnapshot.docs.isNotEmpty) {
      String dealerUid = "";

      for (DocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        final item = doc.data()!;

        if (item.containsKey("dealer")) {
          final uid = item["dealer"];
          dealerUid = uid;
        }
      }

      List<String> userslist = [];

      for (var user in userQurySnapshot.docs) {
        if (user.id == dealerUid) {
          userslist.add(user.data()["name"]);
        }
      }
      return userslist;
    } else {
      return [];
    }
  }

  // function for get product count for week

  Future<List<int>> getProductCountForWeek() async {
    // final listOfDates = await getPreviousWeekDates();
    List<int> productCountList =
        List.filled(7, 0); // Initialize with zeros for each day

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("items")
        .where("isSold", isEqualTo: true)
        .where('purchaseDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
                DateTime.now().subtract(const Duration(days: 7))))
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Timestamp timestamp = doc['purchaseDate'];
        DateTime saleDate = timestamp.toDate();
        int dayOfWeek = saleDate.weekday - 1;

        if (dayOfWeek >= 0 && dayOfWeek < 7) {
          productCountList[dayOfWeek]++;
          print(productCountList);
        }
      }
      return productCountList;
    } else {
      return productCountList = List.filled(7, 0);
    }
  }

  // function for get top dealers names to display


  Future<List<String>> getTopDealers() async {
  QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
      await FirebaseFirestore.instance.collection("items").where("isSold",isEqualTo: true). get();

  QuerySnapshot<Map<String, dynamic>> userQuerySnapshot =
      await FirebaseFirestore.instance.collection("users").get();

  if (itemQuerySnapshot.docs.isNotEmpty) {
    Map<String, int> dealerSalesCount = {};

    for (DocumentSnapshot<Map<String, dynamic>> itemDoc
        in itemQuerySnapshot.docs) {
      final item = itemDoc.data()!;

      if (item.containsKey("dealer")) {
        final dealerUid = item["dealer"];
        dealerSalesCount[dealerUid] =
            (dealerSalesCount[dealerUid] ?? 0) + 1;
      }
    }

    List<MapEntry<String, int>> sortedDealers = dealerSalesCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    List<String> topDealers = [];

    for (var entry in sortedDealers) {
      String dealerUid = entry.key;

      for (var userDoc in userQuerySnapshot.docs) {
        if (userDoc.id == dealerUid) {
          topDealers.add(userDoc.data()["name"]);
          break;
        }
      }
    }

    return topDealers;
  } else {
    return [];
  }
}


// function for get top five dealers with product count

Future<List<Map<String, dynamic>>> getTopDealersWithCount() async {
  QuerySnapshot<Map<String, dynamic>> itemQuerySnapshot =
      await FirebaseFirestore.instance.collection("items").get();

  QuerySnapshot<Map<String, dynamic>> userQuerySnapshot =
      await FirebaseFirestore.instance.collection("users").get();

  if (itemQuerySnapshot.docs.isNotEmpty) {
    Map<String, int> dealerSalesCount = {};

    for (DocumentSnapshot<Map<String, dynamic>> itemDoc
        in itemQuerySnapshot.docs) {
      final item = itemDoc.data()!;

      if (item.containsKey("dealer")) {
        final dealerUid = item["dealer"];
        dealerSalesCount[dealerUid] =
            (dealerSalesCount[dealerUid] ?? 0) + 1;
      }
    }

    List<Map<String, dynamic>> topDealersList = [];

    List<MapEntry<String, int>> sortedDealers = dealerSalesCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    for (var entry in sortedDealers.take(5)) {
      String dealerUid = entry.key;
      int salesCount = entry.value;

      for (var userDoc in userQuerySnapshot.docs) {
        if (userDoc.id == dealerUid) {
          topDealersList.add({
            'name': userDoc.data()["name"],
            'salesCount': salesCount,
          });
          break;
        }
      }
    }

    return topDealersList;
  } else {
    return [];
  }
}









}
