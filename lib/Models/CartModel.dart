/// items : [{"product":1,"quantity":1},{"product":1,"quantity":1}]
/// total : 582.0
/// discount : 145.5
/// subTotal : 436.5

class CartModel {
  CartModel({
    List<Items>? items,
    double? total,
    double? discount,
    double? subTotal,}){
    _items = items;
    _total = total;
    _discount = discount;
    _subTotal = subTotal;
  }

  CartModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _total = json['total'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
  }
  List<Items>? _items;
  double? _total;
  double? _discount;
  double? _subTotal;
  CartModel copyWith({  List<Items>? items,
    double? total,
    double? discount,
    double? subTotal,
  }) => CartModel(  items: items ?? _items,
    total: total ?? _total,
    discount: discount ?? _discount,
    subTotal: subTotal ?? _subTotal,
  );
  List<Items>? get items => _items;
  double? get total => _total;
  double? get discount => _discount;
  double? get subTotal => _subTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    return map;
  }

}

/// product : 1
/// quantity : 1

class Items {
  Items({
    int? product,
    int? quantity,}){
    _product = product;
    _quantity = quantity;
  }

  Items.fromJson(dynamic json) {
    _product = json['product'];
    _quantity = json['quantity'];
  }
  int? _product;
  int? _quantity;
  Items copyWith({  int? product,
    int? quantity,
  }) => Items(  product: product ?? _product,
    quantity: quantity ?? _quantity,
  );
  int? get product => _product;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product;
    map['quantity'] = _quantity;
    return map;
  }

}