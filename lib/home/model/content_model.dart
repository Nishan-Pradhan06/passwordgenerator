class UnBordingContent {
  String image;
  String title;
  String discription;
  UnBordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnBordingContent> contents = [
  UnBordingContent(image: 'assets/onboarding.png', title: '', discription: ''),
  UnBordingContent(image: 'assets/introscreen.png', title: '', discription: ''),
];
