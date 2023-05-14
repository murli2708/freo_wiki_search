import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freo_wiki_search/features/search/provider/search_provider.dart';
import 'package:freo_wiki_search/features/search/provider/search_state.dart';

import '../utils/custom_card.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  TextEditingController _searchController = TextEditingController(text: "freo");
  @override
  Widget build(BuildContext context, ref) {
    final searchData = ref.watch(searchDataProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/wikiLogo.png"),
            ),
            elevation: 10.0,
            leading: const SizedBox(
              height: 50,
            ),
            backgroundColor: Colors.transparent,
            title: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(
                        color: Color.fromARGB(255, 70, 62, 92),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Freo',
                    style: TextStyle(
                        color: Color(0xFF363f93),
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1.0,
                        blurRadius: 2.0,
                        offset: const Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: TextField(
                      autocorrect: false,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF363f93)),
                      controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            ref
                                .read(searchDataProvider.notifier)
                                .getSearchResult(_searchController.text.trim());
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xFF363f93),
                            size: 30,
                          ),
                        ),
                        // hintStyle: ,
                        hintText: "Wiki Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(getWidgetList(searchData)
                  //       [

                  //   CustomCard(),

                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  //   CustomCard(),
                  // ]
                  ))
        ],
      ),
    );
  }

  List<Widget> getWidgetList(SearchState searchData) {
    if (searchData is LoadingState) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        )
      ];
    } else if (searchData is LoadedState) {
      List<Widget> widgets = [];

      for (var i = 0; i < searchData.data.query!.pages!.length; i++) {
        widgets.add(CustomCard(searchData.data.query!.pages![i]));
      }

      return widgets;
    } else if (searchData is ErrorState) {
      return [
        Center(
            child: Text(
          searchData.message,
          style: const TextStyle(
              color: Color.fromARGB(255, 70, 62, 92),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ))
      ];
    } else {
      return [
        const Center(
            child: Text(
          'Please search..',
          style: TextStyle(
              color: Color.fromARGB(255, 70, 62, 92),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ))
      ];
    }
  }
}
