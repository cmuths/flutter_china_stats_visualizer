import 'package:intl/intl.dart';

class NumberHelper{

    static List<String> splitIntegerAndDecimal(String number){
        number ??= "0.0";
        try {
            NumberFormat format = NumberFormat("#,###.##");
            double doubleValue = double.parse(number);
            return format.format(doubleValue).split(".");
        }catch(e){
            return ['0','0'];
        }

    }

}