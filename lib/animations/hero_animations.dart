



import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: '1',
              child: Container(height: 200,width: 200,
              child: Image.asset('asset/Ace2.jpg'),),
            ),
            for(var ele in [1,2,3])
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) =>
                          Scaffold(
                            appBar: AppBar(
                              title: Text('testing Hero'),
                            ),
                            body: Container(
                              height: 500,width: 200,
                              child:  Hero(
                                tag: '1',
                                child: Container(height: 200,width: 200,
                                  child: Image.asset('asset/cutie.jpg'),),
                              ),
                            ),
                            floatingActionButton: FloatingActionButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Hero(
                                transitionOnUserGestures: true,
                                tag: 'asset/cutie.jpg',
                                child: Container(height: 200,width: 200,
                                  child: Image.asset('asset/cutie.jpg'),),
                              ),

                            ),
                          )
                    ,));
                },
                child: Container(

                  margin: const EdgeInsets.all(6),
                  height: 100,
                  width: double.infinity,
                  color: Colors.orange,
                ),
              ),
            PhotoHero(
              photo: 'asset/cutie.jpg',
              width: 300.0,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text('Flippers Page'),
                        ),
                        body: Container(
                          // Set background to blue to emphasize that it's a new route.
                          color: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [

                              Spacer(),
                              Container(
                                height: 500,width: 200,
                                child:  Hero(
                                  tag: '1',
                                  child: Container(height: 200,width: 200,
                                    child: Image.asset('asset/cutie.jpg'),),
                                ),
                              ),
                              PhotoHero(
                                photo: 'asset/cutie.jpg',
                                width: 100.0,
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    this.onTap,
    required this.width,
  });

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        transitionOnUserGestures: true,
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
