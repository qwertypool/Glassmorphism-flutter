import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class GlassMorphism extends StatefulWidget {
  @override
  _GlassMorphismState createState() => _GlassMorphismState();
}

class _GlassMorphismState extends State<GlassMorphism> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/neon_lights.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.4),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6.0,
                  sigmaY: 6.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.62,
                  width: MediaQuery.of(context).size.width*0.8,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.1),
                      )),
                     child: signUp(context),
                              ),
                            ),
            ),
                        ),
                      ),
                    ),
                  );
                }

  Padding signUp(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                      child: Column(
                        children: [
                        Align(
                        alignment: Alignment.topLeft,
                        child: Text(' Sign up', style:TextStyle( color: Colors.white,fontSize: 22,letterSpacing: 2,fontWeight: FontWeight.w600,fontFamily: 'Ubuntu'),)),
                          SizedBox(height: 5,),
                          TextFieldContainer(
                            child: TextField(
                              onChanged: (value) {},
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 0.5,fontWeight: FontWeight.w400,fontFamily: 'Ubuntu'),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 2,fontWeight: FontWeight.w600,fontFamily: 'Ubuntu'),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          //SizedBox(height: 5,),
          
                          PasswordFieldContainer(
                                child: TextField(
                                  obscureText: _isHidden,
                                  onChanged: (value) {},
                                  cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 0.5,fontWeight: FontWeight.w400,fontFamily: 'Ubuntu'),
                              
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 2,fontWeight: FontWeight.w600,fontFamily: 'Ubuntu'),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: InkWell(
                                          onTap: _togglePasswordView,
                                          child: Icon(
                                                  _isHidden 
                                                  ? Icons.visibility 
                                                  : Icons.visibility_off,
                                                color: Colors.white,
                                              ),
                                            ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,),
                              //Spacer(),
                              RawMaterialButton(
                                constraints: BoxConstraints(minHeight: 50,minWidth: MediaQuery.of(context).size.width*0.8),
                                      onPressed: () {},
                                      elevation: 2.0,
                                      fillColor: Colors.black.withOpacity(0.3),
                                      child: Text('Login',style: TextStyle(color: Colors.white,letterSpacing: 2.6,fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Ubuntu'),),
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(25.0),
                                                        side:
                                                      BorderSide(
                                                          color: Colors.black.withOpacity(0.5),
                                                          width: 2
                                                          ),
                                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Forgot password?',style: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500,fontFamily: 'Ubuntu'),),
                                            Text('Sign up',style: TextStyle(color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500,fontFamily: 'Ubuntu'),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        OrDivider(),
                                        SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SocalIcon(
                                                iconSrc: "assets/icons/facebook.svg",
                                                press: () {},
                                              ),
                                              SocalIcon(
                                                iconSrc: "assets/icons/github.svg",
                                                press: () {},
                                              ),
                                              SocalIcon(
                                                iconSrc: "assets/icons/twitter.svg",
                                                press: () {},
                                              ),
                                            ],
                                          )
                          
                                      ],
                                    ),
                                  );
  }

    void _togglePasswordView() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }
  }
  class TextFieldContainer extends StatelessWidget {
    final Widget child;
    const TextFieldContainer({
      Key? key,
      required this.child,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(29),
          
        ),
        child: child,
      );
      
    }

  
}
class PasswordFieldContainer extends StatelessWidget {
  final Widget child;
  const PasswordFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
       // color: Colors.black.withOpacity(0.4),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
         // color: Theme.of(context).textTheme.bodyText1!.color, //for light & dark mode compatiblity
          color: Colors.white,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
    //  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
            child: Text(
              "or",
              style: TextStyle(
               // color: Theme.of(context).textTheme.bodyText1!.color,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Ubuntu'
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.white,
        height: 1.5,
      ),
    );
  }
}