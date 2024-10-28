import 'package:flutter/material.dart';
import 'package:myoutput/screen/colors.dart';
import 'package:myoutput/home/widgets/home%20screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
              "image/bg.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                  Text(
                    "WanderPh"
                    ,style: TextStyle(
                      fontSize: 30,
                      color: kWhiteClr,
                    fontWeight: FontWeight.w600
                   ),
                  ),
                  SizedBox(height: 15),
                   Text(" Discover the hidden gems of the Philippines! Welcome to the WanderPh your essentail companiom for exploring our beautiful country",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kWhiteClr ,
                        fontSize: 16,
                        height: 1.6,
                        fontWeight: FontWeight.w500)
                   ),
                  SizedBox(height: 15),

                     //login buttoms
                       InkWell(
                         onTap: (){
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context)=>const HomeScreen()));
                         },
                       child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(color: kWhiteClr,borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "image/google.jpg",
                              height: 30,
                              width: 30,
                            ),
                                       SizedBox(
                              width: 10,
                            ),
                                           Text(
                              "Continue with Google",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),)
                          ],
                        ),
                                           ),
                     ),
                 SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>const HomeScreen()));
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(color: kWhiteClr,borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "image/fb.jpg",
                              height: 30,
                              width: 30,
                            ),
                        SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                 ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}