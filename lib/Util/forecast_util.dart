
import 'package:intl/intl.dart';

class Util{
  static String AppId="ed60fcfbd110ee65c7150605ea8aceea";

  static String getFormattedDate(DateTime dateTime){
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

}