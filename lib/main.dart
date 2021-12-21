import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/count_view_model.dart';

void main() {
  runApp(
    //①MyAppをProviderScopeで囲む
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

//②StateleeWidgetをHookConsumerWidgetに変更
class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  //③第2引数にWidgetRef refを追加
  Widget build(BuildContext context, WidgetRef ref) {
    //④countViewModelを参照することを定義、vmでViewModelを参照する
    final vm = ref.watch(countViewModel);
    return Scaffold(
      appBar: AppBar(
        title: Text('${vm.title}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${vm.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
