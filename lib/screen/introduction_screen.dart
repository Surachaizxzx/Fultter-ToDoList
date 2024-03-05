import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signin_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Space zoo',
      body:
          'บางครั้งที่เราหลงลืมไปว่าสิ่งสวยงามของเมืองไทย ใกล้ๆ ตัว ยังมีหลากหลายแห่งที่สวยงามและน่าชมด้วยความแปลกใหม่ในแต่ละช่วงเวลาเรากำลังพูดถึงการท่องเที่ยว “สวนสัตว์” ที่เคยเป็นประสบการณ์อันน่าตื่นเต้นในวัยเด็ก แต่เมื่อเติบโต เรามักลืมไปว่ายังมีให้เราได้เข้าไปเที่ยวชม พักผ่อนหย่อนใจ ',
      footer: SizedBox(
        height: 50,
        width: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
          ),
          onPressed: () {},
          child: const Text("มาเที่ยวด้วยกัน?"),
        ),
      ),
      image: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('asset/images/1.jpg'),
          radius: 50.0,
        ),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      )),
    ),
    PageViewModel(
      title: 'Space zoo is number one of the word',
      body:
          ' เจ้าตัวนี้มีอยู่ครอบครัวเดียวเท่านั้นในประเทศไทย จากแอฟริกาตัวคล้ายหนู มีชื่อว่า ไฮแรกซ์ ชื่อไทยว่า กระต่ายหิน แรดอินเดียสัตว์ตัวใหญ่ยักษ์ มีหนังหนาคล้ายเสื้อเกาะของนักรบ แต่น่าอัศจรรย์วิ่งเร็วไม่แพ้ใคร แต่น่าแปลกใจที่มีปลาฉลามมาว่ายอยู่บนดอยสูง สถานแสดงพันธุ์สัตว์น้ำสวนสัตว์เชียงใหม่ผ่านสายทางเดินรอบอุโมงค์ ใต้น้ำถึง 133 เมตร ยาวที่สุดในโลก และสัมผัสอากาศหนาวเหน็บ ติดลบ 7 องศาเซลเซียส ที่สโนเวย์',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 20,
          ),
          onPressed: () {},
          child: const Text("รออะไร?"),
        ),
      ),
      image: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('asset/images/3.jpg'),
          radius: 50.0,
        ),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      )),
    ),
    PageViewModel(
      title: 'WE NEED YOU',
      body:
          'จะได้พบกับสวนสัตว์ที่มีภูมิประเทศซึ่งติดกับเชิงเขาที่ร่มรื่น พบกับทูตสันถวไมตรี ช่วงช่วง กับ หลินฮุ้ย แพนด้าคู่ขวัญผู้พลิกสถานการณ์ท่องเทียวไทยให้บรรเจิดและโด่งดัง เป็นพลุแตก เมื่อให้กำเนิดหลินปิง ทูตแพนด้าน้อยที่ครองใจคนไทยทั้งประเทศ สัตว์ที่มีรูปร่างน่ารักเหมือนตุ๊กตาโคอาล่า สัตว์มหัศจรรย์ที่ไม่ชอบกินน้ำ',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("พบกับความสนุก"),
        ),
      ),
      image: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('asset/images/2.jpg'),
          radius: 50.0,
        ),
      ),
      decoration: const PageDecoration(
          titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      )),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(83, 51, 157, 173),
      appBar: AppBar(
        title: const Text('Space Zoo is no.1'),
        backgroundColor: const Color.fromARGB(128, 64, 110, 147),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(102, 0, 0, 0),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          globalBackgroundColor: const Color.fromARGB(95, 97, 188, 198),
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Color.fromARGB(126, 2, 2, 2),
            activeSize: Size.square(20),
            activeColor: Color.fromARGB(255, 2, 91, 126),
          ),
          showDoneButton: true,
          done: const Text(
            'จิ้มเลย',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }
}
