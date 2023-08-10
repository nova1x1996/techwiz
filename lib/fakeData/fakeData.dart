//List Plant
class Plant{
 final String image;
final  String title;
 final String subtitle;
  final String price;
  Plant({required this.image,required this.title, required this.subtitle, required this.price});

}

 List<Plant> plants = [
   Plant(
    image: 'image_url_1',
    title: 'Plant 1',
    subtitle: 'Subtitle 1',
    price: '\$20',
  ),
  Plant(
    image: 'image_url_2',
    title: 'Plant 2',
    subtitle: 'Subtitle 2',
    price: '\$25',
  ),
  Plant(
    image: 'image_url_3',
    title: 'Plant 3',
    subtitle: 'Subtitle 3',
    price: '\$15',
  ),
  Plant(
    image: 'image_url_4',
    title: 'Plant 4',
    subtitle: 'Subtitle 4',
    price: '\$30',
  ),
  Plant(
    image: 'image_url_5',
    title: 'Plant 5',
    subtitle: 'Subtitle 5',
    price: '\$18',
  ),
  Plant(
    image: 'image_url_6',
    title: 'Plant 6',
    subtitle: 'Subtitle 6',
    price: '\$22',
  ),
];

