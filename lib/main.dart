import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bmi_page.dart';
import 'stopwatch_page.dart';
import 'todo_page1.dart';

final dummyItems = [
  'https://e-ruda.net/uploads/bbspr/2021-12-01_17-29-16_khikJG_00%EC%97%85%EB%A1%9C%EB%93%9C%EC%9A%A9.jpg',
  'https://thumb.ad.co.kr/article/54/14/34/cf/i/544975-1.jpg',
  'http://www.sisaweek.com/news/photo/202011/139003_130793_3210.jpg'
];

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deuggeundeuggeun',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FirstPage(), // 첫 페이지를 시작 페이지로 지정
      routes:{
        '/first':(context)=>FirstPage(),
        '/second':(context)=>BmiMain(),
        '/third':(context)=>StopWatchPage(),
        '/forth':(context)=>ToDoListPage1(),
      },
    );
  }
}

// 첫 페이지
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var _index = 0; // 페이지 인덱스 0, 1, 2
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // 배경을 흰색으로
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          '득근득근',
          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold), // 글자색을 빨간색으로
       ),
        centerTitle: true, // 제목을 가운데로
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _index = index; // 선택된 탭의 인덱스로 _index를 변경
            });
          },
          currentIndex: _index, // 선택된 인덱스
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '오늘 할 운동',
              icon: Icon(Icons.assignment),
            ),
            BottomNavigationBarItem(
              label: '운동 정보',
              icon: Icon(Icons.account_circle),
            ),
          ]),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(context),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
}

// 상단
Widget _buildTop(BuildContext context){
  return Padding(
    padding: const EdgeInsets.only(top:20, bottom: 20), // 위 아래 여백 크기 20
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이의 공간을 동일한 비율로 정렬
          children: [
            GestureDetector(
              onTap:() async {
                await Navigator.pushNamed(
                    context,
                    '/second'
                );
              },
              child:Column(
              children: <Widget>[
                Icon(
                  Icons.calculate_sharp,
                  size:100,
                ),
                Text('Bmi 계산하기',
                  style:TextStyle(fontSize:20,)
                ),
              ],
            ),
            ),
            GestureDetector(
              onTap:() async {
                await Navigator.pushNamed(
                    context,
                    '/third'
                );
              },
              child:Column(
                children: <Widget>[
                  Icon(
                    Icons.watch_later,
                    size:100,
                  ),
                  Text('스톱워치',
                      style:TextStyle(fontSize:20,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// 중단
Widget _buildMiddle() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 150.0,
      autoPlay: true, // 슬라이더 자동으로 넘어가는 기능
    ),
    items: dummyItems.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber
              ),
              child: ClipRRect( // child를 둥근 사각형으로 자르는 위젯
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network( // 인터넷상의 이미지
                    url,
                    fit:BoxFit.cover, // 화면에 여백 x
                  )
              )
          );
        },
      );
    }).toList(),
  );
}

// 하단
Widget _buildBottom() {
  final items = List.generate(1, (i) {
    return ListTile(
      leading:Icon(Icons.notifications_none),
      title:Text('득근득근 어플 사용법 및 공지사항'),
    );
  });
  return ListView(
    physics:NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작 금지
    shrinkWrap:true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정
    children:items,
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToDoListPage1();
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(Icons.notifications_none),
      title:Text('사이드 레터럴 레이즈'),
    );
  }
}

