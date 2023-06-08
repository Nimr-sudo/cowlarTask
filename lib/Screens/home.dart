import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_na/Screens/movieDetails.dart';
import '../Models/movieDetail.dart';
import '../Controllers/navPageController.dart';
import '../Controllers/homeController.dart';
import '../Widgets/MovieTile.dart';

class Home extends StatelessWidget {
  final _scrollController = ScrollController();
  var controller = Get.put(HomeController());
  var navigationController = Get.put(NavPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              navigationController.changeIndex(1);
            },
            icon: Icon(Icons.search),
          )
        ],
        title: Text(
          'Watch  ',
          style: GoogleFonts.poppins(
            color: Color(0xFF202C43),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                /////////
                () => ListView.builder(
                  controller: _scrollController,
                  itemCount: controller.movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.movies.length) {
                      ///////////
                      controller.fetchMovies();
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movie = controller.movies[index];
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.21,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                            onTap: () {
                              Get.to(
                                () => MovieDetails(),
                                arguments: MovieDetail(
                                  movieId: movie.id,
                                  releaseDate: movie.releaseDate,
                                  title: movie.name,
                                  overview: movie.overView,
                                  picture: movie.backDrop,
                                ),
                              );
                            },
                            child: movieTile(
                                movie.poster, movie.name, movie.releaseDate)));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
