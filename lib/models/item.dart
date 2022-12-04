class Item{
  String name;
  String description;
  String category;
  double price;
  
  Item({required this.name, required this.description, required this.category, required this.price});

  Item.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        category = json['category'],
        price = json['price'];

}