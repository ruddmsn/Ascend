class DayEntry {
  final DateTime date;
  final String weekday;
  final String title;
  final String question;
  final String answer;
  final String feedback;
  final int score;

  DayEntry({
    required this.date,
    required this.weekday,
    required this.title,
    required this.question,
    required this.answer,
    required this.feedback,
    required this.score,
  });
}