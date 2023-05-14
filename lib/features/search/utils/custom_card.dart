import 'package:flutter/material.dart';
import 'package:freo_wiki_search/core/custom_endpoint.dart';
import 'package:freo_wiki_search/features/search/data/models/search_model.dart';

import '../../details/view/detail_page.dart';

class CustomCard extends StatelessWidget {
  ResultQueryPages? data;
  CustomCard(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => WebViewClass(
                title: data!.title ?? "Deatils",
                url: Endpoint.getDetaildEndpoint(
                    pageId: data!.pageid.toString()),
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            ));
      },
      child: SizedBox(
        height: 230,
        child: Stack(
          children: [
            Positioned(
              top: 35,
              left: width * .05,
              child: Material(
                child: Container(
                  height: 180,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(-10, 10),
                            blurRadius: 20,
                            spreadRadius: 4.0)
                      ]),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 30,
              child: Card(
                elevation: 40,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(data?.thumbnail?.source ??
                              'https://upload.wikimedia.org/wikipedia/commons/6/61/Wikipedia-logo-transparent.png'))),
                ),
              ),
            ),
            Positioned(
                top: 55,
                left: 200,
                child: Container(
                  height: 150,
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.title ?? 'Name',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF363f93)),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Text(
                        data?.terms?.description.toString() ?? 'Manager',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
