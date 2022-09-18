import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/suggest_button.dart';
import '../models/movie.dart';
import '../widgets/small_movie_card.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
    required this.moviesAvailable,
  }) : super(key: key);
  final List<Movie> moviesAvailable;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ValueNotifier<String> keyword = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 270.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade100,
                  Colors.white,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top * 1.5,
              horizontal: 24.w,
            ),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                ValueListenableBuilder(
                    valueListenable: keyword,
                    builder: (context, String val, _) {
                      List<Movie> list = widget.moviesAvailable
                          .where((e) => e.title.contains(val) && val.isNotEmpty)
                          .toList();
                      return list.isEmpty
                          ? const SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Search Result',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '(${list.length})',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  clipBehavior: Clip.none,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return SmallMovieCard(
                                      crew: list[i].crew,
                                      image: NetworkImage(list[i].imageUrl),
                                      rating: double.parse(list[i].rating),
                                      title: list[i].title,
                                    );
                                  },
                                  itemCount: list.length,
                                  separatorBuilder: (_, i) => SizedBox(
                                    height: 15.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            );
                    }),
                const Center(
                  child: SuggestButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top * 1.5,
              right: 24.w,
              left: 24.w,
            ),
            child: TextField(
              onChanged: (key) {
                keyword.value = key;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 164, 164, 164),
                    width: 0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
                hintText: 'Type title',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
