import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufc_soccer/providers/admin_provider.dart';
import '../providers/auth_providers.dart';
import '../utils/image_urls.dart';
import '../widgets/auth_text_field.dart';

class AuthScreen extends StatefulWidget {
  static const screen = "/AuthScreen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isToogleScreen = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String? displayName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer(
      builder: (context, ref, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: ref.watch(signInProvider).loading ||
                ref.read(signUpProvider).loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                // loginu3A (211:24)
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(40 * 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Skip',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.poppins(
                            fontSize: 16 * 1,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * 1 / 1,
                            decoration: TextDecoration.underline,
                            color: const Color(0xff000000),
                            decorationColor: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // ellipse124qmN (211:109)
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      width: double.infinity,
                      height: 64 * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * 1),
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.appIcon,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // pleaselogintoyouraccountk7e (211:26)
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        isToogleScreen
                            ? 'Please Sign Up to your account'
                            : 'Please Login to your account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16 * 1,
                          fontWeight: FontWeight.w600,
                          height: 1.2125 * 1 / 1,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      // frame5094dx8 (211:56)
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame5093NPv (211:57)
                            margin: EdgeInsets.fromLTRB(
                                0 * 1, 0 * 1, 0 * 1, 34 * 1),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame5092KKA (211:58)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * 1, 0 * 1, 0 * 1, 20 * 1),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      textFieldsList(),
                                      Text(
                                        // forgotpassword724 (211:69)
                                        'Forgot password?',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.inter(
                                          fontSize: 14 * 1,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2125 * 1 / 1,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 49 + 10),
                                SignUpButton(
                                    onPressed: () {
                                      isToogleScreen
                                          ? ref
                                              .read(signUpProvider)
                                              .signUpValidation(
                                                context: context,
                                                nameController: nameController,
                                                email: emailController,
                                                password: passwordController,
                                                displayName:
                                                    nameController.text,
                                              )
                                          : ref
                                              .read(adminProvider)
                                              .authenticateUser(
                                                  context: context,
                                                  emailController:
                                                      emailController,
                                                  passwordController:
                                                      passwordController);
                                    },
                                    provider: ref.read(signUpProvider),
                                    nameController: nameController,
                                    emailController: emailController,
                                    passwordController: passwordController,
                                    size: size,
                                    isToogleScreen: isToogleScreen),
                              ],
                            ),
                          ),
                          Container(
                            // frame5082Mac (211:75)
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group76YC (211:76)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * 1, 0 * 1, 0 * 1, 16 * 1),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // line1EuJ (211:78)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * 1, 2 * 1, 0 * 1, 0 * 1),
                                        width: 62 * 1,
                                        height: 1 * 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16 * 1,
                                      ),
                                      Text(
                                        // or8zg (211:77)
                                        'OR',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14 * 1,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * 1 / 1,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16 * 1,
                                      ),
                                      Container(
                                        // line2UYk (211:79)
                                        margin: EdgeInsets.fromLTRB(
                                            0 * 1, 2 * 1, 0 * 1, 0 * 1),
                                        width: 62 * 1,
                                        height: 1 * 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  // loginwithsocialmediaDFS (211:80)
                                  'Login with social media',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * 1,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125 * 1 / 1,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // frame5083Z4Q (211:28)
                      margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 56 * 1),
                      width: double.infinity,
                      height: 81 * 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame5103VCx (211:30)
                            width: 114 * 1,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group48095878r3W (211:31)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * 1, 0 * 1, 0 * 1, 6 * 1),
                                  padding: EdgeInsets.fromLTRB(
                                      40 * 1, 12 * 1, 40 * 1, 12 * 1),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8 * 1),
                                  ),
                                  child: Center(
                                    // group11AK6 (211:33)
                                    child: SizedBox(
                                      width: 34 * 1,
                                      height: 34 * 1,
                                      child: SvgPicture.asset(
                                        AppSvg.googleIcon,
                                        width: 34 * 1,
                                        height: 34 * 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  // googleHuW (211:40)
                                  'Google',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * 1,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * 1 / 1,
                                    color: Color(0xffb4bbc5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20 * 1,
                          ),
                          Container(
                            // frame51029Rv (211:42)
                            width: 114 * 1,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group480958766c4 (211:43)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * 1, 0 * 1, 0 * 1, 6 * 1),
                                  padding: EdgeInsets.fromLTRB(
                                      40 * 1, 12 * 1, 40 * 1, 12 * 1),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8 * 1),
                                  ),
                                  child: Center(
                                    // group10RPS (211:45)
                                    child: SizedBox(
                                      width: 34 * 1,
                                      height: 34 * 1,
                                      child: SvgPicture.asset(
                                        AppSvg.facebookIcon,
                                        width: 34 * 1,
                                        height: 34 * 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  // facebookkAp (211:48)
                                  'Facebook',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * 1,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * 1 / 1,
                                    color: Color(0xffb4bbc5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20 * 1,
                          ),
                          Container(
                            // frame5101foa (211:50)
                            width: 114 * 1,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group48095877cip (211:51)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * 1, 0 * 1, 0 * 1, 6 * 1),
                                  padding: EdgeInsets.fromLTRB(44.25 * 1,
                                      14.83 * 1, 45.27 * 1, 14.11 * 1),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(8 * 1),
                                  ),
                                  child: Center(
                                    // appleiconL92 (211:53)
                                    child: SizedBox(
                                      width: 24.48 * 1,
                                      height: 29.06 * 1,
                                      child: SvgPicture.asset(
                                        AppSvg.appleIcon,
                                        width: 24.48 * 1,
                                        height: 29.06 * 1,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  // appleTjS (211:55)
                                  'Apple',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 14 * 1,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * 1 / 1,
                                    color: Color(0xffb4bbc5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isToogleScreen = !isToogleScreen;
                          print('THIS IS TOOGLE STATUS $isToogleScreen');
                        });
                      },
                      child: RichText(
                        // newuserssignupoYQ (211:27)
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14 * 1,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * 1 / 1,
                            color: Color(0xff999999),
                          ),
                          children: [
                            TextSpan(
                              text: isToogleScreen
                                  ? 'Already have an account? '
                                  : 'New users? ',
                              style: GoogleFonts.inter(
                                fontSize: 14 * 1,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * 1 / 1,
                                color: Color(0xff999999),
                              ),
                            ),
                            TextSpan(
                              text: isToogleScreen ? 'Log in' : 'Sign Up',
                              style: GoogleFonts.inter(
                                fontSize: 14 * 1,
                                fontWeight: FontWeight.w600,
                                height: 1.2125 * 1 / 1,
                                color: Color(0xff2a81bf),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Container textFieldsList() {
    return Container(
      // frame5091rpt (211:59)
      margin: EdgeInsets.fromLTRB(0 * 1, 0 * 1, 0 * 1, 16 * 1),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isToogleScreen
              ? AuthTextField(
                  hintText: 'Name*',
                  iconPath: AppSvg.personIcon,
                  controller: nameController,
                )
              : SizedBox.shrink(),
          AuthTextField(
            hintText: 'Email*',
            iconPath: AppSvg.mailIcon,
            controller: emailController,
          ),
          AuthTextField(
            hintText: 'Password*',
            controller: passwordController,
            iconPath: AppSvg.lockIcon,
          ),
        ],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key,
      required this.provider,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.size,
      required this.isToogleScreen,
      required this.onPressed});
  final VoidCallback onPressed;

  final SignUpAuthProvider provider;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Size size;
  final bool isToogleScreen;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            fixedSize: Size(size.width * 0.9, 20 * 2.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: Color(0xFF12BCE3)),
        child: Text(
          isToogleScreen ? 'Sign Up' : 'Login',
          style: GoogleFonts.inter(
            fontSize: 16 * 1,
            fontWeight: FontWeight.w500,
            height: 1.2125 * 1 / 1,
            color: Color(0xffffffff),
          ),
        ));
  }
}
