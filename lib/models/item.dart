class Item{
  late int itemId = 0;
  String name;
  String description;
  String category;
  double price;
  
  Item({required this.name, required this.description, required this.category, required this.price});

  Item.fromJson(Map<String, dynamic> json)
      : itemId = json['itemId'],
        name = json['name'],
        description = json['description'],
        category = json['category'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'name': name,
        'description': description,
        'category': category,
        'price': price,
      };
}