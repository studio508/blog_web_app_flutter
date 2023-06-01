import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//URI / URL을 생성하는데 도움을 주는 클래스
// final uri = Uri.parse('https://blog.codefactory.ai');
final uri = Uri.parse('https://blog.naver.com/lafargekorea');

//ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(uri);
// ❶ 컨트롤러 변수 생성

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ➊ 앱바 위젯 추가
        // ➋ 배경색 지정
        backgroundColor: Colors.green,
        // ➌ 앱 타이틀 설정
        title: const Text('KnuckleBaller'),
        // ➍ 가운데 정렬
        centerTitle: true,
        actions: [
          IconButton(
            // ➋ 눌렀을 때 콜백 함수 설정
            onPressed: () {
              controller.goBack();
            },

            // ➍ 홈 버튼 아이콘 설정
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          IconButton(
            // ➋ 눌렀을 때 콜백 함수 설정
            onPressed: () {
              controller.loadRequest(uri);
            },

            // ➍ 홈 버튼 아이콘 설정
            icon: const Icon(
              Icons.home,
            ),
          ),
          IconButton(
            // ➋ 눌렀을 때 콜백 함수 설정
            onPressed: () {
              controller.goForward();
            },

            // ➍ 홈 버튼 아이콘 설정
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
        // ❷ WebView 추가하기
        // initialUrl: 'https://blog.codefactory.ai',
        // javascriptMode: JavascriptMode.unrestricted,
        // onWebViewCreated: (WebViewController controller) {
        //   this.controller = controller; // ➍ 위젯에 컨트롤러 저장
        // },
      ),
    );
  }
}
