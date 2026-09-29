import '../models/other_answer.dart';

List<OtherAnswer> buildMockOtherAnswers() {
  return [
    OtherAnswer(
      id: 'o1',
      name: '단무지향',
      username: 'Danmujiwang',
      level: 'Skilled',
      score: 93,
      question: '이 업무가 만만하다고 생각하나요? 지금까지 말한 수준으로 충분히 해낼 수 있다는 확신하는 이유는?',
      answer:
          '저는 맡은 일을 열심히 하려고 노력하는 편이고, 책임감도 있다고 생각합니다. 물론 다른 지원자분들도 잘하시겠지만 저는 주어진 일을 끝까지 해내려는 자세가 강합니다. 그래서 뽑아주신다면 기대에 맞게 성실히 하겠습니다.',
      feedback:
          '현재 답변은 전반적으로 성실함과 책임감을 강조하고 있지만, 구체적인 근거가 부족해 설득력이 약하게 보입니다.\n실제 경험이나 본인의 행동 패턴을 짧게라도 제시하면 답변의 신뢰도가 크게 높아집니다.\n업무의 난이도에 대한 인식과, 그럼에도 불구하고 해낼 수 있다는 논리적 근거가 더해지면 답변의 설득력이 강화됩니다.',
      selfReview: '성실함만 강조해서 근거가 약해 보임. 다음엔 경험 한 줄이라도 넣기.',
    ),
    OtherAnswer(
      id: 'o2',
      name: '초코용사',
      username: 'Chokoyongsa',
      level: 'Learner',
      score: 80,
      question: '방금 한 답변은 준비가 덜 된 사람도 할 수 있는 말입니다. 당신만 할 수 있는 이야기를 지금 바로 얘기해보세요.',
      answer: '당신만 잘 할 수 있는 이야기를 지금 여러 말해보세요.',
      feedback: '구체적인 사례가 조금 더 들어가면 훨씬 설득력 있는 답변이 될 것 같습니다.',
      selfReview: '조금 더 구체적으로 말했어야 했는데 아쉬움.',
    ),
    OtherAnswer(
      id: 'o3',
      name: '엄케리는곰',
      username: 'Meangtteakcurgom',
      level: 'Pro',
      score: 90,
      question: '현재 역량으로는 바로 실무 투입이 어려워 보입니다. 그럼에도 불구하고 자신 있다고 말할 근거가 무엇인가요?',
      answer: '그럼에도 불구하고 자신 있다고 말할 근거가 무엇인가요?',
      feedback: '자신감 있는 태도는 좋지만, 근거가 조금 더 명확했으면 좋겠습니다.',
      selfReview: '자신감은 있었는데 근거 제시가 약했던 것 같음.',
    ),
    OtherAnswer(
      id: 'o4',
      name: '우당탕로켓',
      username: 'Udangtangrocket',
      level: 'Skilled',
      score: 88,
      question: '이 정도 압박에도 흔들리다니, 실제 면접 스트레스는 더 강합니다. 그 상황에서도 버틸 자신이 있는 이유를 구체적으로 설명해보세요.',
      answer: '그 상황에서도 버틸 자신이 있는지를 구체적으로 설명해보세요.',
      feedback: '압박 상황을 가정한 질문에 침착하게 답변한 점이 좋습니다.',
      selfReview: '침착하게 답한 건 괜찮았지만 디테일이 부족했음.',
    ),
    OtherAnswer(
      id: 'o5',
      name: '츄릅하마',
      username: 'Chureuphama',
      level: 'Learner',
      score: 63,
      question: '지금까지의 답변으로는 우리 팀에 어떤 가치를 줄 것 같은지 궁금합니다. 당신의 없으면 안 될 이유를 한 가지로 설명해보세요.',
      answer: '팀에 기여할 수 있는 나만의 강점을 하나 정해서 설명해보세요.',
      feedback: '팀 관점에서 접근한 점이 좋습니다. 조금 더 구체적인 사례를 더하면 좋겠습니다.',
      selfReview: '팀 관점은 챙겼는데 사례가 부족했음.',
    ),
  ];
}