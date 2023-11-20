import 'package:intl/intl.dart';

List<Map<String, String>> daysOfWeek(DateTime ladateToday) {
  // get today's date
  List<Map<String, String>> dateList = [];
  var now = ladateToday;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  int today = now.weekday;
  var dayNr = (today + 6) % 7;

  var lundiExample = now.subtract(Duration(days: (dayNr)));
  final String lundi = formatter.format(lundiExample);
  final String mardi =
      formatter.format(lundiExample.add(const Duration(days: 1)));
  final String mercredi =
      formatter.format(lundiExample.add(const Duration(days: 2)));
  final String jeudi =
      formatter.format(lundiExample.add(const Duration(days: 3)));
  final String vendredi =
      formatter.format(lundiExample.add(const Duration(days: 4)));
  final String samedi =
      formatter.format(lundiExample.add(const Duration(days: 5)));
  final String dimanche =
      formatter.format(lundiExample.add(const Duration(days: 6)));
/*
  print("Todays date: ${now}");
  print("Todays date: ${formatter.format(now)}");
  print("Lundi of this week: ${lundi}");
  print("Mardi of this week: ${mardi}");
  print("Mercredi of this week: ${mercredi}");
  print("Jeudi of this week: ${jeudi}");
  print("Vendredi of this week: ${vendredi}");
  print("Samedi of this week: ${samedi}");*/
  dateList.addAll([
    {
      "day": "Lun",
      "num": "${lundi[lundi.length - 2]}${lundi[lundi.length - 1]}"
    },
    {
      "day": "Mar",
      "num": "${mardi[mardi.length - 2]}${mardi[mardi.length - 1]}"
    },
    {
      "day": "Mer",
      "num": "${mercredi[mercredi.length - 2]}${mercredi[mercredi.length - 1]}"
    },
    {
      "day": "Jeu",
      "num": "${jeudi[jeudi.length - 2]}${jeudi[jeudi.length - 1]}"
    },
    {
      "day": "Ven",
      "num": "${vendredi[vendredi.length - 2]}${vendredi[vendredi.length - 1]}"
    },
    {
      "day": "Sam",
      "num": "${samedi[samedi.length - 2]}${samedi[samedi.length - 1]}"
    },
    {
      "day": "Dim",
      "num": "${dimanche[dimanche.length - 2]}${dimanche[dimanche.length - 1]}"
    },
  ]);
  //print(dateList);
  return dateList;
}

bool isToday(String? numDay, dateSelected) {
  var now = dateSelected;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String today = formatter.format(now);
  final String todayNum =
      "${today[today.length - 2]}${today[today.length - 1]}";
  return todayNum == numDay ? true : false;
}

String stringMonth(String? numMonth) {
  String mois = "";
  switch (numMonth) {
    case "1":
      mois = "Janvier";
      break;
    case "2":
      mois = "Février";
      break;
    case "3":
      mois = "Mars";
      break;
    case "4":
      mois = "Avril";
      break;
    case "5":
      mois = "Mai";
      break;
    case "6":
      mois = "Juin";
      break;
    case "7":
      mois = "Juillet";
      break;
    case "8":
      mois = "Août";
      break;
    case "9":
      mois = "Septembre";
      break;
    case "10":
      mois = "Octobre";
      break;
    case "11":
      mois = "Novembre";
      break;
    case "12":
      mois = "Décembre";
      break;
    default:
  }
  return mois;
}

String? getDay(DateTime ladateToday) {
  var now = ladateToday;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String today = formatter.format(now);
  final String todayNum =
      "${today[today.length - 2]}${today[today.length - 1]}";
  List<Map<String, String>> dateList = daysOfWeek(ladateToday);
  for (Map<String, String> item in dateList) {
    if (item["num"] == todayNum) {
      return item["day"];
    }
  }
  return null;
}

String daysBetween(String dateString, {bool numericDates = true}) {
  DateTime date = DateTime.parse(dateString);
  final date2 = DateTime.now();
  final difference = date2.difference(date);

  if ((difference.inDays / 365).floor() >= 2) {
    return 'il y\'a ${(difference.inDays / 365).floor()} ans';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return (numericDates) ? 'il y\'a 1 an' : 'Last year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    return 'il y\'a ${(difference.inDays / 365).floor()} mois';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return (numericDates) ? 'il y\'a 1 mois' : 'Last month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    return 'il y\'a ${(difference.inDays / 7).floor()} semaines';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? 'il y\'a 1 semaine' : 'Last week';
  } else if (difference.inDays >= 2) {
    return 'il y\'a ${difference.inDays} jours';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? 'il y\'a 1 jour' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return 'il y\'a ${difference.inHours} heures';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? 'il y\'a 1 heure' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return 'il y\'a ${difference.inMinutes} minutes';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? 'il y\'a 1 minute' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return 'il y\'a ${difference.inSeconds} seconds';
  } else {
    return 'maintenant';
  }
}
