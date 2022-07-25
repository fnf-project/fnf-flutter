import 'dart:convert';
/// id : 10
/// total : "4910.00"
/// discount : "1227.50"
/// subTotal : "3682.50"
/// status : "pending"
/// items : [{"product":{"id":2,"category":1,"name":"Dalda Cooking Oil Tin","uom":"Ltr","weight":"5.000","price":"2455.00","expiry_date":null,"get_absolute_url":"/cooking-oil/dalda-cooking-oil-tin/","created_at":"2022-07-07T13:11:01.450537Z"},"quantity":2}]

OrdersDetailModel ordersDetailModelFromJson(String str) => OrdersDetailModel.fromJson(json.decode(str));
String ordersDetailModelToJson(OrdersDetailModel data) => json.encode(data.toJson());
class OrdersDetailModel {
  OrdersDetailModel({
      int? id, 
      String? total, 
      String? discount, 
      String? subTotal, 
      String? status, 
      List<Items>? items,}){
    _id = id;
    _total = total;
    _discount = discount;
    _subTotal = subTotal;
    _status = status;
    _items = items;
}

  OrdersDetailModel.fromJson(dynamic json) {
    _id = json['id'];
    _total = json['total'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
    _status = json['status'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }
  int? _id;
  String? _total;
  String? _discount;
  String? _subTotal;
  String? _status;
  List<Items>? _items;
OrdersDetailModel copyWith({  int? id,
  String? total,
  String? discount,
  String? subTotal,
  String? status,
  List<Items>? items,
}) => OrdersDetailModel(  id: id ?? _id,
  total: total ?? _total,
  discount: discount ?? _discount,
  subTotal: subTotal ?? _subTotal,
  status: status ?? _status,
  items: items ?? _items,
);
  int? get id => _id;
  String? get total => _total;
  String? get discount => _discount;
  String? get subTotal => _subTotal;
  String? get status => _status;
  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total'] = _total;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    map['status'] = _status;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product : {"id":2,"category":1,"name":"Dalda Cooking Oil Tin","uom":"Ltr","weight":"5.000","price":"2455.00","expiry_date":null,"get_absolute_url":"/cooking-oil/dalda-cooking-oil-tin/","created_at":"2022-07-07T13:11:01.450537Z"}
/// quantity : 2

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());
class Items {
  Items({
      Product? product, 
      int? quantity,}){
    _product = product;
    _quantity = quantity;
}

  Items.fromJson(dynamic json) {
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _quantity = json['quantity'];
  }
  Product? _product;
  int? _quantity;
Items copyWith({  Product? product,
  int? quantity,
}) => Items(  product: product ?? _product,
  quantity: quantity ?? _quantity,
);
  Product? get product => _product;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['quantity'] = _quantity;
    return map;
  }

}

/// id : 2
/// category : 1
/// name : "Dalda Cooking Oil Tin"
/// uom : "Ltr"
/// weight : "5.000"
/// price : "2455.00"
/// expiry_date : null
/// get_absolute_url : "/cooking-oil/dalda-cooking-oil-tin/"
/// created_at : "2022-07-07T13:11:01.450537Z"

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      int? id, 
      int? category, 
      String? name, 
      String? uom, 
      String? weight, 
      String? price, 
      dynamic expiryDate, 
      String? getAbsoluteUrl, 
      String? createdAt,}){
    _id = id;
    _category = category;
    _name = name;
    _uom = uom;
    _weight = weight;
    _price = price;
    _expiryDate = expiryDate;
    _getAbsoluteUrl = getAbsoluteUrl;
    _createdAt = createdAt;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _category = json['category'];
    _name = json['name'];
    _uom = json['uom'];
    _weight = json['weight'];
    _price = json['price'];
    _expiryDate = json['expiry_date'];
    _getAbsoluteUrl = json['get_absolute_url'];
    _createdAt = json['created_at'];
  }
  int? _id;
  int? _category;
  String? _name;
  String? _uom;
  String? _weight;
  String? _price;
  dynamic _expiryDate;
  String? _getAbsoluteUrl;
  String? _createdAt;
Product copyWith({  int? id,
  int? category,
  String? name,
  String? uom,
  String? weight,
  String? price,
  dynamic expiryDate,
  String? getAbsoluteUrl,
  String? createdAt,
}) => Product(  id: id ?? _id,
  category: category ?? _category,
  name: name ?? _name,
  uom: uom ?? _uom,
  weight: weight ?? _weight,
  price: price ?? _price,
  expiryDate: expiryDate ?? _expiryDate,
  getAbsoluteUrl: getAbsoluteUrl ?? _getAbsoluteUrl,
  createdAt: createdAt ?? _createdAt,
);
  int? get id => _id;
  int? get category => _category;
  String? get name => _name;
  String? get uom => _uom;
  String? get weight => _weight;
  String? get price => _price;
  dynamic get expiryDate => _expiryDate;
  String? get getAbsoluteUrl => _getAbsoluteUrl;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category'] = _category;
    map['name'] = _name;
    map['uom'] = _uom;
    map['weight'] = _weight;
    map['price'] = _price;
    map['expiry_date'] = _expiryDate;
    map['get_absolute_url'] = _getAbsoluteUrl;
    map['created_at'] = _createdAt;
    return map;
  }

}