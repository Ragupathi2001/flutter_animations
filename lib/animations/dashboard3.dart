
import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'Widgets/text_widget.dart';




class Dashboard3 extends StatefulWidget {
  const Dashboard3({super.key});

  @override
  State<Dashboard3> createState() => _Dashboard3State();
}

class _Dashboard3State extends State<Dashboard3> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final AnimationController _controller1 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final AnimationController _controller2 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final AnimationController _controller3 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin:const Offset(1.5, 0.0),
    end:Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linearToEaseOut,
  ));

  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin:const Offset(1.5, 0.0),
    end:Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller1,
    curve: Curves.linearToEaseOut,
  ));
  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin:const Offset(1.5, 0.0),
    end:Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller2,
    curve: Curves.linearToEaseOut,
  ));

  late final Animation<Offset> _offsetAnimation3 = Tween<Offset>(
    begin:const Offset(1.5,0.0),
    end:Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller3,
    curve: Curves.easeOutQuart,
  ));


  var opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
      for(int i in [0,1,2,3,4]) {
        Future.delayed(Duration(milliseconds: i *200),(){
          print('-----------------$i');
          switch(i){
            case 0 : {
              _controller.forward();
            }break;
            case 1 : {
              _controller1.forward();
            }break;
            case 2 : {
              _controller2.forward();
            }break;
            case 3 : {
              _controller3.forward();
            }break;
          }
        });

      }
      setState(() {

      });
    });
  }
  animator() {
    if (opacity == 1) {
      opacity = 0;
    } else {
      opacity = 1;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30, left: 12, right:12),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: opacity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250.0,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Agne',
                                  color: Colors.black
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,

                                animatedTexts: [
                                  TypewriterAnimatedText('Hello...',speed: const Duration(milliseconds: 100),cursor: ' !'),
                                ],
                              ),
                            ),
                          ),

                          TextWidget("Ragupathi", 25, Colors.black54, FontWeight.bold),
                        ],
                      ),
                      const Icon(Icons.phonelink_ring)
                    ],
                  ),
                ),
                SizedBox(height: 8,),

                SlideTransition(
                  position: _offsetAnimation,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: opacity,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              size: 30,
                              color: Colors.black.withOpacity(.5),
                            ),
                            hintText: "   Search"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                /// card
                SlideTransition(
                  position:_offsetAnimation1 ,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue.shade700,
                                Colors.blue.shade900,
                                Colors.blue.shade900,
                              ])),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 25,
                              left: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    foregroundImage:AssetImage('asset/Ace2.jpg') ,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        "You're invited to the live",
                                        15,
                                        Colors.white,
                                        FontWeight.normal,
                                        letterSpace: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            "Stream with  ",
                                            15,
                                            Colors.white,
                                            FontWeight.normal,
                                            letterSpace: 1,
                                          ),
                                          TextWidget(
                                            "Dr.Navida",
                                            15,
                                            Colors.white,
                                            FontWeight.bold,
                                            letterSpace: 2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          Positioned(
                              top: 100,
                              left: 20,
                              child: Container(
                                height: 1,
                                width: 300,
                                color: Colors.white.withOpacity(.5),
                              )),
                          Positioned(
                              top: 115,
                              left: 20,
                              right: 1,
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    TextWidget("120K people join live Stream!", 15,
                                        Colors.white, FontWeight.bold,
                                        letterSpace: 1),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Expanded(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.blue,
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                          Positioned(
                                            left: 40,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          const Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.close_outlined,
                                color: Colors.white,
                                size: 15,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                SlideTransition(
                    position: _offsetAnimation2,
                    child: categoryRow()),
                SizedBox(height: 8,),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: opacity,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget("Our Doctors", 25, Colors.black.withOpacity(.8), FontWeight.bold,letterSpace: 0,),
                        InkWell(
                            onTap: () async
                            {
                              animator();
                              setState(() {
                              });


                              setState(() {
                                animator();
                              });
                            },
                            child: TextWidget("See all", 15, Colors.blue.shade600.withOpacity(.8), FontWeight.bold,letterSpace: 0,)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SlideTransition(
                        position: _offsetAnimation3,
                        child: doctorList())),


              ],
            ),
          )
      ),
    );
  }



  Widget doctorList(){
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: opacity,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          // height: 270,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 8),
            child:
            Column(
              children: [
                doctorCard(names[0], spacilality[0], images[0]),
                doctorCard(names[1], spacilality[1], images[1]),
                doctorCard(names[2], spacilality[2], images[2]),
              ],
            ),

          ),
        ),
      ),
    );
  }
  Widget doctorCard(String name,String specialist,AssetImage image){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            const SizedBox(width: 10,),
            CircleAvatar(
              radius: 30,
              backgroundImage: image,
              backgroundColor: Colors.blue,
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(name, 20, Colors.black,FontWeight.bold,letterSpace: 0,),
                const SizedBox(height: 5,),
                TextWidget(specialist, 17, Colors.black,FontWeight.bold,letterSpace: 0,),
                const SizedBox(height: 5,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.navigation_sharp,color: Colors.blue,),
            const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
  Widget categoryRow(){
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: opacity,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            category("asset/Ace2.jpg", "Drug",5),
            category("asset/cutie.jpg", "Virus",10),
            category("asset/Ace2.jpg", "Physo",10),
            category("asset/cutie.jpg", "Other",12),

          ],
        ),
      ),
    );
  }
  Widget category(String asset,String txt,double padding){
    return Column(
      children: [
        InkWell(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              padding:  EdgeInsets.all(padding),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(fit: BoxFit.cover,
                    image:
                    AssetImage(asset),)
              ),

            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }


}








var images=const [
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),
  AssetImage('asset/cutie.jpg'),

];
var names=
[
  "Dr. John Carter",
  "Dr. Michaela Quinn",
  "Dr. Frasier Crane",
  "Dr. Leonard H.",
  "Dr. Doogie Howser",
  "Dr. Gregory",
  "Dr. John Dorian",
];
var spacilality=
[
  "Anesthesiologists",
  "Rectal Surgeons",
  "Allergists/Immunologists",
  "Critical Care Specialists",
  "Endocrinologists",
  "Family Physicians",
  "Gastroenterologists",
];