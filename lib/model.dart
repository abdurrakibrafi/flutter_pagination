class AllOrderParcelsModel {
  AllOrderParcelsModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory AllOrderParcelsModel.fromJson(Map<String, dynamic> json) {
    return AllOrderParcelsModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.allparcel,
    required this.parceltypes,
  });

  final Allparcel? allparcel;
  final List<Parceltype> parceltypes;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      allparcel: json["allparcel"] == null
          ? null
          : Allparcel.fromJson(json["allparcel"]),
      parceltypes: json["parceltypes"] == null
          ? []
          : List<Parceltype>.from(
              json["parceltypes"]!.map((x) => Parceltype.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "allparcel": allparcel?.toJson(),
        "parceltypes": parceltypes.map((x) => x.toJson()).toList(),
      };
}

class Allparcel {
  Allparcel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final List<Datum> data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  factory Allparcel.fromJson(Map<String, dynamic> json) {
    return Allparcel(
      currentPage: json["current_page"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      firstPageUrl: json["first_page_url"],
      from: json["from"],
      lastPage: json["last_page"],
      lastPageUrl: json["last_page_url"],
      nextPageUrl: json["next_page_url"],
      path: json["path"],
      perPage: json["per_page"],
      prevPageUrl: json["prev_page_url"],
      to: json["to"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data.map((x) => x.toJson()).toList(),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.invoiceNo,
    required this.merchantId,
    required this.paymentInvoice,
    required this.cod,
    required this.merchantAmount,
    required this.merchantDue,
    required this.deliverymanAmount,
    required this.deliverymanPaid,
    required this.deliverymanDue,
    required this.pickupmanAmount,
    required this.pickupmanPaid,
    required this.pickupmanDue,
    required this.merchantpayStatus,
    required this.merchantPaid,
    required this.recipientName,
    required this.recipientAddress,
    required this.recipientPhone,
    required this.note,
    required this.deliveryCharge,
    required this.promotiuonalDiscount,
    required this.codCharge,
    required this.productPrice,
    required this.divisionId,
    required this.districtId,
    required this.thanaId,
    required this.areaId,
    required this.deliveryAddress,
    required this.deliverymanId,
    required this.pickupmanId,
    required this.agentId,
    required this.productWeight,
    required this.trackingCode,
    required this.percelType,
    required this.helpNumber,
    required this.reciveZone,
    required this.pickupThanaId,
    required this.pickLocation,
    required this.orderType,
    required this.codType,
    required this.status,
    required this.statusDescription,
    required this.merchantpayDate,
    required this.deliverymanPayDate,
    required this.pickupmanPayDate,
    required this.pickupDate,
    required this.deliveryDate,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.division,
    required this.district,
    required this.thana,
    required this.area,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.companyName,
    required this.mstatus,
    required this.mid,
  });

  final dynamic id;
  final String? invoiceNo;
  final dynamic merchantId;
  final dynamic paymentInvoice;
  final dynamic cod;
  final dynamic merchantAmount;
  final dynamic merchantDue;
  final dynamic deliverymanAmount;
  final dynamic deliverymanPaid;
  final dynamic deliverymanDue;

  final dynamic pickupmanAmount;
  final dynamic pickupmanPaid;
  final dynamic pickupmanDue;

  final String? merchantpayStatus;
  final dynamic merchantPaid;
  final String? recipientName;
  final String? recipientAddress;
  final String? recipientPhone;
  final dynamic note;
  final dynamic deliveryCharge;
  final dynamic promotiuonalDiscount;
  final dynamic codCharge;
  final dynamic productPrice;

  final dynamic divisionId;
  final dynamic districtId;
  final dynamic thanaId;
  final dynamic areaId;

  final String? deliveryAddress;
  final dynamic deliverymanId;
  final dynamic pickupmanId;
  final dynamic agentId;

  final dynamic productWeight;

  final String? trackingCode;
  final dynamic percelType;
  final dynamic helpNumber;
  final dynamic reciveZone;
  final dynamic pickupThanaId;
  final String? pickLocation;
  final dynamic orderType;
  final dynamic codType;
  final dynamic status;
  final dynamic statusDescription;
  final DateTime? merchantpayDate;
  final dynamic deliverymanPayDate;
  final dynamic pickupmanPayDate;
  final DateTime? pickupDate;
  final DateTime? deliveryDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? title;
  final String? division;
  final String? district;
  final String? thana;
  final String? area;
  final String? firstName;
  final dynamic lastName;
  final dynamic phoneNumber;
  final dynamic emailAddress;
  final String? companyName;
  final dynamic mstatus;
  final dynamic mid;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      invoiceNo: json["invoiceNo"],
      merchantId: json["merchantId"],
      paymentInvoice: json["paymentInvoice"],
      cod: json["cod"],
      merchantAmount: json["merchantAmount"],
      merchantDue: json["merchantDue"],
      deliverymanAmount: json["deliveryman_amount"],
      deliverymanPaid: json["deliveryman_paid"],
      deliverymanDue: json["deliveryman_due"],
      pickupmanAmount: json["pickupman_amount"],
      pickupmanPaid: json["pickupman_paid"],
      pickupmanDue: json["pickupman_due"],
      merchantpayStatus: json["merchantpayStatus"],
      merchantPaid: json["merchantPaid"],
      recipientName: json["recipientName"],
      recipientAddress: json["recipientAddress"],
      recipientPhone: json["recipientPhone"],
      note: json["note"],
      deliveryCharge: json["deliveryCharge"],
      promotiuonalDiscount: json["promotiuonal_discount"],
      codCharge: json["codCharge"],
      productPrice: json["productPrice"],
      divisionId: json["division_id"],
      districtId: json["district_id"],
      thanaId: json["thana_id"],
      areaId: json["area_id"],
      deliveryAddress: json["delivery_address"],
      deliverymanId: json["deliverymanId"],
      pickupmanId: json["pickupmanId"],
      agentId: json["agentId"],
      productWeight: json["productWeight"],
      trackingCode: json["trackingCode"],
      percelType: json["percelType"],
      helpNumber: json["helpNumber"],
      reciveZone: json["reciveZone"],
      pickupThanaId: json["pickup_thana_id"],
      pickLocation: json["pickLocation"],
      orderType: json["orderType"],
      codType: json["codType"],
      status: json["status"],
      statusDescription: json["status_description"],
      merchantpayDate: DateTime.tryParse(json["merchantpayDate"] ?? ""),
      deliverymanPayDate: json["deliveryman_pay_date"],
      pickupmanPayDate: json["pickupman_pay_date"],
      pickupDate: DateTime.tryParse(json["pickup_date"] ?? ""),
      deliveryDate: DateTime.tryParse(json["delivery_date"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      title: json["title"],
      division: json["division"],
      district: json["district"],
      thana: json["thana"],
      area: json["area"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      emailAddress: json["emailAddress"],
      companyName: json["companyName"],
      mstatus: json["mstatus"],
      mid: json["mid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoiceNo": invoiceNo,
        "merchantId": merchantId,
        "paymentInvoice": paymentInvoice,
        "cod": cod,
        "merchantAmount": merchantAmount,
        "merchantDue": merchantDue,
        "deliveryman_amount": deliverymanAmount,
        "deliveryman_paid": deliverymanPaid,
        "deliveryman_due": deliverymanDue,
        "pickupman_amount": pickupmanAmount,
        "pickupman_paid": pickupmanPaid,
        "pickupman_due": pickupmanDue,
        "merchantpayStatus": merchantpayStatus,
        "merchantPaid": merchantPaid,
        "recipientName": recipientName,
        "recipientAddress": recipientAddress,
        "recipientPhone": recipientPhone,
        "note": note,
        "deliveryCharge": deliveryCharge,
        "promotiuonal_discount": promotiuonalDiscount,
        "codCharge": codCharge,
        "productPrice": productPrice,
        "division_id": divisionId,
        "district_id": districtId,
        "thana_id": thanaId,
        "area_id": areaId,
        "delivery_address": deliveryAddress,
        "deliverymanId": deliverymanId,
        "pickupmanId": pickupmanId,
        "agentId": agentId,
        "productWeight": productWeight,
        "trackingCode": trackingCode,
        "percelType": percelType,
        "helpNumber": helpNumber,
        "reciveZone": reciveZone,
        "pickup_thana_id": pickupThanaId,
        "pickLocation": pickLocation,
        "orderType": orderType,
        "codType": codType,
        "status": status,
        "status_description": statusDescription,
        "merchantpayDate":
            "${merchantpayDate!.year.toString().padLeft(4)}-${merchantpayDate!.month.toString().padLeft(2)}-${merchantpayDate!.day.toString().padLeft(2)}",
        "deliveryman_pay_date": deliverymanPayDate,
        "pickupman_pay_date": pickupmanPayDate,
        "pickup_date": pickupDate?.toIso8601String(),
        "delivery_date": deliveryDate?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "division": division,
        "district": district,
        "thana": thana,
        "area": area,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "companyName": companyName,
        "mstatus": mstatus,
        "mid": mid,
      };
}

class Parceltype {
  Parceltype({
    required this.id,
    required this.title,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? slug;
  final DateTime? createdAt;
  final dynamic updatedAt;

  factory Parceltype.fromJson(Map<String, dynamic> json) {
    return Parceltype(
      id: json["id"],
      title: json["title"],
      slug: json["slug"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
