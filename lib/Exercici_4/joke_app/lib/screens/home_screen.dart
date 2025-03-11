import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:joke_app/providers/joke_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Acudit Aleatori")),
      body: Center(
        child: jokeProvider.isLoading
            ? CircularProgressIndicator()
            : jokeProvider.currentJoke == null
                ? Text("Prem el botó per veure un acudit!", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))
                : Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(jokeProvider.currentJoke!.setup, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        SizedBox(height: 20),
                        Text(jokeProvider.currentJoke!.punchline, style: TextStyle(fontSize: 20, color: Colors.grey[700]), textAlign: TextAlign.center),
                      ],
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: jokeProvider.fetchRandomJoke,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
