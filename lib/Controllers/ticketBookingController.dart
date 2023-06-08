import 'package:get/get.dart';
class TicketBookingController extends GetxController{
  var title=''.obs;
  var releaseDate=''.obs;
  var selectedIndex = 0.obs;
  var selectedCinemaIndex = 0.obs;

  var regularFare = 25;
  var bonusFare = 2000;

  final List<String> dates = [
    "9th Sep",
    "10th Sep",
    "11th Sep",
    "12th Sep",
    "13th Sep",
    "14th Sep",
    "15th Sep"
  ];
  final List<String> times = [
    "2:30 pm",
    "3:30 pm",
    "4:30 pm",
    "5:30 pm",
  ];
@override
  void onInit(){
  final args = Get.arguments as Map<String, dynamic>;
  title.value = args["title"];
  releaseDate.value=args["releaseDate"];
  print(title.value);
  print(releaseDate.value);
  super.onInit();
}
}