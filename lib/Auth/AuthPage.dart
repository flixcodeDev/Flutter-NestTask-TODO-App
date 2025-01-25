import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/App_Pages/HomePage.dart';
import 'package:nesttask/CustomButton/BottomNavBar.dart';

import 'package:nesttask/CustomButton/customButton.dart';

import '../CustomButton/CustomTextField.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final controller = TextEditingController();
  bool rememberMe = false;
  final _scrollController = ScrollController();
  final _focusNodePassword = FocusNode();
  var login = 0;

  @override
  void initState() {
    super.initState();

    // Scroll when password field gets focus
    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  login == 0 ? 'Login Your\nAccount' : "Register New\nAccount",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  login == 0
                      ? 'Login to enjoy the best managing experience'
                      : 'Sign-in up to enjoy the best managing experience',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: SingleChildScrollView(
                  //  controller: _scrollController,
                  //  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                    indicatorColor: Colors.transparent,
                                    dividerHeight: 0,
                                    labelStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.grey,
                                    onTap: (value) {
                                      login = value;
                                      setState(() {});
                                    },
                                    tabs: [
                                      Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          child: const Tab(text: "  Login  ")),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          width: double.infinity,
                                          child:
                                              const Tab(text: "  Register  "))
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        login == 0
                            ? Column(
                                children: [
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "DIU_Email",
                                    prefixIcon: const Icon(
                                      Icons.mail_outline_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Password",
                                    prefixIcon: const Icon(
                                      Icons.lock_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Section",
                                    prefixIcon: const Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    suffixIcon:
                                        const Icon(Icons.chevron_left_outlined),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value!;
                                            });
                                          }),
                                      Text(
                                        "Remember Me",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(.5),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Forget Password ?",
                                            style: TextStyle(
                                                color: Colors.deepPurpleAccent,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomButton(
                                      onTap: () {
                                        Get.to(const Bottomnavbar());
                                      },
                                      text: "Login",
                                      fontsize: 18,
                                      textcolor: Colors.white,
                                      bgcolor: Colors.deepPurpleAccent,
                                      btnheight:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      btnwidth:
                                          MediaQuery.of(context).size.width * 9)
                                ],
                              )
                            : Column(
                                children: [
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Full Name",
                                    prefixIcon: const Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "DIU_Email",
                                    prefixIcon: const Icon(
                                      Icons.mail_outline_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Password",
                                    prefixIcon: const Icon(
                                      Icons.lock_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Phone Number",
                                    prefixIcon: const Icon(
                                      Icons.call_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomTextField(
                                    controller: controller,
                                    hintText: "Section",
                                    prefixIcon: const Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    suffixIcon:
                                        const Icon(Icons.arrow_drop_down),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  CustomButton(
                                      onTap: () {},
                                      text: "Register",
                                      fontsize: 18,
                                      textcolor: Colors.white,
                                      bgcolor: Colors.deepPurpleAccent,
                                      btnheight:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      btnwidth:
                                          MediaQuery.of(context).size.width * 9)
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
