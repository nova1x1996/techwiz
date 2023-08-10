import '../models/product.dart';
import '../models/store.dart';


// Tạo các cửa hàng
Store store1 = Store(
  name: 'Store 1',
  address: '123 Main Street',
  phone: '555-1234',
  openTime: '9:00 AM - 6:00 PM',
  avatar: 'lib/assets/images/logo.png',
  background: 'lib/assets/images/background.png',
  products: [
    Product(name: 'Product 1', price: 10, image: 'lib/assets/images/logo.png'),
    Product(name: 'Product 2', price: 20, image: 'lib/assets/images/logo.png'),
    Product(name: 'Product 3', price: 30, image: 'lib/assets/images/logo.png'),
  ],
);

Store store2 = Store(
  name: 'Store 2',
  address: '456 Park Avenue',
  phone: '555-5678',
  openTime: '10:00 AM - 7:00 PM',
  avatar: 'lib/assets/images/logo.png',
  background: 'lib/assets/images/background.png',
  products: [
    Product(name: 'Product A', price: 15, image: 'lib/assets/images/logo.png'),
    Product(name: 'Product B', price: 25, image: 'lib/assets/images/logo.png'),
  ],
);

// Tạo danh sách cửa hàng và thêm các cửa hàng vào danh sách
List<Store> storeList = [
  store1,
  store2,
  // Thêm các cửa hàng khác nếu cần
];
