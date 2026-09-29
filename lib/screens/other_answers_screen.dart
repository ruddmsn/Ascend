import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/other_answer.dart';
import '../data/mock_other_answers.dart';
import 'other_answer_detail_screen.dart';

class OtherAnswersScreen extends StatelessWidget {
  const OtherAnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final answers = buildMockOtherAnswers();

    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios_new, color: kText, size: 18),
                ),
                const SizedBox(width: 14),
                const Text('다른 답변 보기', style: TextStyle(color: kText, fontSize: 17, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 24),
            for (final a in answers) ...[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => OtherAnswerDetailScreen(answer: a)),
                  );
                },
                child: _listItem(a),
              ),
              const SizedBox(height: 28),
            ],
          ],
        ),
      ),
    );
  }

  Widget _listItem(OtherAnswer a) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 16, backgroundColor: kSurfaceHigh),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(a.name, style: const TextStyle(color: kText, fontSize: 13, fontWeight: FontWeight.w600)),
                Text(a.username, style: const TextStyle(color: kTextFaint, fontSize: 11)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: a.score / 100,
            minHeight: 4,
            backgroundColor: kSurfaceHigh,
            valueColor: const AlwaysStoppedAnimation(kAccent),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text('${a.score}점', style: const TextStyle(color: kTextFaint, fontSize: 11)),
        ),
        const SizedBox(height: 8),
        Text('Q. ${a.question}', style: const TextStyle(color: kTextDim, fontSize: 12, height: 1.4)),
      ],
    );
  }
}