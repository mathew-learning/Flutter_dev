import 'package:flutter/material.dart';
import 'data_base.dart';

class DisplayDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Data Page'),
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: getDATA(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final rows = snapshot.data!;
              return ListView.builder(
                itemCount: rows.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(rows[index]),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error loading data: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
