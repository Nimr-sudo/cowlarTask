import 'package:get/get.dart';
class Seat {
  final int id;
  final RxInt row;
  final RxInt column;

  Seat({required this.id, required this.row, required this.column});
}
