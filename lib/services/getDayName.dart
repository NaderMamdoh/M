import 'package:intl/intl.dart';

String getDayName(DateTime date){
  switch(DateFormat('EEEE').format(date)){
      case "Saturday":
       return "السبت";
        break;
      case "Sunday":
       return "الأحد";
        break;
      case "Monday":
       return "الأثنين";
        break;
      case "Tuesday":
       return "الثلاثاء";
        break;
      case "Wednesday":
       return "الأربعاء";
        break;
      case "Thursday":
       return "الخميس";
        break;
      default:
       return "الجمعة";
        break;
    }
}

String getDayNameFromString(date){
 return getDayName(DateTime.parse(date));
}

String getTime(date){
  return   DateFormat('hh:mm').format(DateTime.parse("1999-01-01 "+date));
  
}



