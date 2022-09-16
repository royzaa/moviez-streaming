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
  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) list = list.sublist(0, 4);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).padding.top,
          horizontal: 24.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            SizedBox(
              height: 30.h,
            ),
            ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Padding(
                  padding: i == 0
                      ? EdgeInsets.only(left: 24.w)
                      : const EdgeInsets.all(0),
                  child: BigMovieCard(
                    crew: list[i].crew,
                    image: NetworkImage(list[i].imageUrl),
                    rating: double.parse(list[i].rating),
                    title: list[i].title,
                  ),
                );
              },
              itemCount: list.length,
              separatorBuilder: (_, i) => SizedBox(
                height: 15.h,
              ),
            ),
            Text(
              'From Disney',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ListView.separated(
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
          ],
        ),
      ),
    );
  }
}
