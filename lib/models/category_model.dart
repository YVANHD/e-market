class Category {
  int? _id;
  String? _categoryName;
  String? _logo;
  int? _pieces;
  String? _text;
  late List<ProductModel> _products;
   List<ProductModel> get categories => _products;

  Category(
      {
        required id,
        required categoryName,
        required logo,
        required pieces,
        required text,
        required products
      }
      ) {
        this._id = id;
        this._categoryName = categoryName;
        this._logo = logo;
        this._pieces = pieces;
        this._text = text;
        this._products =  _products;
      }

  Category.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
    _logo = json['logo'];
    _pieces = json['pieces'];
    _text = json['text'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['categoryName'] = this._categoryName;
    data['logo'] = this._logo;
    data['pieces'] = this._pieces;
    data['text'] = this._text;
    if (this._products != null) {
      data['products'] = _products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? logo;
  String? description;
  int? stars;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.logo,
      this.description,
      this.stars});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    logo = json['logo'];
    description = json['description'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['stars'] = this.stars;
    return data;
  }
}