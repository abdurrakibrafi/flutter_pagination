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
