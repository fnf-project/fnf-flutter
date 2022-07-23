/// id : 1
/// name : "Dalda Ghee"
/// uom : "KG"
/// weight : 1
/// price : 570
/// expiry_date : "2022-07-30"

class Product {
  Product({
      int? id, 
      String? name, 
      String? uom, 
      double? weight,
      double? price,
      String? expiryDate,}){
    _id = id;
    _name = name;
    _uom = uom;
    _weight = weight;
    _price = price;
    _expiryDate = expiryDate;
}


  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _uom = json['uom'];
    _weight = double.parse(json['weight']);
    _price = double.parse(json['price']);
    _expiryDate = json['expiry_date'];
  }
  int? _id;
  String? _name;
  String? _uom;
  double? _weight;
  double? _price;
  String? _expiryDate;
Product copyWith({  int? id,
  String? name,
  String? uom,
  double? weight,
  double? price,
  String? expiryDate,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  uom: uom ?? _uom,
  weight: weight ?? _weight,
  price: price ?? _price,
  expiryDate: expiryDate ?? _expiryDate,
);
  int? get id => _id;
  String? get name => _name;
  String? get uom => _uom;
  double? get weight => _weight;
  double? get price => _price;
  String? get expiryDate => _expiryDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['uom'] = _uom;
    map['weight'] = _weight;
    map['price'] = _price;
    map['expiry_date'] = _expiryDate;
    return map;
  }

}