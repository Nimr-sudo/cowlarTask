import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_app_na/Controllers/cinemaSeatController.dart';

class CinemaSeat extends StatefulWidget {
  const CinemaSeat({Key? key}) : super(key: key);

  @override
  State<CinemaSeat> createState() => _CinemaSeatState();
}

class _CinemaSeatState extends State<CinemaSeat> {
  var controller = Get.put(CinemaSeatController());
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
                color: Color(0xFF202C43),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${controller.cinemaDate} | ${controller.cinemaTime}',
              style: GoogleFonts.poppins(
                color: Color(0xFF61C3F2),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: InteractiveViewer(
        child: LayoutBuilder(builder: (context, constraints) {
          final double maxHeight = constraints.maxHeight;
          final double maxWidth = constraints.maxWidth;
          final bool isPortrait = maxHeight > maxWidth;
          return !isPortrait
              ? Container(
                  height: isPortrait ? deviceHeight * 0.6 : deviceHeight * 0.8,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: deviceHeight * (50 / 813),
                          ),
                          Container(
                              child:
                                  SvgPicture.asset('assets/icons/screen.svg')),
                          Container(
                              alignment: Alignment.center,
                              child: Text('SCREEN')),
                          SizedBox(
                            height: deviceHeight * (50 / 813),
                          ),
                          Center(
                            child: Container(
                              width: isPortrait
                                  ? deviceWidth * (330 / 375)
                                  : deviceWidth / 2.5,
                              height: deviceHeight * (200 / 813),
                              child: Transform.scale(
                                scale: 1.0,
                                child: GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 24,
                                  children: List.generate(
                                    controller.rows.value *
                                            controller.columns.value -
                                        1,
                                    (index) => Container(
                                      height: 1,
                                      width: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (index == 0 ||
                                                index == 1 ||
                                                index == 2 ||
                                                index == 21 ||
                                                index == 22 ||
                                                index == 23 ||
                                                index == 24 ||
                                                index == 48 ||
                                                index == 72 ||
                                                index == 47 ||
                                                index == 71 ||
                                                index == 95 ||
                                                index == 5 ||
                                                index == 29 ||
                                                index == 53 ||
                                                index == 77 ||
                                                index == 101 ||
                                                index == 25 ||
                                                index == 149 ||
                                                index == 173 ||
                                                index == 197 ||
                                                index == 221 ||
                                                index == 5 + 13 ||
                                                index == 29 + 13 ||
                                                index == 53 + 13 ||
                                                index == 77 + 13 ||
                                                index == 101 + 13 ||
                                                index == 25 + 13 ||
                                                index == 149 + 13 ||
                                                index == 173 + 13 ||
                                                index == 197 + 13 ||
                                                index == 221 + 13) {
                                              return;
                                            }
                                            int selectedSeatR =
                                                (index / 24).ceil();
                                            int selectedSeatC = index % 24;
                                            controller.selectedSeat.value =
                                                '$selectedSeatR / $selectedSeatC';
                                            print(index);
                                            int row = (index /
                                                    controller.columns.value)
                                                .floor();
                                            int col = index %
                                                controller.columns.value;
                                            if (controller.seatTypes[row]
                                                    [col] ==
                                                0) {
                                              if (index > 215 && index < 240) {
                                                controller.seatTypes[row][col] =
                                                    2;
                                                controller.totalCost.value +=
                                                    controller.premiumSeatPrice;
                                              } else {
                                                controller.seatTypes[row][col] =
                                                    1;
                                                controller.totalCost +=
                                                    controller.regularSeatPrice;
                                              }
                                              // Update the selected row and column
                                              controller.selectedRow = row;
                                              controller.selectedCol = col;
                                            } else {
                                              if (controller.seatTypes[row]
                                                      [col] ==
                                                  2) {
                                                controller.totalCost -=
                                                    controller.premiumSeatPrice;
                                              } else {
                                                controller.totalCost -=
                                                    controller.regularSeatPrice;
                                              }
                                              controller.seatTypes[row][col] =
                                                  0;
                                              controller.selectedRow = -1;
                                              controller.selectedCol = -1;
                                            }
                                            if (controller.selectedRow != -1 &&
                                                controller.selectedCol != -1) {
                                              index = controller.selectedRow *
                                                      controller.columns.value +
                                                  controller.selectedCol;
                                            }
                                          });
                                        },
                                        child: SizedBox(
                                          child: (index == 0 ||
                                                  index == 1 ||
                                                  index == 2 ||
                                                  index == 21 ||
                                                  index == 22 ||
                                                  index == 23 ||
                                                  index == 24 ||
                                                  index == 48 ||
                                                  index == 72 ||
                                                  index == 47 ||
                                                  index == 71 ||
                                                  index == 95 ||
                                                  index == 5 ||
                                                  index == 29 ||
                                                  index == 53 ||
                                                  index == 77 ||
                                                  index == 101 ||
                                                  index == 25 ||
                                                  index == 149 ||
                                                  index == 173 ||
                                                  index == 197 ||
                                                  index == 221 ||
                                                  index == 5 + 13 ||
                                                  index == 29 + 13 ||
                                                  index == 53 + 13 ||
                                                  index == 77 + 13 ||
                                                  index == 101 + 13 ||
                                                  index == 149 + 13 ||
                                                  index == 173 + 13 ||
                                                  index == 197 + 13 ||
                                                  index == 221 + 13 ||
                                                  index == 125 + 13 ||
                                                  index == 125)
                                              ? Container(
                                                  color: Colors.white,
                                                )
                                              : SvgPicture.asset(
                                                  controller.seatTypes[index ~/
                                                                  controller
                                                                      .columns
                                                                      .value][
                                                              index %
                                                                  controller
                                                                      .columns
                                                                      .value] ==
                                                          0
                                                      ? index > 215 &&
                                                              index < 240
                                                          ? 'assets/icons/premium.svg'
                                                          : 'assets/icons/regular.svg'
                                                      : 'assets/icons/selected_seat.svg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: isPortrait
                              ? deviceHeight * (250 / 813)
                              : deviceHeight * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/selected_seat.svg'),
                                    Text('  Selected     '),
                                    SizedBox(
                                      width: deviceWidth * (20 / 375),
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/notavail.svg'),
                                    Text('  Not Available'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/premium.svg'),
                                    Text('  Vip ( 150\$ )'),
                                    SizedBox(
                                      width: deviceWidth * (20 / 375),
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/regular.svg'),
                                    Text('  Regular ( 50\$ )'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * (10 / 813),
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: isPortrait
                                          ? deviceWidth * (97 / 375)
                                          : deviceWidth * 0.1,
                                      height: isPortrait
                                          ? deviceHeight * (30 / 813)
                                          : deviceHeight * 0.05,
                                      // color: Color.fromARGB(65, 166, 166, 166),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              controller.selectedSeat.value)),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: isPortrait
                                          ? deviceWidth * (108 / 375)
                                          : deviceWidth * 0.2,
                                      height: isPortrait
                                          ? deviceHeight * (50 / 813)
                                          : deviceHeight * 0.1,
                                      //   color: Color.fromARGB(65, 166, 166, 166),
                                      child: Center(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: deviceHeight * 0.05,
                                                  ),
                                                  Text('   Total Amount:'),
                                                  Text(
                                                      '\$${controller.totalCost.value}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      )),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: deviceHeight * (10 / 813),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: deviceWidth * (200 / 375),
                                    height: isPortrait
                                        ? deviceHeight * (65 / 813)
                                        : deviceHeight * 0.12,
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
                                            'Proceed to Pay',
                                            style: GoogleFonts.poppins(
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * (50 / 813),
                    ),
                    SvgPicture.asset('assets/icons/screen.svg'),
                    Container(
                        alignment: Alignment.center, child: Text('SCREEN')),
                    SizedBox(
                      height: deviceHeight * (50 / 813),
                    ),
                    Center(
                      child: Container(
                        width: deviceWidth * (330 / 375),
                        height: deviceHeight * (200 / 813),
                        child: Transform.scale(
                          scale: 1.0,
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 24,
                            children: List.generate(
                              controller.rows.value * controller.columns.value,
                              (index) => Container(
                                height: 1,
                                width: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (index == 0 ||
                                          index == 1 ||
                                          index == 2 ||
                                          index == 21 ||
                                          index == 22 ||
                                          index == 23 ||
                                          index == 24 ||
                                          index == 48 ||
                                          index == 72 ||
                                          index == 47 ||
                                          index == 71 ||
                                          index == 95 ||
                                          index == 5 ||
                                          index == 29 ||
                                          index == 53 ||
                                          index == 77 ||
                                          index == 101 ||
                                          index == 25 ||
                                          index == 149 ||
                                          index == 173 ||
                                          index == 197 ||
                                          index == 221 ||
                                          index == 5 + 13 ||
                                          index == 29 + 13 ||
                                          index == 53 + 13 ||
                                          index == 77 + 13 ||
                                          index == 101 + 13 ||
                                          index == 25 + 13 ||
                                          index == 149 + 13 ||
                                          index == 173 + 13 ||
                                          index == 197 + 13 ||
                                          index == 221 + 13) {
                                        return;
                                      }
                                      int selectedSeatR = (index / 24).ceil();
                                      int selectedSeatC = index % 24;
                                      controller.selectedSeat.value =
                                          '$selectedSeatR / $selectedSeatC';
                                      print(index);
                                      int row =
                                          (index / controller.columns.value)
                                              .floor();
                                      int col =
                                          index % controller.columns.value;
                                      if (controller.seatTypes[row][col] == 0) {
                                        if (index > 215 && index < 240) {
                                          controller.seatTypes[row][col] = 2;
                                          controller.totalCost +=
                                              controller.premiumSeatPrice;
                                        } else {
                                          controller.seatTypes[row][col] = 1;
                                          controller.totalCost +=
                                              controller.regularSeatPrice;
                                        }
                                        // Update the selected row and column
                                        controller.selectedRow = row;
                                        controller.selectedCol = col;
                                      } else {
                                        if (controller.seatTypes[row][col] ==
                                            2) {
                                          controller.totalCost -=
                                              controller.premiumSeatPrice;
                                        } else {
                                          controller.totalCost -=
                                              controller.regularSeatPrice;
                                        }
                                        controller.seatTypes[row][col] = 0;
                                        controller.selectedRow = -1;
                                        controller.selectedCol = -1;
                                      }
                                      if (controller.selectedRow != -1 &&
                                          controller.selectedCol != -1) {
                                        index = controller.selectedRow *
                                                controller.columns.value +
                                            controller.selectedCol;
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    child: (index == 0 ||
                                            index == 1 ||
                                            index == 2 ||
                                            index == 21 ||
                                            index == 22 ||
                                            index == 23 ||
                                            index == 24 ||
                                            index == 48 ||
                                            index == 72 ||
                                            index == 47 ||
                                            index == 71 ||
                                            index == 95 ||
                                            index == 5 ||
                                            index == 29 ||
                                            index == 53 ||
                                            index == 77 ||
                                            index == 101 ||
                                            index == 25 ||
                                            index == 149 ||
                                            index == 173 ||
                                            index == 197 ||
                                            index == 221 ||
                                            index == 5 + 13 ||
                                            index == 29 + 13 ||
                                            index == 53 + 13 ||
                                            index == 77 + 13 ||
                                            index == 101 + 13 ||
                                            index == 149 + 13 ||
                                            index == 173 + 13 ||
                                            index == 197 + 13 ||
                                            index == 221 + 13 ||
                                            index == 125 + 13 ||
                                            index == 125)
                                        ? Container(
                                            color: Colors.white,
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: SvgPicture.asset(
                                              controller.seatTypes[index ~/
                                                          controller.columns
                                                              .value][index %
                                                          controller
                                                              .columns.value] ==
                                                      0
                                                  ? index > 215 && index < 240
                                                      ? 'assets/icons/premium.svg'
                                                      : 'assets/icons/regular.svg'
                                                  : 'assets/icons/selected_seat.svg',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
      bottomNavigationBar: deviceHeight > deviceWidth
          ? BottomAppBar(
              child: Container(
                padding: EdgeInsets.all(10),
                height: deviceHeight * (250 / 813),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/selected_seat.svg'),
                          Text('  Selected     '),
                          SizedBox(
                            width: deviceWidth * (20 / 375),
                          ),
                          SvgPicture.asset('assets/icons/notavail.svg'),
                          Text('  Not Available'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/premium.svg'),
                          Text('  Vip ( 150\$ )'),
                          SizedBox(
                            width: deviceWidth * (20 / 375),
                          ),
                          SvgPicture.asset('assets/icons/regular.svg'),
                          Text('  Regular ( 50\$ )'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * (10 / 813),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: deviceWidth * (97 / 375),
                        height: deviceHeight * (30 / 813),
                        color: Color.fromARGB(65, 166, 166, 166),
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(controller.selectedSeat.value)),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * (10 / 813),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: deviceWidth * (108 / 375),
                            height: deviceHeight * (50 / 813),
                            color: Color.fromARGB(65, 166, 166, 166),
                            child: Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: deviceHeight * (5 / 813),
                                      ),
                                      Text('Total Amount'),
                                      Text('\$${controller.totalCost}',
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('done');
                          },
                          child: Container(
                            width: deviceWidth * (200 / 375),
                            height: deviceHeight * (65 / 813),
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
                                    'Proceed to Pay',
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
                      ],
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

enum SeatType {
  regular,
  premium,
}

class Seat {
  SeatType type;
  bool isSelected;

  Seat({required this.type, required this.isSelected});
}
