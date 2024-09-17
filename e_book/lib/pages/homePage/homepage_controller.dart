/*
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomePageController extends GetxController{

  var items = [
    {
      'icon': 'lib/assets/icons/heart.png',
      'text': 'Romance',
    },
    {
      'icon': 'lib/assets/icons/documentary.png',
      'text': 'Documentary'
    },
    {
      'icon': 'lib/assets/icons/education.png',
      'text': 'Education'
    },
    {
      'icon': 'lib/assets/icons/earth.png',
      'text': 'Travel'
    },
    {
      'icon': 'lib/assets/icons/bibimbap.png',
      'text': 'Food'
    }
  ].obs;

  var trendingItems = [
    {
      'image': 'lib/assets/images/novel1.png',
      'title': 'Don\'t look back',
    },
    {
      'image': 'lib/assets/images/novel2.jpeg',
      'title': 'It ends with us',
    },
    {
      'image': 'lib/assets/images/novel3.jpeg',
      'title': 'Waves',
    },
    {
      'image': 'lib/assets/images/novel4.jpeg',
      'title': 'Grave of the Fireflies',
    },
    {
      'image': 'lib/assets/images/novel5.jpeg',
      'title': 'Doctor Strange',
    },
  ].obs;

  var interestsItems = [
    {
      'image': 'lib/assets/images/rich.jpeg',
      'title': 'Rich Dad Poor Dad',
      'description': 'A book about financial education.',
      'price': '\$20.99',
      'rating': '4.5'
    },
    {
      'image': 'lib/assets/images/gatsby.jpeg',
      'title': 'The Great Gatsby',
      'description': 'Classic novel by F. Scott Fitzgerald.',
      'price': '\$15.99',
      'rating': '4.7'
    },
    {
      'image': 'lib/assets/images/atomic.jpeg',
      'title': 'Atomic Habits',
      'description': 'A book on how to build good habits.',
      'price': '\$12.99',
      'rating': '4.8'
    },
    {
      'image': 'lib/assets/images/sapiens.jpeg',
      'title': 'Sapiens',
      'description': 'A brief history of humankind.',
      'price': '\$18.50',
      'rating': '4.6'
    },
    {
      'image': 'lib/assets/images/alchemist.jpeg',
      'title': 'The Alchemist',
      'description': 'A philosophical book on personal legends.',
      'price': '\$10.99',
      'rating': '4.4'
    },
    {
      'image': 'lib/assets/images/1984.jpeg',
      'title': '1984',
      'description': 'Dystopian novel by George Orwell.',
      'price': '\$14.99',
      'rating': '4.9'
    },
  ].obs;

}
*/
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var items = <Map<String, String>>[].obs;
  var trendingItems = <Map<String, String>>[].obs;
  var interestsItems = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
    loadTrendingItems();
    loadInterestsItems();
  }

  void loadItems() {
    items.addAll([
      {'icon': 'lib/assets/icons/heart.png', 'text': 'Romance'},
      {'icon': 'lib/assets/icons/documentary.png', 'text': 'Documentary'},
      {'icon': 'lib/assets/icons/education.png', 'text': 'Education'},
      {'icon': 'lib/assets/icons/earth.png', 'text': 'Travel'},
      {'icon': 'lib/assets/icons/bibimbap.png', 'text': 'Food'}
    ]);
  }

  void loadTrendingItems() {
    trendingItems.addAll([
      {'image': 'lib/assets/images/novel1.png', 'title': 'Don\'t look back'},
      {'image': 'lib/assets/images/novel2.jpeg', 'title': 'It ends with us'},
      {'image': 'lib/assets/images/novel3.jpeg', 'title': 'Waves'},
      {'image': 'lib/assets/images/novel4.jpeg', 'title': 'Grave of the Fireflies'},
      {'image': 'lib/assets/images/novel5.jpeg', 'title': 'Doctor Strange'},
    ]);
  }

  void loadInterestsItems() {
    interestsItems.addAll([
      {
        'image': 'lib/assets/images/rich.jpeg',
        'title': 'Rich Dad Poor Dad',
        'description': 'A book about financial education.',
        'price': '\$20.99',
        'rating': '4.5'
      },
      {
        'image': 'lib/assets/images/gatsby.jpeg',
        'title': 'The Great Gatsby',
        'description': 'Classic novel by F. Scott Fitzgerald.',
        'price': '\$15.99',
        'rating': '4.7'
      },
      {
        'image': 'lib/assets/images/atomic.jpeg',
        'title': 'Atomic Habits',
        'description': 'A book on how to build good habits.',
        'price': '\$12.99',
        'rating': '4.8'
      },
      {
        'image': 'lib/assets/images/sapiens.jpeg',
        'title': 'Sapiens',
        'description': 'A brief history of humankind.',
        'price': '\$18.50',
        'rating': '4.6'
      },
      {
        'image': 'lib/assets/images/alchemist.jpeg',
        'title': 'The Alchemist',
        'description': 'A philosophical book on personal legends.',
        'price': '\$10.99',
        'rating': '4.4'
      },
      {
        'image': 'lib/assets/images/1984.jpeg',
        'title': '1984',
        'description': 'Dystopian novel by George Orwell.',
        'price': '\$14.99',
        'rating': '4.9'
      },
    ]);
  }
}
