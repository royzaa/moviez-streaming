import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './search.dart';
import '../widgets/big_movie_card.dart';
import '../widgets/small_movie_card.dart';
import '../models/movie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> list = [];
  List<Movie> listBig = [];

  @override
  void initState() {
    Movie.getData(Type.popular).then((valueBig) {
      Movie.getData(Type.top250).then((value) {
        setState(() {
          listBig = valueBig;
          list = value;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) list = list.sublist(0, 9);
    if (list.isNotEmpty) listBig = listBig.reversed.toList().sublist(0, 4);

    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top * 1.5,
              horizontal: 24.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Moviez',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Watch much easier',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Search(moviesAvailable: list),
                          ),
                        ),
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 250.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return BigMovieCard(
                        crew: listBig[i].crew,
                        image: NetworkImage(listBig[i].imageUrl),
                        rating: double.parse(listBig[i].rating),
                        title: listBig[i].title,
                      );
                    },
                    itemCount: listBig.length,
                    separatorBuilder: (_, i) => SizedBox(
                      width: 20.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  'From Disney',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
