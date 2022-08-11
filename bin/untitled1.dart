//import 'dart:js_util';

import 'package:test/test.dart';
import 'package:untitled1/untitled1.dart' as untitled1;
import 'dart:io';

void main(List<String> arguments) {
  TaskBook book = TaskBook();
  book.main_menu();
}

TaskBook book = TaskBook();

class TaskBook {
  String? name;
  String? author;
  String? rate;
  List list = <TaskBook>[];

  get_rate() {
    return rate;
  }

  get_name() {
    return name;
  }

  get_author() {
    return author;
  }

  add_book() {
    try {
      print('Enter the count of books want to add ');
      int n = int.parse(stdin.readLineSync()!);

      for (int i = 1; i <= n; i++) {
        print('Enter book $i name: ');
        book.name = stdin.readLineSync();
        print('Enter book $i author: ');
        book.author = stdin.readLineSync();
        print('Enter book  $i rate: ');
        book.rate = stdin.readLineSync();
      }
      list.add(book);
      print("done!");
    } catch (FormatException) {
      print("enter correct number");

      add_book();
    }
  }

  det_book() {
    print('Enter the book name: ');
    name = stdin.readLineSync();
    if (list.isEmpty) {
      print('There is no Books!');
    } else {
      for (int i = 0; i < list.length; i++) {
        if (name == list[i]) {
          list.removeWhere((element) => true);
          print("Done!");
        } else {
          print("Ther are ino book in this name!");
          break;
        }
      }
    }
  }

  display_booksrate() {
    for (int i = 0; i < list.length; i++) {
      double r = double.parse(list[i].get_rate());
      if (r >= 4) {
        return true;
      } else {
        return false;
      }
    }
    if (list.isEmpty) {
      print("There is no Books!");
    } else {
      if (display_booksrate()) {
        for (int i = 0; i < list.length; i++) {
          print('book name \t\t author\t\t rate');
          print('${list[i - 0]}\t\t\t ${list[i + 1]}\t\t ${list[i + 2]}');
          break;
        }
      } else {
        print("There is no Books!");
      }
    }
  }

  updata() {
    print('Enter the book name :');
    name = stdin.readLineSync();
    if (list.isEmpty) {
      print('There is no Books!');
    } else {
      for (int i = 0; i < list.length; i++) {
        if (name == list[i]) {
          list.removeWhere((element) => true);

          print('Enter book 1  name: ');
          book.name = stdin.readLineSync();
          print('Enter book 1 author: ');
          book.author = stdin.readLineSync();
          print('Enter book  1 rate: ');
          book.rate = stdin.readLineSync();

          list.add(book);
        } else {
          print('There is no Book');
          break;
        }
      }
    }
  }

  Search_book() {
    print('Enter a query');
    if (list.isEmpty) {
      print('There is no Books!');
    } else {
      name = stdin.readLineSync();
      for (int i = 0; i <= list.length; i++) {
        list.where((item) => name == list[i]);
        print(list);
        break;
      }
    }
  }

  display_book() {
    if (list.isEmpty) {
      print("There is no Books!");
    } else {
      for (int i = 0; i < list.length; i++) {
        print('book name \t\t author\t\t rate');
        print(
            '${list[i].get_name()}\t\t\t\t ${list[i]
                .get_author()}\t\t\t${list[i].get_rate()}');
      }
    }
  }
  main_menu() {
  print('''Main menu
    1- Display all books
    2- Display books with rate +4.
    3- Add book
    4- Update book
    5- Delete book
    6- Search
    Write your choice:''');
 String ?number=stdin.readLineSync()!;
 switch(number){
   case "1" :display_book();break;
   case "2" : display_booksrate();break;
    case "3" : add_book();break;
    case "4" :updata();break;
    case "5" :det_book();break;
    case "6":Search_book();break;
  }}
}
