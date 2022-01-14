String dateFormatter(DateTime source) {
  String day = source.day.toString();
  String month = intMonthName(source.month);
  String year = source.year.toString();
  String form = '$day $month $year';
  return form;
}

String hourFormatter(DateTime source) {
  Duration from = DateTime.now().difference(source);
  if(from.inDays >= 1) {
    return 'Il y a ${from.inDays} jour${from.inDays>1?'s':''}';
  }
  else if(from.inHours >= 1){
    return 'Il y a ${from.inHours} heure${from.inHours>1?'s':''}';
  } else {
    return 'Il y a ${from.inMinutes} minute${from.inMinutes>1?'s':''}';
  }
}

String intMonthName(int month) {
  switch(month) {
    case 1 : return "Janvier";
    case 2 : return "Février";
    case 3 : return "Mars";
    case 4 : return "Avril";
    case 5 : return "Mai";
    case 6 : return "Juin";
    case 7 : return "Juillet";
    case 8 : return "Août";
    case 9 : return "Septembre";
    case 10: return "Octobre";
    case 11: return "Novembre";
    case 12: return "Decembre";
    default: return '';
  }
}