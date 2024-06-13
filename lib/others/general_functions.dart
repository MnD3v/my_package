import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GFunctions {
  static get timeId => DateTime.now().millisecondsSinceEpoch.toString();

  static String priceString(String x) {
    List a = [];
    int v = 0;
    for (int i = 0; i < x.length; i++) {
      a.add(x[i]);
    }
    for (int i = a.length - 1; i >= 0; i--) {
      v++;
      if (v % 3 == 0) {
        a.insert(i, ' ');
      }
    }
    return a.join();
  }

  static String datePlusDays(int number) {
    int years = DateTime.now().year;
    int months = DateTime.now().month;
    int days = DateTime.now().day;
    days = (days + number) % 30;
    if ((days + number) ~/ 30 > 0) {
      if (months == 12) {
        months = 1;
        years++;
      } else {
        months++;
      }
    }
    return "$years-${GFunctions.intToHourString(months)}-${GFunctions.intToHourString(days)}";
  }

  static bool isYesterday(date) {
    return GFunctions.tomorow(date) ==
        DateTime.now().toString().split(' ').first;
  }

  static bool isToday(String date) {
    date = date.split(' ')[0];
    return date == DateTime.now().toString().split(' ').first;
  }

  static String intToHourString(int value) {
    return value < 10 ? '0$value' : value.toString();
  }

  static int differencesOfDays(String date, bool online) {
    int years =
        (DateTime.now()).year - int.parse(date.split(' ')[0].split('-').first);
    int months =
        (DateTime.now()).month - int.parse(date.split(' ')[0].split('-')[1]);
    int days =
        (DateTime.now()).day - int.parse(date.split(' ')[0].split('-')[2]);
    int diff = years * 365 + months * 30 + days;
    return diff;
  }

  static String ilYa(String date) {
    if (differencesOfDays(date, false) < 7) {
      return "il y'a ${differencesOfDays(date, false)} jours";
    } else if (differencesOfDays(date, false) < 30) {
      return "il y'a ${differencesOfDays(date, false) ~/ 7} sem.";
    } else {
      return "il y'a ${differencesOfDays(date, false) ~/ 30} mois";
    }
  }

  static String tomorow(String date) {
    date = date.split(' ')[0];
    Map nombresJours(bool bix) => {
          1: '31',
          2: bix ? '29' : '28',
          3: '31',
          4: '30',
          5: '31',
          6: '30',
          7: '31',
          8: '31',
          9: '30',
          10: '31',
          11: '30',
          12: '31'
        };
    var list = date.split('-').map((e) => int.parse(e)).toList();
    if (list[2] < int.parse(nombresJours(list[0] % 4 == 0)[list[1]])) {
      list[2] += 1;
    } else {
      list[2] = 1;
      if (list[1] == 12) {
        list[1] = 1;
        list[0]++;
      } else {
        list[1]++;
      }
    }
    List<String> tomorow = [];
    list.join('-').split('-').forEach((element) {
      if (element.length == 1) {
        tomorow.add('0$element');
      } else {
        tomorow.add(element);
      }
    });

    return tomorow.join('-');
  }

  static bool isPhoneNumber({required String country, required String numero}) {
    if (country == "+228") {
      if (isTogoleasePhoneNumber(numero: numero)) {
        return true;
      }
      return false;
    } else {
      if (numero.length >= 8) {
        return true;
      }
      return false;
    }
  }

  static bool isTogoleasePhoneNumber({required String numero}) {
    if (numero.length == 8) {
      if (numero[0] == '9' &&
          ['0', '1', '2', '3', '6', '7', '8', '9'].contains(numero[1])) {
        return true;
      } else if (numero[0] == '7' && ['0', '1', '9', '8'].contains(numero[1])) {
        return true;
      }
    }
    return false;
  }

  static bool suspect94(String description) {
    int sus = 0;
    int result = 0;
    var tempN = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    var tempS = ['-', ' ', '.', '_'];
    //+ # pour pouvoir rentré dans le else si on numero est tout a la fin
    for (var element in ('$description#').characters) {
      if (tempN.contains(element)) {
        sus++;
      } else if (tempS.contains(element)) {
      } else {
        if (result < sus) {
          result = sus;
        }
        sus = 0;
      }
    }

    return result >= 8;
  }

  static String separate(int number, String string) {
    return number == 3
        ? string.replaceAllMapped(
            RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
            (Match match) => '${match.group(1)} ',
          )
        : string.replaceAllMapped(
            RegExp(r'(\d)(?=(\d{2})+(?!\d))'),
            (Match match) => '${match.group(1)} ',
          );
  }

 static String formatDate(String date) {
    const List<String> months = [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre"
    ];

    DateTime parsedDate = DateTime.parse(date);

    int day = parsedDate.day;
    int month = parsedDate.month;
    int year = parsedDate.year;

    String formattedDate = '$day ${months[month - 1]} $year';

    return formattedDate;
  }
}

waitAfter(int milliseconds, VoidCallback function) {
  Future.delayed(milliseconds.milliseconds, function);
}
