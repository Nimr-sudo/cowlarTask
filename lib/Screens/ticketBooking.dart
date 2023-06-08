import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_na/Controllers/ticketBookingController.dart';
import 'package:movie_app_na/Screens/cinemaSeat.dart';

class TicketBooking extends StatelessWidget {
  TicketBooking({Key? key}) : super(key: key);
  var controller = Get.put(TicketBookingController());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                controller.title.value,
                style: GoogleFonts.poppins(
                    color: const Color(0xFF202C43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'In Theaters ${controller.releaseDate.value}',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF61C3F2),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
      body: LayoutBuilder(builder: (context, constraints) {
        final double maxHeight = constraints.maxHeight;
        final double maxWidth = constraints.maxWidth;
        final bool isPortrait = maxHeight > maxWidth;

        return SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.fromLTRB(10, 50, 10, 50)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Date',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF202C43),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height:
                  isPortrait ? deviceHeight * (30 / 813) : deviceHeight * 0.1,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.dates.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = i;
                      },
                      child: Obx(() {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedIndex.value == i
                                  ? Colors.blue
                                  : const Color.fromARGB(40, 166, 166, 166),
                              borderRadius: BorderRadius.circular(20)),
                          child: Obx(() {
                            return Text(
                              controller.dates[i],
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedIndex.value == i
                                      ? Colors.white
                                      : Colors.black),
                            );
                          }),
                        );
                      }),
                    );
                  }),
            ),
            SizedBox(
              height: deviceHeight * (60 / 813),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: isPortrait ? deviceHeight * (200 / 813) : deviceHeight,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.times.length,
                  itemBuilder: (_, i) {
                    return Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedCinemaIndex.value = i;
                          print('cinema ${controller.dates[i]}');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${controller.times[i]} ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF202C43),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'CineTech + Hall ${i + 1}',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF8F8F8F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Obx(() {
                              return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller
                                                  .selectedCinemaIndex.value ==
                                              i
                                          ? const Color(0xFF61C3F2)
                                          : Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  width: deviceWidth * (250 / 375),
                                  height: isPortrait
                                      ? deviceHeight * (145 / 813)
                                      : deviceHeight * 0.3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.asset(
                                      'assets/icons/cinema.png',
                                      width: isPortrait
                                          ? deviceWidth * (145 / 375)
                                          : deviceWidth * 0.5,
                                      height: deviceHeight * (113 / 813),
                                    ),
                                  ));
                            }),
                            Row(
                              children: [
                                Text(
                                  'From ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF8F8F8F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '\$ ${i * controller.regularFare + 50}',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF202C43),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  ' Or ',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF8F8F8F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '\$ ${controller.bonusFare + 500 + i * 500} Bonus',
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF202C43),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          print('select seats');
          Get.to(() => CinemaSeat(), arguments: {
            'title': controller.title.value,
            'cinemaDate': controller.dates[controller.selectedIndex.value],
            'cinemaTime': controller.times[controller.selectedCinemaIndex.value]
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: TextButton(onPressed: (){
          //   print('select seats');
          //   Get.to(() => CinemaSeat(), arguments: {
          //     'title': controller.title.value,
          //     'cinemaDate': controller.dates[controller.selectedIndex.value],
          //     'cinemaTime': controller.times[controller.selectedCinemaIndex.value]
          //   });
          // }, child: Text('OK'))
        child:  Container(
            width: double.infinity,
            height: deviceHeight > deviceWidth
                ? deviceHeight * (60 / 813)
                : deviceHeight * 0.15,
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    'assets/icons/SelectSeatsBtn.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Seats',
                    style: GoogleFonts.poppins(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
