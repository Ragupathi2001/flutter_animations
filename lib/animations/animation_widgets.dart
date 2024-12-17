import 'package:flutter/material.dart';

class AnimationWidgets extends StatefulWidget {
  const AnimationWidgets({super.key});

  @override
  State<AnimationWidgets> createState() => _AnimationWidgetsState();
}

class _AnimationWidgetsState extends State<AnimationWidgets>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
  final controller = PageController();
  int _currentPageValue = 0;

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  bool animatedCrossFadeState = false;
  bool selected = false;
  bool animatedCrossfade = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Widgets'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Animated cross fade',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),

              AnimatedCrossFade(
                  firstChild: firstWidget(),
                  secondChild: secondWidget(),
                  // firstCurve: Curves.bounceInOut,
                  // secondCurve: Curves.fastEaseInToSlowEaseOut,
                  crossFadeState: animatedCrossFadeState
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(seconds: 3)),
              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 50,
                  ),
                  AnimatedCrossFade(
                      layoutBuilder: (Widget topChild, Key topChildKey,
                          Widget bottomChild, Key bottomChildKey) {
                        return Stack(
                          clipBehavior: Clip.hardEdge,
                          children: <Widget>[
                            Positioned(
                              key: bottomChildKey,
                              left: 100.0,
                              top: 100.0,
                              child: bottomChild,
                            ),
                            Positioned(
                              key: topChildKey,
                              child: topChild,
                            ),
                          ],
                        );
                      },
                      firstChild: firstWidget1(),
                      secondChild: secondWidget1(),
                      crossFadeState: animatedCrossfade
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(seconds: 1)),
                  Container(
                    color: Colors.blue,
                    height: 50,
                  ),
                ],
              ),
              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Animated positioned',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
              ),

              Container(
                // color: Colors.grey,
                width: 200,
                height: 350,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      width: selected ? 200.0 : 50.0,
                      height: selected ? 50.0 : 200.0,

                      top: selected ? 50.0 : 150.0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: const ColoredBox(
                          color: Colors.blue,
                          child: Center(child: Text('Tap me')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),
              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Animated size & animated Align' ,style: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),

              ),

              Container(
                height: 250,
                width: 350,
                color: Colors.blueAccent.shade100,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: AnimatedAlign(
                    alignment: selected ? Alignment.bottomLeft : Alignment
                        .topRight,
                    duration: Duration(seconds: 2),
                    child: ColoredBox(
                      color: Colors.amberAccent,
                      child: AnimatedSize(
                        curve: Curves.easeIn,
                        duration: const Duration(seconds: 2),
                        child: FlutterLogo(size: selected ? 250.0 : 100.0),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Animated DecoratedBoxTransition & AnimatedBuilder & AnimatedContainer',textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
              ),

              ColoredBox(
                color: Colors.white,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      animatedCrossFadeState= (!animatedCrossFadeState);
                    });
                  },
                  child: Center(
                    child: DecoratedBoxTransition(
                      decoration: decorationTween.animate(_controller),
                      child: Container(

                        clipBehavior: Clip.none,
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, w) {
                              return Center(
                                child: AnimatedContainer(

                                  height: animatedCrossFadeState==false ? 50 : 100,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: animatedCrossFadeState==false
                                          ? Colors.yellow
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          animatedCrossFadeState==false ? 30 : 0)
                                  ),
                                  // child: Image.asset('asset/cutie.jpg',fit: BoxFit.cover,
                                  // ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('RotationTransition Animation',textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
              ),
              RotationTransition(

                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: firstWidget(),
                ),
              ),
              Divider(
                thickness: 10,
                color: Colors.deepPurpleAccent,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Slide Transition Animation',textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
              ),

              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: sampleWidget(),
                ),
              ),

              SizedBox(
                height: 200,
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, m) {
                      return PageView.builder(
                          controller: controller,
                          // physics: const CustomPageViewScrollPhysics(),
                          onPageChanged: (h) {
                            setState(() {
                              _currentPageValue = h;
                            });
                          },
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  sampleWidget(),
                                  Positioned.fill(child: Center(child: Text(
                                    index.toString(), style: TextStyle(
                                      fontSize: 148, color: Colors.red),))),

                                ],
                              ),
                            );
                          }
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.animateToPage(
                              _currentPageValue - 1, duration: Duration(
                              seconds: 1),
                              curve: Curves.fastEaseInToSlowEaseOut);
                        },
                        child: const Text('Previous')
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.animateToPage(
                              _currentPageValue + 1, duration: Duration(
                              seconds: 1), curve: Curves.bounceInOut);
                        },
                        child: Text('Next')
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sampleWidget() {
    return Image.asset('asset/cutie.jpg',);
  }

  Widget firstWidget() {
    return MaterialButton(
      padding: EdgeInsets.all(12),
      color: Colors.green,
      onPressed: () {
        setState(() {
          animatedCrossFadeState = !(animatedCrossFadeState);
          _controller.forward();
        });
      },
      child: const Text('First'),
    );
  }

  Widget secondWidget() {
    return MaterialButton(
      padding: EdgeInsets.all(12),
      color: Colors.red,
      onPressed: () {
        setState(() {

          animatedCrossFadeState = !(animatedCrossFadeState);
        });
        // onTap(),
      },
      child: const Text('Second'),
    );
  }

  Widget firstWidget1() {
    return MaterialButton(
      color: Colors.red,
      onPressed: () => setState(() {
        animatedCrossfade = !(animatedCrossfade);
      }),
      child: const Text('First'),
    );
  }

  Widget secondWidget1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRect(
        child: MaterialButton(
          height: 200,
          color: Colors.green,
          onPressed: () => setState(() {
            animatedCrossfade = !(animatedCrossfade);
          }),
          child: const Text('second'),
        ),
      ),
    );
  }
}
