import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app_na/Screens/home.dart';

import 'package:movie_app_na/Screens/search.dart';
import '../Controllers/navPageController.dart';

final screens = [Home(), Search(), Scaffold(), Scaffold()];

class NavPage extends StatelessWidget {
  NavPage({Key? key}) : super(key: key);
  @override
  var controller = Get.put(NavPageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Obx(
              () =>
              /////INDEX
              IndexedStack(
                index: controller.selectedIndex.value,
                children: screens,
              ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            color: Color(0xFF2E2739),
            child: Obx(() {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                //update  index
                onTap: controller.changeIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.grey,

                backgroundColor: Color(0xFF2E2739),
                //backgroundColor: Colors.grey,

                items: [
                  BottomNavigationBarItem(
                    icon: Obx(() {
                      return Container(
                        alignment: Alignment.center,
                        //padding: EdgeInsets.only(left: 50),
                        child: controller.selectedIndex.value == 0
                            ? SvgPicture.asset(
                          'assets/icons/homeicon.svg',
                          color: Colors.white,
                        )
                            : SvgPicture.asset('assets/icons/homeicon.svg'),
                      );
                    }),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 1
                        ? SvgPicture.asset(
                      'assets/icons/Watch.svg',
                    )
                        : SvgPicture.asset(
                      'assets/icons/Watch.svg',
                      color: Colors.grey,
                    ),
                    label: 'Watch',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 2
                        ? SvgPicture.asset(
                      'assets/icons/media.svg',
                      color: Colors.white,
                    )
                        : SvgPicture.asset('assets/icons/media.svg'),
                    label: 'Media Library',
                    // backgroundColor: Colors.blue,
                  ),
                  BottomNavigationBarItem(
                    icon: controller.selectedIndex.value == 3
                        ? SvgPicture.asset('assets/icons/Vector.svg')
                        : SvgPicture.asset(
                      'assets/icons/Vector.svg',
                      color: Colors.grey,
                    ),
                    label: 'More',
                  ),
                ],
              );
            }),
          ),
        ),
      ]),
    );
  }
}
