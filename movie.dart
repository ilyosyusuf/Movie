import 'dart:io';

void main(List<String> args) async {
  Movie hulk = Movie(
      id: 123,
      name: "Hulk",
      duration: 135,
      size: 1450,
      director: Director(d_name: "Louis Letterier", entertainment: "Marvel"));
  Movie dstr = Movie(
      id: 456,
      name: "Doctor Strange",
      duration: 120,
      size: 1300,
      director: Director(d_name: "Scott Derrickson", entertainment: "Marvel"));
  Movie spi = Movie(
      id: 789,
      name: "SpiderMan",
      duration: 160,
      size: 1120,
      director: Director(d_name: "John Watts", entertainment: "Marvel"));
  Movie thor = Movie(
      id: 987,
      name: "Thor",
      duration: 110,
      size: 1400,
      director: Director(d_name: "Kenneth Branagh", entertainment: "Marvel"));
  Movie global = Movie();
  List toAdd = [];
  List dl = ["d", "o", "w", "n", "l", "o", "a", "d", "i", "n", "g"];

  while (true) {
    var baza = 0;
    print("\nUmumiy filmlar ro'yxati:");
    for (var i = 0; i < global.lst.length; i++) {
      print(" * ${global.lst[i]}");
    }
    print("\n1. Kino haqida ma'lumot olish.\n"
        "2. Kinoni to'g'ridan to'g'ri ko'chirish.\n"
        "3. Yuklab olingan filmlar ro'yxati\n"
        "4. Chiqish");
    String? first_choice = stdin.readLineSync();

    // stop program
    if (first_choice == "4") {
      print("Salomat bo'ling:)");
      break;
    }

    // general choice
    switch (first_choice) {
      // information about movies
      case "1":
        print("\nQaysi film haqida ma'lumot olmoqchisiz?");
        for (var i = 0; i < global.lst.length; i++) {
          print("${i + 1}. ${global.lst[i]}");
        }
        String? second_choice = stdin.readLineSync();
        // one movie information
        switch (second_choice) {
          case "1":
            hulk.showInfo();
            break;
          case "2":
            dstr.showInfo();
            baza += 1;
            break;
          case "3":
            spi.showInfo();
            baza += 2;
            break;
          case "4":
            thor.showInfo();
            baza += 3;
            break;
          default:
            print("\nKerakli raqam tanlang\n");
        }
        print("\n1. Kinoni yuklab olish.\n"
            "2. Ortga qaytish.");
        String? third_choice = stdin.readLineSync();

        // downloading movie in movie information section
        switch (third_choice) {
          case "1":
            // download();
            if (toAdd.contains(global.lst[baza])) {
              print("\nBu kinoni ko'chirib bo'lgansiz\n");
            } else {
              for (var i = 0, j = 0; i < dl.length; i++, j += 500)
                await Future.delayed(Duration(milliseconds: j), () {
                  stdout.write("${dl[i]}");
                });
              toAdd.add(global.lst[baza]);
              print("\n${global.lst[baza]} filmi yuklab olindi\n");
            }
            break;
        }
        break;

      // direct download
      case "2":
        print("\nQaysi filmni yuklamoqchisiz?");
        for (var i = 0; i < global.lst.length; i++) {
          print("${i + 1}. ${global.lst[i]}");
        }
        String? fourth_choice = stdin.readLineSync();
          
        // downloading movie in direct download
        switch (fourth_choice) {
          case "1":
            if (toAdd.contains(global.lst[baza])) {
              print("\nBu kinoni ko'chirib bo'lgansiz\n");
            } else {
              for (var i = 0, j = 0; i < dl.length; i++, j += 500)
                await Future.delayed(Duration(milliseconds: j), () {
                  stdout.write("${dl[i]}");
                });
              toAdd.add(global.lst[baza]);
              print("\n${global.lst[baza]} filmi yuklab olindi\n");
            }

            break;
          case "2":
            baza += 1;
            if (toAdd.contains(global.lst[baza])) {
              print("\nBu kinoni ko'chirib bo'lgansiz\n");
            } else {
              for (var i = 0, j = 0; i < dl.length; i++, j += 500)
                await Future.delayed(Duration(milliseconds: j), () {
                  stdout.write("${dl[i]}");
                });
              toAdd.add(global.lst[baza]);
              print("\n${global.lst[baza]} filmi yuklab olindi\n");
            }
            break;
          case "3":
            baza += 2;
            if (toAdd.contains(global.lst[baza])) {
              print("\nBu kinoni ko'chirib bo'lgansiz\n");
            } else {
              for (var i = 0, j = 0; i < dl.length; i++, j += 500)
                await Future.delayed(Duration(milliseconds: j), () {
                  stdout.write("${dl[i]}");
                });
              toAdd.add(global.lst[baza]);
              print("\n${global.lst[baza]} filmi yuklab olindi\n");
            }
            break;
          case "4":
            baza += 3;
            if (toAdd.contains(global.lst[baza])) {
              print("\nBu kinoni ko'chirib bo'lgansiz\n");
            } else {
              for (var i = 0, j = 0; i < dl.length; i++, j += 500)
                await Future.delayed(Duration(milliseconds: j), () {
                  stdout.write("${dl[i]}");
                });
              toAdd.add(global.lst[baza]);
              print("\n${global.lst[baza]} filmi yuklab olindi\n");
            }
            break;
          default:
            print("\nKerakli raqamni tanlang\n!");
        }
        break;

      // show downloaded movies
      case "3":
        if (toAdd.isEmpty) {
          print("\nHali Film yuklab olmagansiz\n");
        } else {
          print("\nSiz ushbu filmlarni yuklab olgansiz\n");
          for (var i = 0; i < toAdd.length; i++) {
            print("${i + 1}. ${toAdd[i]}");
          }
          print("\n");
        }
        break;
      default:
        print("\nKerakli raqamni tanlang\n");
    }
  }
}


class Movie {
  int? id;
  String? name;
  int? duration;
  String? thumbnail;
  int? size;
  Director? director;

  List<String> lst = [
    "Hulk",
    "Doctor Strange",
    "Spiderman",
    "Thor",
  ];

  Movie({this.id, this.name, this.duration, this.size, this.director});

  void showInfo() {
    print("ID: ${this.id}\n"
        "Film nomi: ${this.name}\n"
        "Vaqti: ${this.duration} daqiqa\n"
        "Hajmi: ${this.size} MB\n"
        "Rejissor: ${this.director!.d_name}\n"
        "Kinokompaniya: ${this.director!.entertainment}");
  }
}

class Director {
  String? d_name;
  String? entertainment;
  Director({this.d_name, this.entertainment});
}
