import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User? user;
    final quotesProvider = Provider.of<QuotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "Quotes App",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "LikeQuotes_page");
              },
              icon: Icon(
                Icons.save_alt,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: const Color(0xff060A13),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: get(Uri.parse(
                  "https://api.quotable.io/quotes?page=${quotesProvider.ipage}")),
              builder: (context, snapshot) {
                Response? res = snapshot.data;
                if (res != null) {
                  Map<String, dynamic> apiData = jsonDecode(res.body ?? "");
                  user = User.fromJson(apiData);
                  print(user);
                  return ListView.builder(
                    itemCount: user?.results?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xff060A13),
                                  title: SelectableText("' ${user?.results?[index]["content"]}",style: TextStyle(color: Colors.white),),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text: "DateAdded :- ",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["dateAdded"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "dateModified :- ",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["dateModified"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "ID :- ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["_id"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "Author :- ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["author"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "Content :- ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["content"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "Tags :- ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["tags"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              TextSpan(
                                                  text: "AuthorSlug :- ",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text:
                                                    "${user?.results?[index]["authorSlug"]}\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ])),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                quotesProvider.addToLikedQuotes(
                                                    user?.results?[index] ??
                                                        {});
                                                Navigator.pushNamed(
                                                    context, "LikeQuotes_page");
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: quotesProvider.ipage > 1
                    ? quotesProvider.previousPage
                    : null,
                icon: quotesProvider.ipage > 1
                    ? Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )
                    : SizedBox(),
              ),
              Text(
                "${quotesProvider.ipage}",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: quotesProvider.nextPage,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
