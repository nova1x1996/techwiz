//List Plant
class Plant{
 final String image;
final  String title;
 final String subtitle;
  final int price;
  Plant({required this.image,required this.title, required this.subtitle, required this.price});

 factory Plant.fromJson(Map<String, dynamic> json) {
   return Plant(
     image: json['image'],
     title: json['title'],
     subtitle: json['subtitle'],
     price: json['price'],
   );
 }

}

 List<Plant> plants = [
   Plant(
    image: 'lib/assets/images/gr.jpg',
    title: 'AAAAAAAAAAAAAAAA',
    subtitle: 'Subtitle 1',
    price: 100,
  ),
  Plant(
    image: 'lib/assets/images/gr.jpg',
    title: 'BBBBBBBBBBB',
    subtitle: 'Subtitle 2',
    price: 1500,
  ),
  Plant(
    image: 'lib/assets/images/gr.jpg',
    title: 'AAAABCCDADAD',
    subtitle: 'Subtitle 3',
    price: 20,
  ),
  Plant(
    image: 'lib/assets/images/gr.jpg',
    title: 'adaddqfqwf',
    subtitle: 'Subtitle 4',
    price: 25,
  ),
  Plant(
    image: 'lib/assets/images/gr.jpg',
    title: 'Plant 5',
    subtitle: 'Subtitle 5',
    price: 30,
  ),
  Plant(    image: 'lib/assets/images/gr.jpg',
    title: 'Plant 6',
    subtitle: 'Subtitle 6',
    price: 35,
  ),
];

// class Accessories {
//   final String image;
//   final String title;
//   final String subtitle;
//   final int price;
//
//   Accessories({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.price,
//   });
// }
//
// List<Accessories> accessories = [
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 1',
//     subtitle: 'Accessory Subtitle 1',
//     price: 5,
//   ),
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 2',
//     subtitle: 'Accessory Subtitle 2',
//     price: 8,
//   ),
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 3',
//     subtitle: 'Accessory Subtitle 3',
//     price: 12,
//   ),
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 4',
//     subtitle: 'Accessory Subtitle 4',
//     price: 15,
//   ),
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 5',
//     subtitle: 'Accessory Subtitle 5',
//     price: 20,
//   ),
//   Accessories(
//     image: 'lib/assets/images/watercabs.jpg',
//     title: 'Accessory 6',
//     subtitle: 'Accessory Subtitle 6',
//     price: 25,
//   ),
// ];


