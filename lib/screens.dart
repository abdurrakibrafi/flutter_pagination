import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_pagination/model.dart';

class PaymentStatementScreens extends StatefulWidget {
  PaymentStatementScreens({Key? key}) : super(key: key);

  @override
  _PaymentStatementScreensState createState() =>
      _PaymentStatementScreensState();
}

class _PaymentStatementScreensState extends State<PaymentStatementScreens> {
  AllOrderParcelsModel? paymentStatementData; // Declare as nullable
  int currentPage = 1;
  bool isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getAllParcelsDetails(currentPage);
  }

  //api method
  Future<void> getAllParcelsDetails(int page) async {
    final url = "https://teestacourier.com/api/merchant/parcels?page=$page";
    final bodyData = {
      "api_token": "2wZHSJW7C0hqnkbvMQrbCKJLK8T55YD9KOEzC1Fy266ZyfEKWz",
    };
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(bodyData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print("================ All Parcels Data data:$responseData");
      final data = AllOrderParcelsModel.fromJson(responseData);
      setState(() {
        if (paymentStatementData != null) {
          paymentStatementData!.data!.allparcel!.data
              .addAll(data.data!.allparcel!.data);
          currentPage = data.data!.allparcel!.currentPage ?? 1;
          isLoading = false;
        } else {
          paymentStatementData = data;
        }
      });
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  //for catch the scrolling
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        currentPage++;
        getAllParcelsDetails(currentPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Payment Statement'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount:
                    (paymentStatementData?.data?.allparcel?.data.length ?? 0) +
                        1,
                itemBuilder: (BuildContext context, int index) {
                  if (index ==
                      (paymentStatementData?.data?.allparcel?.data.length ??
                          0)) {
                    if (isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container();
                    }
                  } else {
                    final payment =
                        paymentStatementData!.data!.allparcel!.data[index];
                    return Container(
                      margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      height: 90,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF696969).withOpacity(0.1),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.1],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.calendar_month_rounded,
                            size: 40,
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 26,
                            ),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Text(
                                "Date & Time:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Invoice No: ${payment.title}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF223975),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// for button loading more data
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_pagination/model.dart';
//
// class PaymentStatementScreens extends StatefulWidget {
//   PaymentStatementScreens({Key? key}) : super(key: key);
//
//   @override
//   _PaymentStatementScreensState createState() =>
//       _PaymentStatementScreensState();
// }
//
// class _PaymentStatementScreensState extends State<PaymentStatementScreens> {
//   late AllOrderParcelsModel paymentStatementData;
//   int currentPage = 1;
//   int lastPage = 1;
//
//   Future<AllOrderParcelsModel> getAllParcelsDetails(int page) async {
//     final url = "https://teestacourier.com/api/merchant/parcels?page=$page";
//     final bodyData = {
//       "api_token": "2wZHSJW7C0hqnkbvMQrbCKJLK8T55YD9KOEzC1Fy266ZyfEKWz",
//     };
//     final response = await http.post(
//       Uri.parse(url),
//       body: jsonEncode(bodyData),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       print("================ All Parcels Data data:$responseData");
//       return AllOrderParcelsModel.fromJson(responseData);
//     } else {
//       throw Exception('Failed to load profile data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: AppBar(
//         title: Text('Payment Statement'),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: FutureBuilder<AllOrderParcelsModel>(
//                 future: getAllParcelsDetails(currentPage),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else {
//                     paymentStatementData = snapshot.data!;
//                     currentPage =
//                         paymentStatementData.data!.allparcel!.currentPage ?? 1;
//                     lastPage =
//                         paymentStatementData.data!.allparcel!.lastPage ?? 1;
//                     return paymentStatementData.data!.allparcel!.data.isEmpty
//                         ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.error_outline,
//                             size: 50,
//                             color: Colors.red,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Sorry! No Payment Statement Available yet',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                         : ListView.builder(
//                       itemCount: paymentStatementData
//                           .data!.allparcel!.data.length +
//                           1,
//                       itemBuilder: (BuildContext context, int index) {
//                         if (index ==
//                             paymentStatementData
//                                 .data!.allparcel!.data.length) {
//                           if (currentPage < lastPage) {
//                             return GestureDetector(
//                               onTap: () {
//                                 currentPage++;
//                                 getAllParcelsDetails(currentPage)
//                                     .then((newData) {
//                                   setState(() {
//                                     paymentStatementData
//                                         .data!.allparcel!.data
//                                         .addAll(newData
//                                         .data!.allparcel!.data);
//                                   });
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.all(8),
//                                 height: 40,
//                                 alignment: Alignment.center,
//                                 color: Colors.blue,
//                                 child: Text('Load More'),
//                               ),
//                             );
//                           }
//                         } else {
//                           final payment = paymentStatementData
//                               .data!.allparcel!.data[index];
//                           return Container(
//                             margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
//                             height: 90,
//                             decoration: ShapeDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color(0xFF696969).withOpacity(0.1),
//                                   Colors.white,
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 stops: [0.0, 0.1],
//                                 tileMode: TileMode.clamp,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(12.0),
//                                 ),
//                               ),
//                             ),
//                             child: Card(
//                               child: ListTile(
//                                 leading: const Icon(
//                                   Icons.calendar_month_rounded,
//                                   size: 40,
//                                 ),
//                                 trailing: Padding(
//                                   padding:
//                                   const EdgeInsets.only(top: 8.0),
//                                   child: Icon(
//                                     Icons.arrow_forward_ios_outlined,
//                                     size: 26,
//                                   ),
//                                 ),
//                                 title: Column(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.start,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     SizedBox(height: 12),
//                                     Text(
//                                       "Date & Time:",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "Invoice No: ${payment.title}",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         color: Color(0xFF223975),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
