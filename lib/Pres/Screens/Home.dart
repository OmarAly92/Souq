import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc/Category Screen Cubit/category_screen_cubit.dart';
import '../../Bloc/Product Screen Cubit/product_screen_cubit.dart';
import '../../Repos/ApiConnect.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/routes.dart';
import 'Category.dart';
import 'Product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffedecf2),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.redAccent.shade700, Colors.orange.shade700],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
            ),
          ),
          elevation: 10,
          titleSpacing: 20,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Souq",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                  child: Text(
                "Categories",
                style: TextStyle(color: Colors.black),
              )),
              Tab(
                child: Text(
                  "Products",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.orange.shade500,
                    Colors.redAccent.shade700
                  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                ),
                accountName: const Text(
                  "omar",
                  style: TextStyle(fontSize: 20),
                ),
                accountEmail: const Text("omar@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    profileImg,
                    fit: BoxFit.cover,
                  ),
                  // backgroundImage: ,
                ),
              ),
              ListTile(
                title: const Text("About"),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: const Text("Contact us"),
                  onTap: () {},
                ),
              ),
              ListTile(
                title: const Text("Logout"),
                onTap: () async {
                  final SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setString("email", "");
                  Navigator.pushReplacementNamed(context, login);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => CategoryScreenCubit(DioCategory()),
              child: const Categories(),
            ),
            BlocProvider(
              create: (context) => ProductScreenCubit(GetRequest()),
              child: const Product(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Games",
    "Shoes",
    "Iphone 13",
    "Curved Monitor",
    "jeans",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var games in searchTerms) {
      if (games.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(games);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var games in searchTerms) {
      if (games.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(games);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
