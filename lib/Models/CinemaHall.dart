import 'package:get/get.dart';

import '../Controllers/cinemaSeatController.dart';
import 'Seat.dart';

class CinemaHall {
   int rows;
   int columns;
  final List<Seat> seats;
  List<Seat> getCinemaHall() {
    int id = 0;
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        Seat temp = Seat(id: id, row: i.obs, column: j.obs);
        seats.add(temp);
        id++;
      }
    }
    return seats;
  }

  CinemaHall({this.rows = 10, this.columns = 24, seats})
      : seats = (seats ?? <Seat>[]);
}
