import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_na/Models/movieDetail.dart';
import 'package:movie_app_na/Controllers/searchController.dart';
import 'package:movie_app_na/Screens/movieDetails.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(children: [
              SizedBox(
                height: 65,
              ),
              Obx(
                () {
                  return controller.searchQuery.value == ''
                      ? Expanded(
                          child: GridView.count(
                            crossAxisCount: 2, // number of cards per row
                            children: List.generate(
                              controller.categories.length,
                              (index) {
                                return Container(
                                  height: MediaQuery.of(context).size.height *
                                      (101 / 820),
                                  width: MediaQuery.of(context).size.width *
                                      (164 / 377),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    ///////////
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.searchController.text =
                                            controller.categories[index]
                                                ['name'];
                                        final String query =
                                            controller.searchController.text;
                                        controller.updateSearchQuery(query);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(15),
                                              ),
                                              child: Image.asset(
                                                controller.categories[index]
                                                    ['image'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    (8 / 813)),
                                            child: Text(
                                              controller.categories[index]
                                                  ['name'],
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            /////
                            itemCount: controller.searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              final dynamic movie =
                                  controller.searchResults[index];
                              // list of maps , map is being stored in movie
                              return InkWell(
                                onTap: () {
                                  print('ontp card');
                                  if (movie['title'] == null ||
                                      movie['title'] == '') {
                                    movie['title'] = '';
                                  }

                                  if (movie['release_date'] == null ||
                                      movie['release_date'] == '') {
                                    movie['release_date'] = '';
                                  }
                                  var arguments = MovieDetail(
                                    movieId: movie['id'].toString(),
                                    releaseDate: movie['release_date'],
                                    title: movie['title'],
                                    overview: movie['overview'],
                                    picture: movie['backdrop_path'],
                                  );
                                  Get.to(
                                    ()=>MovieDetails(),
                                    arguments: arguments,
                                  );
                                },
                                child: ListTile(
                                  title: Text(movie['title']),
                                  subtitle: Text(movie['release_date']),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      color: Colors.black,
                                      height: 100,
                                      width: 130,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w185/${movie['poster_path']}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                },
              )
            ]),
            Padding(
              padding: EdgeInsets.only(
                right: 10,
                left: 10,
                // top: MediaQuery.of(context).size.height * (2 / 814),
                // bottom: MediaQuery.of(context).size.height * (10.1 / 814),
              ),
              child: TextField(
                onChanged: (query) async {
                  await controller.updateSearchQuery(query);
                  print('kkkkkkkkkkkkkk');
                },
                controller: controller.searchController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: 'Enter a movie name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      final String query =
                          controller.searchController.text.trim();
                      controller.updateSearchQuery(query);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//     : Expanded(
//   child: Obx(() {
//     return ListView.builder(
//       itemCount: controller.searchResults.length,
//       itemBuilder: (BuildContext context, int index) {
//         final dynamic movie =
//         controller.searchResults[index];
//         return InkWell(
//           onTap: () {
//             print('ontp card');
//             if (movie['title'] == null ||
//                 movie['title'] == '') {
//               movie['title'] = '';
//             }
//
//             if (movie['release_date'] == null ||
//                 movie['release_date'] == '') {
//               movie['release_date'] = '';
//             }
//             var arguments = MovieDetailArguments(
//                 movieId: movie['id'].toString(),
//                 releaseDate: movie['release_date'],
//                 title: movie['title'],
//                 overview: movie['overview'],
//                 picture: movie['backdrop_path']);
//             Get.toNamed(
//               '/movieDetails',
//               arguments: arguments,
//             );
//           },
//           child: ListTile(
//             title: Text(movie['title']),
//             subtitle: Text(movie['release_date']),
//             leading: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Container(
//                 color: Colors.black,
//                 height: 100,
//                 width: 130,
//                 child: Image.network(
//                   'https://image.tmdb.org/t/p/w185/${movie['poster_path']}',
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }),
// ),
// SizedBox(
//   height: 65,
// )
