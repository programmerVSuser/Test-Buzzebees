class DataModalCampaiggn{
  final String name;
  final String price;
  final String image_url;
  final String description;

  DataModalCampaiggn({
    required this.name,
    required this.price,
    required this.image_url,
    required this.description,

  });
  DataModalCampaiggn copyWith({
    String? name,
    String? price,
    String? image_url,
    String? description,

  }){
    return DataModalCampaiggn(
      name:  name  ??  this.name,
      price:  price  ??  this.price,
      image_url:  image_url  ??  this.image_url,
      description:  description  ??  this.description,
    );
  }
  Map<String, dynamic> toMap() {
    return{
      'name' : name,
      'price' : price,
      'image_url' : image_url,
      'description' : description,

    };
  }
  factory DataModalCampaiggn.fromMap(Map<String,dynamic>map){
    return DataModalCampaiggn(
      name  :  map['name'],
      price  :  map['price'],
      image_url  :  map['image_url'],
      description  :  map['description'],

    );
  }
}
