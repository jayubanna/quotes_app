import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class LikeQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quotesProvider = Provider.of<QuotesProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff060A13),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Like Quotes",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: quotesProvider.likedQuotes.isEmpty
          ? Center(child: Text("No liked quotes yet.",style: TextStyle(color: Colors.white),))
          : ListView.builder(
              itemCount: quotesProvider.likedQuotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "DateAdded :- ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["dateAdded"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["dateModified"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["_id"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["author"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["content"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["tags"]}\n",
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
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          "${quotesProvider.likedQuotes[index]["authorSlug"]}\n",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ])),
                                ),
                                IconButton(
                                  onPressed: () {
                                    quotesProvider.unlikeQuote(
                                        quotesProvider.likedQuotes[index] ?? {});
                                  },
                                  icon: Icon(Icons.delete, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
