/// products : [{"id":1,"quantity":1},{"id":2,"quantity":1}]
/// customerId : 101
/// total : 1050
/// discount : 262.5
/// subTotal : 787.5

class CartModel {
  CartModel({
      List<Products>? products, 
      int? customerId, 
      int? total, 
      double? discount, 
      double? subTotal,}){
    _products = products;
    _customerId = customerId;
    _total = total;
    _discount = discount;
    _subTotal = subTotal;
}

  CartModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _customerId = json['customerId'];
    _total = json['total'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
  }
  List<Products>? _products;
  int? _customerId;
  int? _total;
  double? _discount;
  double? _subTotal;
CartModel copyWith({  List<Products>? products,
  int? customerId,
  int? total,
  double? discount,
  double? subTotal,
}) => CartModel(  products: products ?? _products,
  customerId: customerId ?? _customerId,
  total: total ?? _total,
  discount: discount ?? _discount,
  subTotal: subTotal ?? _subTotal,
);
  List<Products>? get products => _products;
  int? get customerId => _customerId;
  int? get total => _total;
  double? get discount => _discount;
  double? get subTotal => _subTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['customerId'] = _customerId;
    map['total'] = _total;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    return map;
  }

}

/// id : 1
/// quantity : 1

class Products {
  Products({
      int? id, 
      int? quantity,}){
    _id = id;
    _quantity = quantity;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
  }
  int? _id;
  int? _quantity;
Products copyWith({  int? id,
  int? quantity,
}) => Products(  id: id ?? _id,
  quantity: quantity ?? _quantity,
);
  int? get id => _id;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    return map;
  }

}