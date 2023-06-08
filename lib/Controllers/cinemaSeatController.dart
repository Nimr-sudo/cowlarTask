import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_na/Models/CinemaHall.dart';
import 'package:movie_app_na/Models/Movies.dart';

import '../Models/Seat.dart';

class CinemaSeatController extends GetxController {
  var selectedRow = -1.obs;
  var selectedCol = -1.obs;
  var rows = 24.obs;
  var columns = 10.obs;
  var selectedSeat = ''.obs;
  int regularSeatPrice = 50;
  int premiumSeatPrice = 150;
  RxList<List<int>> seatTypes =
      List.generate(24, (index) => List.filled(10, 0)).obs;
  List<Seat> seats = <Seat>[].obs;
  late CinemaHall cinemaHall;
  var title = ''.obs;
  var cinemaDate = ''.obs;
  var cinemaTime = ''.obs;
  var totalCost = 0.obs;
  @override
  void onInit() async {
    cinemaHall.getCinemaHall();
    var args = Get.arguments as Map<String, dynamic>;
    title.value = args["title"];
    cinemaDate.value = args["cinemaDate"];
    cinemaTime.value = args["cinemaTime"];
    super.onInit();
  }
}
