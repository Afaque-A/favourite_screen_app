import 'package:favourite_screen_app/provider/favourite_provider.dart';
import 'package:favourite_screen_app/screen/myfavourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectItem = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(child: Text('Favourite Screen')),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyfavouriteScreen()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('item' + index.toString()),
                      trailing: Icon(value.selectItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
