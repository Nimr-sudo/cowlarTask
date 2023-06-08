import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_na/Controllers/movieDetailsController.dart';
import 'package:movie_app_na/Screens/home.dart';
import 'package:movie_app_na/Screens/player.dart';
import 'package:movie_app_na/Screens/search.dart';
import 'package:movie_app_na/Screens/ticketBooking.dart';

import '../Models/movieDetail.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({Key? key}) : super(key: key);
  var controller = Get.put(MovieDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        body: controller.genres.length == 0
            ? Center(child: CircularProgressIndicator())
            : LayoutBuilder(builder: (context, constraints) {
                final double maxHeight = constraints.maxHeight;
                final double maxWidth = constraints.maxWidth;
                final bool isPortrait = maxHeight > maxWidth;
                return SingleChildScrollView(
                    child: !isPortrait
                        ? Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: maxHeight,
                                    width: maxWidth / 2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            controller.args.picture),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                8.5),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.args.title,
                                          style: GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 207, 211, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Release date :  ${controller.args.releaseDate}',
                                          style: GoogleFonts.poppins(
                                              color: const Color.fromARGB(
                                                  255, 231, 233, 236),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 243,
                                          child: ElevatedButton(
                                            onPressed: ()  {
                                              Get.to(() => Player(), arguments: controller.nextArgs);
                                              print('watch trailer');
                                              print('watch trailer');
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.play_arrow),
                                                Text('Watch Trailer'),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 2,
                                                  color: Color(0xFF61C3F2)),
                                              primary: Colors
                                                  .transparent, // Color code #61C3F2
                                              minimumSize: Size(243,
                                                  50), // Desired dimensions
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Desired border radius
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            print('Get tickets');
                                            Get.to(() => TicketBooking(),
                                                arguments: {
                                                  'title':
                                                      controller.args.title,
                                                  'releaseDate': controller
                                                      .args.releaseDate
                                                });
                                          },
                                          child: Text('Get tickets'),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xFF61C3F2),
                                            // Color code #61C3F2
                                            minimumSize: Size(
                                                243, 50), // Desired dimensions
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20), // Desired border radius
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Genres',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF202C43),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        height: 30,
                                        width: (maxWidth / 2.5),
                                        child: SizedBox(
                                          height: 30,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  controller.genres.length <= 4
                                                      ? controller.genres.length
                                                      : 4,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 30,

                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      // Set padding for text content
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                .colors[
                                                            index], // Set background color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20), // Set border radius to create capsule shape
                                                      ),
                                                      child: Text(
                                                        controller.genres[index]
                                                            ['name'],
                                                        // Replace this with your text content
                                                        style: TextStyle(
                                                          color: Colors
                                                              .white, // Set text color
                                                          fontSize:
                                                              16, // Set text size
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 15,
                                            right: 15),
                                        child: Divider(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Overview',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF202C43),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        width: maxWidth / 2.5,
                                        child: Text(
                                          controller.args.overview,
                                          style: GoogleFonts.poppins(
                                              color: Color(0xFF8F8F8F),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: maxHeight / 2,
                                    width: isPortrait ? maxWidth : maxWidth / 2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            controller.args.picture),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 50, left: 10),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            color: Colors.white,
                                            icon: SvgPicture.asset(
                                                'assets/icons/back.svg')),
                                        Text(
                                          'Watch  ',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned.fill(
                                    top: maxHeight / 2,
                                    left: isPortrait ? 0 : maxWidth / 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                4),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.args.title,
                                          style: GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 207, 211, 219),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Releasing at :${controller.args.releaseDate}',
                                          style: GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 231, 233, 236),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 243,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              print(controller.trailerKey);
                                              Get.to(()=> Player(),
                                                  arguments:
                                                      controller.nextArgs);
                                              print('watch trailer');
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.play_arrow),
                                                Text('Watch Trailer'),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 2,
                                                  color: Color(0xFF61C3F2)),
                                              primary: Colors
                                                  .transparent, // Color code #61C3F2
                                              minimumSize: Size(243,
                                                  50), // Desired dimensions
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Desired border radius
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            print('Get tickets');
                                            Get.to(() => TicketBooking(),
                                                arguments: {
                                                  'title':
                                                      controller.args.title,
                                                  'releaseDate': controller
                                                      .args.releaseDate
                                                });
                                            // Navigator.of(context).pushNamed(
                                            //     SeatBookScreen.routeName,
                                            //     arguments: {
                                            //       'title': controller.args.title,
                                            //       'releaseDate': controller.args.releaseDate
                                            //     });
                                          },
                                          child: Text('Get tickets'),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xFF61C3F2),
                                            // Color code #61C3F2
                                            minimumSize: Size(
                                                243, 50), // Desired dimensions
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20), // Desired border radius
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Genres',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF202C43),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        height: 30,
                                        child: SizedBox(
                                          height: 30,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  controller.genres.length <= 4
                                                      ? controller.genres.length
                                                      : 4,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 30,

                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      // Set padding for text content
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                .colors[
                                                            index], // Set background color
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20), // Set border radius to create capsule shape
                                                      ),
                                                      child: Text(
                                                        controller.genres[index]
                                                            ['name'],
                                                        // Replace this with your text content
                                                        style: TextStyle(
                                                          color: Colors
                                                              .white, // Set text color
                                                          fontSize:
                                                              16, // Set text size
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 15,
                                            right: 15),
                                        child: Divider(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Overview',
                                        style: GoogleFonts.poppins(
                                            color: const Color(0xFF202C43),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        controller.args.overview,
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ],
                          ));
              }),
      );
    });
  }
}
