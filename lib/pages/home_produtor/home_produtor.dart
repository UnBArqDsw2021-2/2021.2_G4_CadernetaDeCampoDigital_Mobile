import 'package:flutter/material.dart';

class HomeProdutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(children: const <Widget>[
          Text(
            'Olá, José',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Roboto-Bold',
            ),
          ),
          Text(
            'CPF: 55555555555',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Roboto-Regular',
            ),
          ),
          Text(
            'CPF: 55555555555',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ]),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 25,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(),
    );
  }
}
