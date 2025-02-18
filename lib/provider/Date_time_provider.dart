import 'package:flutter_riverpod/flutter_riverpod.dart';

final DateProvider=StateProvider<String>((ref) {
  return 'dd/mm/yy';


});
final TimeProvider=StateProvider<String>((ref) {
  return 'hh:mm';


});