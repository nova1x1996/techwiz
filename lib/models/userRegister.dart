class UserRegister {
  final String password;
  final String email;
  final String dob;
  final String fullName;
  final String username;

  final String phone;
  final String address;
  final bool gender;
   String? avatar = "aaaaa";

  UserRegister({
    required this.email,
  required  this.phone,
    required this.address,
    required this.gender,
    required  this.password,
    required this.fullName,
    required this.username,
    required this.dob,
      this.avatar

  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   List<Product> products = (json['products'] as List)
  //       .map((item) => Product.fromMap(item))
  //       .toList();
  //   return Store(
  //     name: json['name'] as String,
  //     address: json['address'] as String,
  //     phone: json['phone'] as String,
  //     openTime: json['openTime'] as String,
  //     avatar: json['avatar'] as String,
  //     background: json['background'] as String,
  //     products: products,
  //   );
  // }
  //
  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'fullName': this.fullName,
      'username': this.username,
      'gender': this.gender,
      'phone': this.phone,
      'dob': this.dob,
      'address': this.address,
      'avatar':this.avatar

    };
  }
  //
  // // Thêm sản phẩm vào cửa hàng
  // void addProduct(Product product) {
  //   products.add(product);
  // }
  //
  // // Xoá sản phẩm khỏi cửa hàng
  // void removeProduct(Product product) {
  //   products.remove(product);
  // }
  //
  // // Lấy danh sách sản phẩm trong cửa hàng
  // List<Product> getProducts() {
  //   return products;
  // }
}
