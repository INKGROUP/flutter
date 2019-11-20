import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';



class RandomWordsListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont =
      const TextStyle(fontSize: 14.0, color: Colors.red);

  Widget _buildSuggestiongs() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alredySaved = _saved.contains(pair);
    return new ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage:
              NetworkImage('https://pic.jianlc.com/common/jianlc.ico'),
        ),
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alredySaved ? Icons.favorite : Icons.favorite_border,
          color: alredySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alredySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: AppBar(
        title: Text('Startup Nanme Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestiongs(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
            return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
            ));
          });
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided,),
          );
        },
      ),
    );
  }
}


