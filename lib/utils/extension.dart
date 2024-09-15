import 'package:intl/intl.dart';

extension StringExtension on String {
 
  String toIDR({required num amount}) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(amount);
  }
}