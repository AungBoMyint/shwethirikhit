import 'package:video_player/video_player.dart';

Future<int> getTotalMinutes(String videoUrl) async {
  final videoPlayerController = VideoPlayerController.network(videoUrl);
  await videoPlayerController.initialize();
  final videoDuration = videoPlayerController.value.duration;
  final totalMinutes = videoDuration.inMinutes;
  videoPlayerController.dispose();
  return totalMinutes;
}

String? numberValidator({
  required String key,
  required int digit,
  required String? value,
}) {
  if (value == null || value.isEmpty) {
    return "$key is required.";
  } else if (int.tryParse(value) == false) {
    return "$key is incorrect.";
  } else if (value.length != 6) {
    return "$key must be 6 digits.";
  } else {
    return null;
  }
}
