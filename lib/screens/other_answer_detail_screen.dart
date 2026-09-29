import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/other_answer.dart';

class OtherAnswerDetailScreen extends StatelessWidget {
  final OtherAnswer answer;
  const OtherAnswerDetailScreen({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios_new, color: kText, size: 18),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 18, backgroundColor: kSurfaceHigh),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(answer.name, style: const TextStyle(color: kText, fontWeight: FontWeight.w600)),
                    Text(answer.username, style: const TextStyle(color: kTextFaint, fontSize: 11)),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: answer.levelProgress,
                          minHeight: 5,
                          backgroundColor: kSurfaceHigh,
                          valueColor: const AlwaysStoppedAnimation(kAccent),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(answer.level, style: const TextStyle(color: kTextFaint, fontSize: 11)),
                          Text(answer.nextLevel, style: const TextStyle(color: kTextFaint, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(answer.message, style: const TextStyle(color: kText, fontSize: 15, fontWeight: FontWeight.w600, height: 1.5)),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: answer.score / 100,
                minHeight: 5,
                backgroundColor: kSurfaceHigh,
                valueColor: const AlwaysStoppedAnimation(kAccent),
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${answer.score}점', style: const TextStyle(color: kTextFaint, fontSize: 11)),
            ),
            const SizedBox(height: 20),
            Text('Q. ${answer.question}', style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
            const SizedBox(height: 10),
            Text('A. ${answer.answer}', style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
            const SizedBox(height: 20),
            const Text('AI 피드백', style: TextStyle(color: kAccent, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(answer.feedback, style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
            const SizedBox(height: 20),
            const Text('자기평가', style: TextStyle(color: kAccent, fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(answer.selfReview, style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
          ],
        ),
      ),
    );
  }
}