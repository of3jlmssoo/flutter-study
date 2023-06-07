import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(_MyTodoApp());
}

class _MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧画面を表示
      home: _TodoListPage(),
    );
  }
}

// リスト一覧画面用Widget
class _TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      // body: Center(
      //   child: const Text('リスト一覧画面'),
      // ),
      // body: ListView(
      //   children: const <Widget>[
      //     Text('ニンジンを買う'),
      //     Text('タマネギを買う'),
      //     Text('ジャガイモを買う'),
      //     Text('カレールーを買う'),
      //   ],
      // ),
      body: ListView(
        children: <Widget>[
          // *** 追加する部分 ***
          // CardとListTileを使い、簡単に整ったUIを作成
          Card(
            child: ListTile(
              title: Text('ニンジンを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('タマネギを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ジャガイモを買う'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('カレールーを買う'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      // body: Center(
      //   child: TextButton(
      //     // ボタンをクリックした時の処理
      //     onPressed: () {
      //       // "pop"で前の画面に戻る
      //       Navigator.of(context).pop();
      //     },
      //     child: const Text('リスト追加画面（クリックで戻る）'),
      //   ),
      // ),
      body: Container(
        // 余白を付ける
        // padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // テキスト入力
            const TextField(),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                // color: Colors.blue,

                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                // TODO ElevatedButtonの色
                child:
                    Text('リスト追加', style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: TextButton(
                // ボタンをクリックした時の処理
                onPressed: () {
                  // "pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'キャンセル',
                  style: TextStyle(
                    // fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                // TODO Textの色
              ),
            ),
          ],
        ),
      ),
    );
  }
}
