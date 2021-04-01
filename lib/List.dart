import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

String word() {
  String word = WordPair.random().asPascalCase;
  return word;
}

class WordWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WordState();
  }
}

class WordState extends State<WordWidget> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<WordPair>(); // 新增本行

  @override
  Widget build(BuildContext context) {
    var word = WordPair.random().asPascalCase;
    WordPair.random().asCamelCase;
    return Container(
      child: list(),
    );
  }

  Widget list() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();

      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); /*4*/
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // 新增本行

    return ListTile(
      title: Text(pair.asCamelCase, style: TextStyle(fontSize: 18)),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
