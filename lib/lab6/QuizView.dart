import 'package:flutter/material.dart';

import './Question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = const Icon(Icons.check, color: Colors.green);
  final crossIcon = const Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Một số con mèo thực sự dị ứng với con người', true),
    Question('Bạn có thể dẫn một con bò xuống cầu thang nhưng không thể lên cầu thang.', false),
    Question('Khoảng một phần tư xương của con người nằm ở bàn chân.', true),
    Question('Máu của con ốc sên có màu xanh.', true),
    Question('Tên họ của mẹ Buzz Aldrin là "Moon".', true),
    Question('Ở Bồ Đào Nha, việc đi tiểu trong biển là bất hợp pháp.', true),
    Question('Không thể gấp một miếng giấy khô hình vuông hơn 7 lần.', false),
    Question('Ở London, nếu bạn chết trong Tòa nhà Quốc hội, bạn sẽ được quyền tổ chức lễ tang quốc gia, vì tòa nhà này được coi là một nơi thiêng liêng.', true),
    Question('Âm thanh lớn nhất được tạo ra bởi một loài động vật là 188 decibel. Loài động vật này là voi châu Phi.', false),
    Question('Tổng diện tích bề mặt của hai phổi người là khoảng 70 mét vuông.', true),
    Question('Google ban đầu được gọi là "Backrub".', true),
    Question('Sô-cô-la ảnh hưởng đến tim và hệ thần kinh của chó; vài ounce đủ để giết chết một con chó nhỏ.', true),
    Question('Ở West Virginia, nếu bạn vô tình đụng phải một con vật với xe của bạn, bạn có thể mang nó về nhà để ăn.', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: Text(
                questionsList[count].question,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Đúng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.green
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),

            SizedBox(height: 8),

            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Sai',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.red
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),

            Row(children: iconsList)
          ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      setState(() {
        iconsList.add(tickIcon);

        if (count < questionsList.length - 1) count++;
      });
    } else {
      setState(() {
        iconsList.add(crossIcon);

        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
