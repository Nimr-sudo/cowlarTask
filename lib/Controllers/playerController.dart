import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class PlayerController extends GetxController{
  late final YoutubePlayerController video_controller;
  late Map args;
  @override
  void onInit() {

    args = Get.arguments as Map<dynamic, dynamic>;
    video_controller = YoutubePlayerController(
      initialVideoId: args["trailerKey"],
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
    video_controller.dispose();
  }
}