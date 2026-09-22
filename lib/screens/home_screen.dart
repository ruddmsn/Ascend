import 'package:flutter/material.dart';
import '../theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPublic = true;

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
            _weekCalendar(),
            const SizedBox(height: 24),
            _questionCard(),
            const SizedBox(height: 16),
            _answerInput(),
            const SizedBox(height: 12),
            _otherAnswersLink(),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(12),
      ),
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
                    Text(
                      '폭신멸치',
                      style: TextStyle(
                        color: kText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Poksinmyeolchi',
                      style: TextStyle(color: kTextFaint, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: kSurfaceHigh,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  '회원정보',
                  style: TextStyle(color: kTextDim, fontSize: 11),
                ),
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
              Text(
                '다음 레벨까지 500점 남았습니다.',
                style: TextStyle(color: kTextFaint, fontSize: 11),
              ),
              Text(
                'Learner',
                style: TextStyle(color: kTextFaint, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weekCalendar() {
    final days = ['토', '일', '월', '화', '수', '목', '금'];
    final dates = [29, 30, 1, 2, 3, 4, 5];
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chevron_left, color: kTextDim, size: 18),
            SizedBox(width: 20),
            Text(
              '12월 1주',
              style: TextStyle(color: kText, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 20),
            Icon(Icons.chevron_right, color: kTextDim, size: 18),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (i) {
            final selected = dates[i] == 3;
            return Column(
              children: [
                Text(
                  days[i],
                  style: const TextStyle(color: kTextFaint, fontSize: 12),
                ),
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
                    '${dates[i]}',
                    style: TextStyle(
                      color: selected ? kBg : kTextDim,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _questionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                '지금은 연습이니까, 틀려도 괜찮아요.',
                style: TextStyle(
                  color: kText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
            value: 0.7,
            minHeight: 5,
            backgroundColor: kSurfaceHigh,
            valueColor: const AlwaysStoppedAnimation(kAccent),
          ),
        ),
        const SizedBox(height: 4),
        const Text('70점', style: TextStyle(color: kTextFaint, fontSize: 11)),
        const SizedBox(height: 16),
        const Text(
          'Q. 지금 대답으로는 다른 지원자랑 차이가 없습니다. 당신만의 강점을 하나로 압축해서 말해보세요.',
          style: TextStyle(color: kTextDim, fontSize: 13, height: 1.6),
        ),
        const SizedBox(height: 10),
        const Text(
          'A. 저는 맡은 일을 열심히 하려고 노력하는 편이고, 책임감도 있다고 생각합니다. 물론 다른 지원자분들도 잘하시겠지만 저는 주어진 일을 끝까지 해내려는 자세가 강합니다. 그래서 뽑아주신다면 기대에 맞게 성실히 하겠습니다.',
          style: TextStyle(color: kTextDim, fontSize: 13, height: 1.6),
        ),
        const SizedBox(height: 16),
        const Text(
          'AI 피드백',
          style: TextStyle(
            color: kAccent,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '현재 답변은 구체성이 부족해 설득력이 약해 보입니다. "열심히 하겠다"와 같은 표현만으로는 차별점을 보여주기 어렵기 때문에, 본인의 경험이나 실제 사례를 짧게라도 제시하면 답변의 신뢰도가 높아집니다.\n\n또한 자신의 강점이 무엇인지 명확하게 드러나지 않아 다른 지원자와 어떤 점에서 차별화되는지 파악하기 어렵습니다. 꼼꼼함, 빠른 습득력처럼 구체적인 역량을 제시하면 좋습니다.\n\n더불어 회사와 지원 직무에 대한 이해를 기반으로 "왜 이 회사에 적합한 인재인지"를 설명하는 부분이 필요합니다.\n\n마지막으로 전체적인 톤에서 자신감이 조금 부족하게 느껴집니다. "할 수 있다고 생각합니다"보다는 "할 수 있습니다" 같은 확신 있는 표현을 사용하면 답변의 임팩트가 훨씬 강화됩니다.',
          style: TextStyle(color: kTextFaint, fontSize: 13, height: 1.6),
        ),
      ],
    );
  }

  Widget _answerInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: kSurfaceHigh,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        '당신의 생각을 적어보세요',
        style: TextStyle(color: kTextFaint, fontSize: 13),
      ),
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
