import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/day_entry.dart';
import '../data/mock_days.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const itemWidth = 44.0;

  bool isPublic = true;
  late final List<DayEntry> days;
  late int selectedIndex;
  final stripController = ScrollController();
  double stripWidth = 0;

  @override
  void initState() {
    super.initState();
    days = buildMockDays();
    selectedIndex = 10; // mock 데이터 기준 중간(오늘)
  }

  @override
  void dispose() {
    stripController.dispose();
    super.dispose();
  }

  void _centerStrip(int index, {bool animate = true}) {
    if (!stripController.hasClients || stripWidth == 0) return;
    final target = (index * itemWidth) - (stripWidth / 2) + (itemWidth / 2);
    final maxScroll = stripController.position.maxScrollExtent;
    final clamped = target.clamp(0.0, maxScroll).toDouble();
    if (animate) {
      stripController.animateTo(clamped, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    } else {
      stripController.jumpTo(clamped);
    }
  }

  void _goTo(int index) {
    final next = index.clamp(0, days.length - 1);
    setState(() => selectedIndex = next);
    _centerStrip(next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _profileCard(),
            const SizedBox(height: 20),
            _weekLabel(),
            const SizedBox(height: 8),
            _dateStrip(),
            const SizedBox(height: 20),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                final v = details.primaryVelocity ?? 0;
                if (v < -200) _goTo(selectedIndex + 1);
                if (v > 200) _goTo(selectedIndex - 1);
              },
              child: _dayContent(days[selectedIndex]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: kSurface, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 18, backgroundColor: kSurfaceHigh),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('폭신멸치', style: TextStyle(color: kText, fontWeight: FontWeight.w600)),
                    Text('Poksinmyeolchi', style: TextStyle(color: kTextFaint, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: kSurfaceHigh, borderRadius: BorderRadius.circular(6)),
                child: const Text('회원정보', style: TextStyle(color: kTextDim, fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: 0.4,
              minHeight: 5,
              backgroundColor: kSurfaceHigh,
              valueColor: const AlwaysStoppedAnimation(kAccent),
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Novice', style: TextStyle(color: kTextFaint, fontSize: 11)),
              Text('다음 레벨까지 500점 남았습니다.', style: TextStyle(color: kTextFaint, fontSize: 11)),
              Text('Learner', style: TextStyle(color: kTextFaint, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weekLabel() {
    final d = days[selectedIndex].date;
    final week = ((d.day - 1) ~/ 7) + 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _goTo(selectedIndex - 7),
          child: const Icon(Icons.chevron_left, color: kTextDim, size: 18),
        ),
        const SizedBox(width: 20),
        Text('${d.month}월 $week주', style: const TextStyle(color: kText, fontWeight: FontWeight.w600)),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => _goTo(selectedIndex + 7),
          child: const Icon(Icons.chevron_right, color: kTextDim, size: 18),
        ),
      ],
    );
  }

  Widget _dateStrip() {
    return SizedBox(
      height: 56,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (stripWidth != constraints.maxWidth) {
            stripWidth = constraints.maxWidth;
            WidgetsBinding.instance.addPostFrameCallback((_) => _centerStrip(selectedIndex, animate: false));
          }
          return ListView.builder(
            controller: stripController,
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, i) {
              final entry = days[i];
              final selected = i == selectedIndex;
              return GestureDetector(
                onTap: () => _goTo(i),
                child: SizedBox(
                  width: itemWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(entry.weekday, style: const TextStyle(color: kTextFaint, fontSize: 12)),
                      const SizedBox(height: 8),
                      Container(
                        width: 26,
                        height: 26,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected ? kAccent : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${entry.date.day}',
                          style: TextStyle(color: selected ? kBg : kTextDim, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _dayContent(DayEntry entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(entry.title, style: const TextStyle(color: kText, fontSize: 15, fontWeight: FontWeight.w600)),
            ),
            Switch(
              value: isPublic,
              activeColor: kAccent,
              onChanged: (v) => setState(() => isPublic = v),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: entry.score / 100,
            minHeight: 5,
            backgroundColor: kSurfaceHigh,
            valueColor: const AlwaysStoppedAnimation(kAccent),
          ),
        ),
        const SizedBox(height: 4),
        Text('${entry.score}점', style: const TextStyle(color: kTextFaint, fontSize: 11)),
        const SizedBox(height: 16),
        Text('Q. ${entry.question}', style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
        const SizedBox(height: 10),
        Text('A. ${entry.answer}', style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
        const SizedBox(height: 16),
        const Text('AI 피드백', style: TextStyle(color: kAccent, fontSize: 13, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(entry.feedback, style: const TextStyle(color: kText, fontSize: 14, height: 1.6)),
        const SizedBox(height: 24),
        SizedBox(width: double.infinity, child: _answerInput()),
        const SizedBox(height: 12),
        _otherAnswersLink(),
      ],
    );
  }

  Widget _answerInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: kSurfaceHigh, borderRadius: BorderRadius.circular(10)),
      child: const Text('당신의 생각을 적어보세요', style: TextStyle(color: kTextFaint, fontSize: 13)),
    );
  }

  Widget _otherAnswersLink() {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('다른 답변 보기', style: TextStyle(color: kTextDim, fontSize: 13)),
          Icon(Icons.keyboard_arrow_down, color: kTextDim, size: 16),
        ],
      ),
    );
  }
}