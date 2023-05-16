import 'package:video_player/video_player.dart';

Future<int> getTotalMinutes(String videoUrl) async {
  final videoPlayerController = VideoPlayerController.network(videoUrl);
  await videoPlayerController.initialize();
  final videoDuration = videoPlayerController.value.duration;
  final totalMinutes = videoDuration.inMinutes;
  videoPlayerController.dispose();
  return totalMinutes;
}
