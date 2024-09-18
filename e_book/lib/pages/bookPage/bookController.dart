import 'package:get/get.dart';
import 'bookmodel/book.dart';

class BookController extends GetxController {
  RxString bookName = ''.obs;
  RxString author = ''.obs;
  RxString description = ''.obs;
  RxDouble rating = 0.0.obs;
  RxString language = ''.obs;
  RxInt pages = 0.obs;

  void setBook(String name, String authorName, String desc, double bookRating, String bookLang, int bookPages) {
    bookName.value = name;
    author.value = authorName;
    description.value = desc;
    rating.value = bookRating;
    language.value = bookLang;
    pages.value = bookPages;
  }

  Book getBook() {
    return Book(
      name: bookName.value,
      author: author.value,
      description: description.value,
      rating: rating.value,
      language: language.value,
      pages: pages.value,
    );
  }
}

