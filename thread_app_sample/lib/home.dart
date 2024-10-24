import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
        ),
        Image.asset(
          'assets/images/thread_logo.png',
          width: 50,
        ),
        Image.asset(
          'assets/images/more_icon.png',
          width: 50,
        ),
      ],
    );
  }

  Widget _quickFeedWriteView() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/profile_image.png',
              width: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Yujin_Chung',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff262626),
                    ),
                  ),
                  Text(
                    '새로운 소식이 있나요?',
                    style: TextStyle(color: Color(0xff9a9a9a), fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 60),
            GestureDetector(
                child: Image.asset('assets/images/photo_icon.png', width: 30)),
            SizedBox(width: 10),
            GestureDetector(
                child: Image.asset('assets/images/photo_icon.png', width: 30)),
            SizedBox(width: 10),
            GestureDetector(
                child: Image.asset('assets/images/gif_icon.png', width: 30)),
            SizedBox(width: 10),
            GestureDetector(
                child: Image.asset('assets/images/mic_icon.png', width: 30)),
            SizedBox(width: 10),
            GestureDetector(
                child: Image.asset('assets/images/align_icon.png', width: 30)),
          ],
        )
      ],
    );
  }

  @override
  Widget _singleFeed() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftProfileArea(),
        Expanded(
          child: _contentArea(),
        ),
      ],
    );
  }

  Widget _leftProfileArea() {
    return Container(
      width: 60,
      height: 400,
      color: Colors.grey,
    );
  }

  Widget _contentArea() {
    return Column(
      children: [
        Container(
          height: 30,
          color: Colors.red,
        ),
        Container(
          height: 340,
          color: Colors.blue,
        ),
        Container(
          height: 30,
          color: Colors.yellow,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _header(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _quickFeedWriteView(),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _singleFeed(),
            ),
          ],
        ),
      ),
    );
  }
}
