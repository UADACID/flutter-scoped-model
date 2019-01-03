import 'package:belajar_scoped_model/models/App.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<AppModel>(
        model: AppModel(),
        child: MyHomePage(title: 'Belajar Scoped Model'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Todos(),
            ),
            Expanded(child: Counter())
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => FloatingActionButton(
              onPressed: () {
                model.increment();
              },
              child: Icon(Icons.add),
            ),
      ),
    );
  }
}

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Text('Todos Model',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                    itemCount: model.todosItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (model.todosItems.length == 0) {
                        return Text(
                          'Tidak Ada Data',
                          style: TextStyle(color: Colors.white),
                        );
                      }

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            model.todosItems[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.black,
                          onPressed: () {
                            model.addTodoItem();
                          },
                          child: Text('Tambah Data',
                              style: TextStyle(color: Colors.white)),
                        ),
                        model.todosItems.length == 0
                            ? Text('')
                            : RaisedButton(
                                onPressed: () {
                                  model.clearTodoItems();
                                },
                                child: Text('Bersihkan Data'),
                              )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) => Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter Model',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Anda sudah menekan sebanyak ${model.counter} kali'),
              ],
            ),
          ),
    );
  }
}
