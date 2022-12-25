
import 'dart:convert';

import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import '../app_manager/app_color.dart';
import '../app_manager/custom_show_case.dart';
import '../app_manager/responsive.dart';
import '../app_manager/text_theme.dart';
import '../app_manager/typography.dart';
import '../app_manager/user_dart.dart';
import '../app_manager/widgets/text_field/primary_text_field.dart';
import '../app_manager/widgets/text_field/primary_text_field_util.dart';
import '../controller/homescreen_controller.dart';





class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
        autoPlay: false,
        disableAnimation: true,
        builder: Builder(builder: (context) => const HomeScreenTab()));
  }
}



class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  PageController page = PageController();

  final HomeScreenController _homePageController = Get.put(HomeScreenController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late bool isDrawerBeingShown;

  BuildContext? myContext;

  @override
  void initState() {

    isDrawerBeingShown = false;
    _showDrawer(context);
    // print(_homePageController.getData());
    print('_homePageController.getData()');

    print(UserData().demoData["formName"]);

    super.initState();
  }

  // void showCase(){
  //   displayShowCase() async {
  //     final prefs = await SharedPreferences.getInstance();
  //     bool? showcaseVisibility = prefs.getBool("displayShowCase");
  //
  //     if (showcaseVisibility == null) {
  //       prefs.setBool("displayShowCase", false);
  //       return true;
  //     }
  //     return false;
  //   }
  //
  //   displayShowCase().then((status) {
  //     if (status) {
  //       ShowCaseWidget.of(myContext!).startShowCase([
  //         _homePageController.one,
  //         _homePageController.two,
  //         _homePageController.three,
  //         _homePageController.four,
  //       ]);
  //     }
  //   });
  // }

  void _showDrawer(BuildContext context) async {
    if (!isDrawerBeingShown) {
      _scaffoldKey.currentState?.openDrawer();
      setState(() => isDrawerBeingShown = true);
    }
  }

  @override
  void dispose() {
    page.dispose();
    Get.delete<HomeScreenController>();
    // TODO: implement initState
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ShowCaseWidget(
      builder: Builder(builder: (context){
        myContext = context;
        return GetBuilder(
            init: HomeScreenController(),
            builder: (_) { return  Scaffold(
              backgroundColor: backgroundGrayColor,
              bottomNavigationBar: Responsive.isMobile(context)
                  ? SizedBox(
                height: 50,
                child: Row(
                  children: [
                    navigationBottom('assets/icons/house.svg', 'Home', 0, 'assets/icons/househigh.svg',),
                    CustomShowCase(
                        globalKeys: _homePageController.four,
                        title: "Learn more about design sprints from here.",
                        description: "",
                        child: navigationBottom('assets/icons/Bulb.svg', 'Learn', 1, 'assets/icons/Bulb_copy.svg',)),
                    navigationBottom('assets/icons/user.svg', 'Profile', 2, 'assets/icons/usehigh.svg'),
                    // navigationBottom('assets/icons/ICO Sprints Outlined.svg', 'My Sprints',3,'assets/icons/ICO Sprints Filled.svg',),
                  ],
                ),
              )
                  : const SizedBox(),
              body: Responsive.isMobile(context)
                  ?  IndexedStack(
                index: _homePageController.getCurrentIndex,
                children: const [
                  HomeTab(),
                  // LearningTab(),
                  // ProfileTab(),
                ],
              )
                  : Row(
                children: [
                  /// LEFT PANEL DRAWER SIDE
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? Drawer(
                    // width: 300,
                      width: Responsive.isTablet(context)
                          ? size.width * 0.2
                          : size.width * 0.15,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                'assets/logos/LOGO-Dezy-It-V2.svg'),
                            verticalSpace(height: 40),
                            navigationBottom('assets/icons/house.svg', 'Home', 0, 'assets/icons/househigh.svg',),
                            verticalSpace(height: 10),
                            navigationBottom('assets/icons/Bulb.svg', 'Orders', 1, 'assets/icons/Bulb_copy.svg',),
                            verticalSpace(height: 10),
                            navigationBottom('assets/icons/user.svg', 'Tasks', 2, 'assets/icons/usehigh.svg'),
                            verticalSpace(height: 10),
                            // navigationBottom('assets/icons/ICO Sprints Outlined.svg', 'My Sprints',3,'assets/icons/ICO Sprints Filled.svg',),
                          ],
                        ),
                      ))
                      : const SizedBox(),

                  /// CENTER PANEL AREA SIDE
                  Expanded(
                    child: IndexedStack(
                      index: _homePageController.getCurrentIndex,
                      children:const [
                        HomeTab(),
                        // LearningTab(),
                        // ProfileTab(),
                        // const MySprint(),
                      ],
                    ),
                  ),
                ],
              ),
            ); }
        );
      }),
    );
  }

  /// MOBILE BOTTOM NAVIGATION BAR
  MaterialButton navigationBottom(
      String unSelected, String label, int index, String selected) {
    // return GestureDetector(
    //   behavior: HitTestBehavior.opaque,
    //   onTap: () {
    //     setState(() {
    //       currentIndex = index;
    //     });
    //   },
    //   child: Container(
    //       height: 60,
    //       width: MediaQuery.of(context).size.width / 3,
    //       decoration: index == currentIndex
    //           ? BoxDecoration(
    //               border: Border(
    //                   bottom: BorderSide(width: 4, color: Color(0xff603BE5))),
    //             )
    //           : BoxDecoration(),
    //       child: Center(
    //         child: Column(
    //           children: [
    //             SvgPicture.asset(
    //               index == currentIndex ? selected : unSelected,
    //               height: 30,
    //               width: 20,
    //             ),
    //             Text(label,
    //                 style: GoogleFonts.lexendDeca(
    //                   textStyle: TextStyle(
    //                       fontSize: 11,
    //                       fontWeight: FontWeight.w500,
    //                       color: index == currentIndex
    //                           ? Color(0xff603BE5)
    //                           : Colors.grey),
    //                 ))
    //           ],
    //         ),
    //       )),
    // );
    Size size = MediaQuery.of(context).size;

    return MaterialButton(
      height: 60,
      minWidth: Responsive.isMobile(context) ? size.width / 3 : size.width,
      hoverColor: fadedPurpleAccent,
      shape: RoundedRectangleBorder(
        borderRadius: Responsive.isMobile(context)
            ? const BorderRadius.all(Radius.circular(0))
            : const BorderRadius.all(Radius.circular(44.0)),
      ),
      onPressed: () {
        _homePageController.updateCurrentIndex = index;

        // _homePageController.update();

        print(_homePageController.getCurrentIndex);
      },
      color: index == _homePageController.getCurrentIndex ? fadedPurpleAccent : Colors.white,
      elevation: 0,
      child: Center(
        child: Responsive.isMobile(context)
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              index == _homePageController.getCurrentIndex ? selected : unSelected,
              width: 20,
            ),
            Text(label,
                style: GoogleFonts.lexendDeca(
                  textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: index == _homePageController.getCurrentIndex
                          ? purpleAccent
                          : Colors.grey),
                ))
          ],
        )
            : Row(
          children: [
            horizontalSpace(width: 20),
            SvgPicture.asset(
              index == _homePageController.getCurrentIndex ? selected : unSelected,
              width: 20,
            ),
            horizontalSpace(width: 20),
            Text(label,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: index == _homePageController.getCurrentIndex
                        ? purpleAccent
                        : Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  LeftPanel({
    Key? key,
    // required this.page,
  }) : super(key: key);

  // final PageController page;

  final HomeScreenController _homePageController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GetBuilder(
        init: HomeScreenController(), builder: (_) {
        return SideMenu(
          controller: _homePageController.page,
          style: SideMenuStyle(
            openSideMenuWidth: 200,
            showTooltip: false,
            itemBorderRadius: BorderRadius.circular(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: fadedPurpleAccent,
            selectedColor: fadedPurpleAccent,
            selectedTitleTextStyle: TextStyle(color: purpleAccent),
            selectedIconColor: purpleAccent,
          ),
          title: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset('assets/logos/LOGO-Dezy-It-V2.svg')),
          ),
          footer: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Mascot Footwear',
              style: black30016,
            ),
          ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Home',
              onTap: () {
                _homePageController.page.jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              // icon:  ImageIcon(AssetImage('assets/icons/ICO Home.png')),
              // icon: ImageIcon(SvgPicture.asset('assets/icons/ICO-Home.svg')),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              tooltipContent: "This is a tooltip for Dashboard item",
            ),
            SideMenuItem(
              priority: 1,
              title: 'Learn',
              onTap: () {
                _homePageController.page.jumpToPage(1);
              },
              icon: const Icon(Icons.tv),
            ),
            SideMenuItem(
              priority: 2,
              title: 'Profile',
              onTap: () {
                _homePageController.page.jumpToPage(2);
              },
              icon: const Icon(Icons.person),
              trailing: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  )),
            ),
          ],
        );
      },
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});



  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final HomeScreenController _homePageController = Get.put(HomeScreenController());







  @override
  Widget build(BuildContext context) {

    Map data = UserData().demoData;

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      // width: size.width / 2,
      child: SingleChildScrollView(
        child: Container(
          color: backgroundGrayColor,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP BAR APPBAR APP BAR
                Container(
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: purpleAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                      bottom: 0, left: 24, right: 0, top: 24),
                  // height: 200,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mascot Footwear',
                              style: Responsive.isDesktop(context)
                                  ? white50036
                                  : white50032),
                          verticalSpace(height: 20),
                          Row(
                            children: [
                              CustomShowCase(
                                  title: "",
                                  description: "",
                                  globalKeys: _homePageController.one,
                                  child: InkWell(
                                    // onTap: () {
                                    //   _homePageController.sendSprintCreate();
                                    //   AlertToast.show('Sprints Are Coming Soon');
                                    //   // createSprintDialog(context);
                                    // },
                                    child: SvgPicture.asset(
                                        'assets/buttons/BTN Create Sprint.svg'),
                                  )),

                              horizontalSpace(width: 18),
                              GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/buttons/BTN Start Learning.svg'),
                                onTap: (){
                                  _homePageController.updateCurrentIndex=1;
                                },
                              ),
                            ],
                          ),
                          verticalSpace(height: 24)
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Responsive.isDesktop(context) ||
                            Responsive.isTablet(context)
                            ? SvgPicture.asset(
                            'assets/banners/BANNER-Home-Screen.svg')
                            : const SizedBox(),
                      ),
                    ],

                  ),
                ),
                verticalSpace(height: 20),
                Text(data['formName'],style: MyTextTheme.largeBCB,),
                verticalSpace(height: 20),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.greenAccent),
                            color: AppColor.backgroundWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: List.generate(data['filledByInfos'].length, (index) => Row(
                                mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(data['filledByInfos'][index]["display"]["tooltip"]),
                                    ],
                                  ),
                                  horizontalSpace(width: 20),
                                  SizedBox(
                                    width: 250,
                                    child: getWidgetType(data['filledByInfos'][index]),
                                    // PrimaryTextField(
                                    //   hintText: data['filledByInfos'][index]["display"]["placeHolder"],
                                    // ),
                                  ),
                                  horizontalSpace(width: 20)
                                ],
                              ))

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.greenAccent,width: 1),
                              color: AppColor.backgroundWhite,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:  [
                            const Icon(Icons.people_alt_outlined),
                            Text('Profile',style: MyTextTheme.mediumBCB,),
                          ],
                        ),
                      ),
                    )),

                  ],
                ),
                verticalSpace(height: 20),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.greenAccent),
                            color: AppColor.backgroundWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: List.generate((data['pages'][0]['inputWidgets'][0]['questions']+data['pages'][0]['inputWidgets'][1]['questions']).length, (index) => Row(
                                mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                        Text((data['pages'][0]['inputWidgets'][0]['questions']+data['pages'][0]['inputWidgets'][1]['questions'])[index]['display']['label']),
                                    ],
                                  ),
                                  horizontalSpace(width: 20),
                                  SizedBox(
                                    width: 250,
                                    // child: Text('index: $index'),
                                    // child: Text(data['pages'][0]['inputWidgets'][0]['questions'][index]['display']['label']),
                                    child: getWidgetType((data['pages'][0]['inputWidgets'][0]['questions']+data['pages'][0]['inputWidgets'][1]['questions'])[index]),
                                    // PrimaryTextField(
                                    //   hintText: data['filledByInfos'][index]["display"]["placeHolder"],
                                    // ),
                                  ),
                                  horizontalSpace(width: 20)
                                ],
                              ))

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.greenAccent,width: 1),
                            color: AppColor.backgroundWhite,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children:  [
                                const Icon(Icons.school_outlined),
                                Text('Academic',style: MyTextTheme.mediumBCB,),
                              ],
                            ),
                          ),
                        )),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List listToSearch = [
    'India',
    'Pakistan',
    'Bangladesh',
    'China',
    'Nepal',
    'SriLanka',
  ];
  var selected;
  String? gender = "female";

  getWidgetType(data){

    String inputType = data["display"]["inputType"];

    switch(inputType){
      case "TEXT":{
        return PrimaryTextField(
          borderColor: Colors.grey,
          backgroundColor:Colors.transparent,
          hintText: data["display"]["placeHolder"],
        );
      }
      case "SINGLE_SELECT_CHECKBOX":{
        return Row(
          children: [
            Text('Freshman',style: MyTextTheme.mediumBCN,),
            Radio(
              value: 'female',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                 gender=value;
                });
              },
            ),
            horizontalSpace(width: 20),
            Text('Transfer',style: MyTextTheme.mediumBCN,),
            Radio(
              value: 'male',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          ],
        );
      }
      case "AUTO_COMPLETE":{
        return
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:   const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
                  borderSide: BorderSide(
                      color: PrimaryTextFieldUtil.borderColor,
                      width: 1
                  ),
                ),
                // labelText: "Menu mode",
                hintText: data["display"]["placeHolder"],
              ),
            ),
            onChanged: print,
          );
      }
      case "DROPDOWN":{
        return
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              // showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:  const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
                  borderSide: BorderSide(
                      color: PrimaryTextFieldUtil.borderColor,
                      width: 1
                  ),
                ),
                // labelText: "Menu mode",
                hintText: data["display"]["placeHolder"],
              ),
            ),
            onChanged: print,
            // selectedItem: "Brazil",
          );
      }
      case "NUMBER":{
        return PrimaryTextField(
          borderColor: Colors.grey,
          keyboardType: TextInputType.number,
          backgroundColor:Colors.transparent,
          hintText: data["display"]["placeHolder"],
        );
      }
      default : {
        PrimaryTextField(
          hintText: data["display"]["placeHolder"],
        );
      }
    }


}
}
///profile tab
// class ProfileTab extends StatefulWidget {
//   const ProfileTab({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfileTab> createState() => _ProfileTabState();
// }
//
// class _ProfileTabState extends State<ProfileTab> {
//   final HomePageController _homePageController = Get.put(HomePageController());
//
//   @override
//   void initState() {
//     _homePageController.getData();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     Get.delete<HomePageController>();
//
//     super.dispose();
//     // TODO: implement initState
//   }
//
//   updateProfile() {
//     _homePageController.updateProfile(context);
//   }
//
//   updatePassword() {
//     _homePageController.updatePassword(context);
//   }
//
//   bool editable = false;
//
//   @override
//   Widget build(BuildContext context) {
//     String fullName = _homePageController.nameC.value.text;
//     var splitName = fullName.split(' ');
//     String firstName = splitName[0];
//     String lastName = splitName[1];
//     Size size = MediaQuery.of(context).size;
//
//     ///desktop responsive
//     return Container(
//       padding: const EdgeInsets.all(24),
//       color: backgroundGrayColor,
//       child: GetBuilder(
//         init: HomePageController(),
//         builder: (_) {
//           return Form(
//             key: _homePageController.formKey.value,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'My Profile',
//                       style: black40024,
//                     ),
//                     const Spacer(),
//                     IconButton(
//
//                         onPressed: () {},
//                         icon: const Icon(
//                             Icons.notifications_active_outlined)),
//                     horizontalSpace(width: 10),
//                     MaterialButton(
//                         onPressed: () {
//                           // Get.to(ProfileTab());
//                           // page.jumpToPage(0);
//                         },
//                         child: SvgPicture.asset(
//                             'assets/icons/ICO Profile.svg')),
//                   ],
//                 ),
//                 verticalSpace(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   width: size.width,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Basic Settings',
//                         style: purpleAccent40018,
//                       ),
//                       const Divider(),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 /// PROFILE AVATAR
//                                 Column(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: purpleAccent,
//                                       radius: 45,
//                                       child: Text(
//                                         // firstName[0] + lastName[0],
//                                         'no',
//                                         style: white50032,
//                                       ),
//                                     ),
//                                     verticalSpace(height: 10),
//                                   ],
//                                 ),
//                                 horizontalSpace(width: 40),
//                                 /// PROFILE DATA
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Text(
//                                             'Name',
//                                             style: grey40014,
//                                           ),
//                                           const Spacer(),
//                                           /// LOG OUT BUTTON
//                                           CustomInkWell(
//                                             // minWidth: 100.0,
//                                             color: Colors.white,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: Row(
//                                                 children: [
//                                                   SvgPicture.asset(
//                                                       'assets/icons/ICO Edit Profile Icon.svg'),
//                                                   const Text('Edit'),
//                                                 ],
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               print(editable);
//                                               setState(() {
//                                                 editable = !editable;
//                                               });
//                                               print(editable);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       verticalSpace(height: Responsive.isDesktop(context) ? 8 : 0),
//                                       TextFormField(
//                                         validator: (val) {
//                                           if (val!.isEmpty) {
//                                             return 'Enter Name';
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         enabled: editable,
//                                         controller:
//                                         _homePageController.nameC.value,
//                                         decoration: InputDecoration(
//                                           border: editable
//                                               ? null
//                                               : InputBorder.none,
//                                         ),
//                                       ),
//                                       verticalSpace(height: 24),
//                                       Text(
//                                         'Email',
//                                         style: grey40014,
//                                       ),
//                                       verticalSpace(height: 8),
//                                       TextFormField(
//                                         validator: (val) {
//                                           if (val!.isEmpty) {
//                                             return 'Enter email';
//                                           } else if (!GetUtils.isEmail(val)) {
//                                             return 'Enter valid email';
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         enabled: false,
//                                         controller:
//                                         _homePageController.emailC.value,
//                                         decoration: const InputDecoration(
//                                           border:InputBorder.none,
//                                         ),
//                                       ),
//
//                                       Responsive.isDesktop(context) ?
//                                       Column(
//                                         children: [
//                                           verticalSpace(height: 24),
//                                           /// CHANGE PASSWORD
//                                           const Divider(),
//                                           Row(
//                                             children: [
//                                               Text('Password', style: black40016,),
//                                               const Spacer(),
//                                               CustomInkWell(
//                                                 onTap: () {
//                                                   CustomAlertDialogue().openAlertBox(
//
//                                                       context: context,
//                                                       headLine: Row(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             'Change Password',
//                                                             style: GoogleFonts
//                                                                 .lexend(
//                                                                 textStyle:
//                                                                 TextStyle(
//                                                                   color:
//                                                                   AppColor.black,
//                                                                   fontSize: 24,
//                                                                   fontWeight:
//                                                                   FontWeight.w600,
//                                                                 )),
//                                                           ),
//                                                           CustomInkWell(
//                                                               onTap: () {
//                                                                 Get.back();
//                                                               },
//                                                               child: const Icon(
//                                                                 Icons
//                                                                     .close_outlined,
//                                                                 size: 18,
//                                                               ))
//                                                         ],
//                                                       ),
//                                                       body: Form(
//                                                         key: _homePageController
//                                                             .formKeyChangePass
//                                                             .value,
//                                                         autovalidateMode:
//                                                         AutovalidateMode
//                                                             .onUserInteraction,
//                                                         child: Padding(
//                                                           padding:
//                                                           const EdgeInsets
//                                                               .all(20.0),
//                                                           child: Column(
//                                                             children: [
//                                                               TextFormField(
//                                                                 controller:
//                                                                 _homePageController
//                                                                     .oldPC
//                                                                     .value,
//                                                                 validator: (val) {
//                                                                   if (val!
//                                                                       .isEmpty) {
//                                                                     return 'required *';
//                                                                   } else {
//                                                                     return null;
//                                                                   }
//                                                                 },
//                                                                 style: black40016,
//                                                                 //enabled: editable,
//                                                                 decoration:
//                                                                 InputDecoration(
//                                                                   labelText:
//                                                                   'Old Password',
//                                                                   border:
//                                                                   OutlineInputBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                         15.0),
//                                                                     //borderSide: BorderSide.none,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(
//                                                                 height: 20,
//                                                               ),
//                                                               TextFormField(
//                                                                 controller:
//                                                                 _homePageController
//                                                                     .newPC
//                                                                     .value,
//                                                                 validator: (val) {
//                                                                   if (val!
//                                                                       .isEmpty) {
//                                                                     return 'required *';
//                                                                   } else if (_homePageController
//                                                                       .oldPC
//                                                                       .value
//                                                                       .text ==
//                                                                       _homePageController
//                                                                           .newPC
//                                                                           .value
//                                                                           .text) {
//                                                                     return 'Passwords can\'t be same';
//                                                                   } else {
//                                                                     return null;
//                                                                   }
//                                                                 },
//                                                                 style: black40016,
//                                                                 //enabled: editable,
//                                                                 decoration:
//                                                                 InputDecoration(
//                                                                   labelText:
//                                                                   'New Password',
//                                                                   border:
//                                                                   OutlineInputBorder(
//                                                                     borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                         15.0),
//                                                                     //borderSide: BorderSide.none,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(
//                                                                 height: 20,
//                                                               ),
//                                                               PrimaryButton(
//                                                                   onPressed: () {
//                                                                     if (_homePageController
//                                                                         .formKeyChangePass
//                                                                         .value
//                                                                         .currentState!
//                                                                         .validate()) {
//                                                                       updatePassword();
//                                                                     }
//                                                                   },
//                                                                   title: 'Save')
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ));
//                                                 },
//                                                 child: Text(
//                                                   'Change',
//                                                   style: grey40014,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const Divider(),
//                                           verticalSpace(height: 24),
//                                           /// LOG OUT BUTTON
//                                           Row(
//                                             children: [
//                                               CustomInkWell(
//                                                 onTap: () {
//                                                   AlertDialogue2().show(
//                                                       context,
//                                                       'Log Out',
//                                                       'Are you sure you want to log out?',
//                                                       firstButtonName: 'No',
//                                                       secondButtonName: 'Yes',
//                                                       showOkButton: false,
//                                                       firstButtonPressEvent: () {
//                                                         Get.back();
//                                                       }, secondButtonPressEvent: () {
//                                                     _homePageController
//                                                         .logout(context);
//                                                   });
//                                                 },
//                                                 child: Text(
//                                                   'Log Out',
//                                                   style: red40016,
//                                                 ),
//                                               ),
//                                               const Spacer(),
//                                               editable ? TextButton(
//                                                 onPressed: () {
//                                                   setState(() {
//                                                     editable = false;
//                                                   });
//                                                   if (_homePageController
//                                                       .formKey.value.currentState!
//                                                       .validate()) {
//                                                     updateProfile();
//                                                   }
//                                                 },
//                                                 child: Text(
//                                                   'Save',
//                                                   style: red40016,
//                                                 ),
//                                               ) : const SizedBox(),
//                                             ],
//                                           ),
//                                         ],
//                                       )
//                                           : const SizedBox(),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             /// CHANGE PASSWORD MOBILE RESPONSIVE
//                             Responsive.isMobile(context) ?
//                             Column(
//                               children: [
//                                 verticalSpace(height: 24),
//                                 /// CHANGE PASSWORD
//                                 const Divider(),
//                                 Row(
//                                   children: [
//                                     Text('Password', style: black40016,),
//                                     const Spacer(),
//                                     CustomInkWell(
//                                       onTap: () {
//                                         CustomAlertDialogue().openAlertBox(
//
//                                             context: context,
//                                             headLine: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   'Change Password',
//                                                   style: GoogleFonts
//                                                       .lexend(
//                                                       textStyle:
//                                                       TextStyle(
//                                                         color:
//                                                         AppColor.black,
//                                                         fontSize: 24,
//                                                         fontWeight:
//                                                         FontWeight.w600,
//                                                       )),
//                                                 ),
//                                                 CustomInkWell(
//                                                     onTap: () {
//                                                       Get.back();
//                                                     },
//                                                     child: const Icon(
//                                                       Icons
//                                                           .close_outlined,
//                                                       size: 18,
//                                                     ))
//                                               ],
//                                             ),
//                                             body: Form(
//                                               key: _homePageController
//                                                   .formKeyChangePass
//                                                   .value,
//                                               autovalidateMode:
//                                               AutovalidateMode
//                                                   .onUserInteraction,
//                                               child: Padding(
//                                                 padding:
//                                                 const EdgeInsets
//                                                     .all(20.0),
//                                                 child: Column(
//                                                   children: [
//                                                     TextFormField(
//                                                       controller:
//                                                       _homePageController
//                                                           .oldPC
//                                                           .value,
//                                                       validator: (val) {
//                                                         if (val!
//                                                             .isEmpty) {
//                                                           return 'required *';
//                                                         } else {
//                                                           return null;
//                                                         }
//                                                       },
//                                                       style: black40016,
//                                                       //enabled: editable,
//                                                       decoration:
//                                                       InputDecoration(
//                                                         labelText:
//                                                         'Old Password',
//                                                         border:
//                                                         OutlineInputBorder(
//                                                           borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                               15.0),
//                                                           //borderSide: BorderSide.none,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 20,
//                                                     ),
//                                                     TextFormField(
//                                                       controller:
//                                                       _homePageController
//                                                           .newPC
//                                                           .value,
//                                                       validator: (val) {
//                                                         if (val!
//                                                             .isEmpty) {
//                                                           return 'required *';
//                                                         } else if (_homePageController
//                                                             .oldPC
//                                                             .value
//                                                             .text ==
//                                                             _homePageController
//                                                                 .newPC
//                                                                 .value
//                                                                 .text) {
//                                                           return 'Passwords can\'t be same';
//                                                         } else {
//                                                           return null;
//                                                         }
//                                                       },
//                                                       style: black40016,
//                                                       //enabled: editable,
//                                                       decoration:
//                                                       InputDecoration(
//                                                         labelText:
//                                                         'New Password',
//                                                         border:
//                                                         OutlineInputBorder(
//                                                           borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                               15.0),
//                                                           //borderSide: BorderSide.none,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 20,
//                                                     ),
//                                                     PrimaryButton(
//                                                         onPressed: () {
//                                                           if (_homePageController
//                                                               .formKeyChangePass
//                                                               .value
//                                                               .currentState!
//                                                               .validate()) {
//                                                             updatePassword();
//                                                           }
//                                                         },
//                                                         title: 'Save')
//                                                   ],
//                                                 ),
//                                               ),
//                                             ));
//                                       },
//                                       child: Text(
//                                         'Change',
//                                         style: grey40014,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const Divider(),
//                                 verticalSpace(height: 24),
//                                 /// LOG OUT BUTTON
//                                 Row(
//                                   children: [
//                                     CustomInkWell(
//                                       onTap: () {
//                                         AlertDialogue2().show(
//                                             context,
//                                             'Log Out',
//                                             'Are you sure you want to log out?',
//                                             firstButtonName: 'No',
//                                             secondButtonName: 'Yes',
//                                             showOkButton: false,
//                                             firstButtonPressEvent: () {
//                                               Get.back();
//                                             }, secondButtonPressEvent: () {
//                                           _homePageController
//                                               .logout(context);
//                                         });
//                                       },
//                                       child: Text(
//                                         'Log Out',
//                                         style: red40016,
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     editable ? TextButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           editable = false;
//                                         });
//                                         if (_homePageController
//                                             .formKey.value.currentState!
//                                             .validate()) {
//                                           updateProfile();
//                                         }
//                                       },
//                                       child: Text(
//                                         'Save',
//                                         style: red40016,
//                                       ),
//                                     ) : const SizedBox(),
//                                   ],
//                                 ),
//                               ],
//                             )
//                                 : const SizedBox(),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   editDialog(BuildContext context) {
//     Widget edit = Form(
//       key: _homePageController.formKey.value,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 30),
//         child: Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 verticalSpace(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Text(
//                     'Name',
//                     style: grey40014,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 30,
//                   ),
//                   child: TextFormField(
//                     controller: _homePageController.nameC.value,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'Enter the name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: black40016,
//                     //enabled: editable,
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         //borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 verticalSpace(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Text(
//                     'Email',
//                     style: grey40014,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: TextFormField(
//                     controller: _homePageController.emailC.value,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'Enter the name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: black40016,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 verticalSpace(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Text(
//                     'Company',
//                     style: grey40014,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: TextFormField(
//                     controller: _homePageController.companyC.value,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'Enter the name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: black40016,
//                     decoration: InputDecoration(
//                       labelText: 'Company',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                     //enabled: editable
//                   ),
//                 ),
//                 verticalSpace(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Text(
//                     'Industry',
//                     style: grey40014,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: TextFormField(
//                     controller: _homePageController.industryC.value,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'Enter the name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: black40016,
//                     decoration: InputDecoration(
//                       labelText: 'Industry',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 verticalSpace(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 15,
//                   ),
//                   child: Text(
//                     'Role',
//                     style: grey40014,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30),
//                   child: TextFormField(
//                     controller: _homePageController.roleC.value,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return 'Enter the name';
//                       } else {
//                         return null;
//                       }
//                     },
//                     style: black40016,
//                     decoration: InputDecoration(
//                       labelText: 'Role',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 verticalSpace(height: 15),
//                 PrimaryButton(
//                   onPressed: () {
//                     updateProfile();
//                   },
//                   title: 'Save',
//                 ),
//               ],
//             ),
//             /// EDIT BUTTON - CHANGE PROFILE INFORMATION
//             MaterialButton(
//               shape: const RoundedRectangleBorder(
//                 // side: BorderSide(color: purpleAccent),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(8.0),
//                 ),
//               ),
//               elevation: 0,
//               // minWidth: 100.0,
//               color: Colors.white,
//               hoverColor: fadedPurpleAccent,
//               splashColor: fadedPurpleAccent,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                         'assets/icons/ICO Edit Profile Icon.svg'),
//                     const Text('Edit'),
//                   ],
//                 ),
//               ),
//               onPressed: () {
//                 print(editable);
//                 setState(() {
//                   editable = !editable;
//                 });
//                 print(editable);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//     AlertDialog alert = AlertDialog(
//       backgroundColor: backgroundGrayColor,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Edit',
//             style: black50024,
//           ),
//           InkWell(
//               borderRadius: BorderRadius.circular(20),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Icon(Icons.close)),
//         ],
//       ),
//       content: SizedBox(
//         height: 600,
//         width: 500,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               edit,
//             ],
//           ),
//         ),
//       ),
//     );
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
