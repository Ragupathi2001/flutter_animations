

import 'package:flutter/material.dart';

import 'animations/animated_list.dart';
import 'animations/animation_widgets.dart';
import 'animations/custompaint_with_animation.dart';
import 'animations/dashboard.dart';
import 'animations/dashboard2.dart';
import 'animations/dashboard3.dart';
import 'animations/hero_animations.dart';
import 'animations/landing_list_animation.dart';
import 'animations/pysic_animation.dart';
import 'animations/radial_animation.dart';
import 'gallery_navigation/gallery_menu.dart';
import 'gallery_navigation/split_view.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animations'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            listItem(
              name: 'Tween & Transform Animation',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const RadialAnime() ,));
              }
            ),
            listItem(
                name: 'Animation Widgets',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>AnimationWidgets() ,));
                }
            ),
            listItem(
                name: 'Animated Dashboard with align and opacity',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const Dashboard() ,));
                }
            ),
            listItem(
                name: 'Animated Dashboard Sample',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const Dashboard2() ,));
                }
            ),
            listItem(
                name: 'Staggered Animated Dashboard ',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const Dashboard3() ,));
                }
            ),
            listItem(
                name: 'Animation Gallery ',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Builder(
                    builder: (context) => SplitView(
                      menuBuilder: (context) => const GalleryMenu(),
                      contentBuilder: (context) => selectedPageBuilder(context),
                    ),
                  ),));
                }
            ),
            listItem(
                name: 'Physics Animation',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>PhysicsCardDragDemo() ,));
                }
            ),
            listItem(
                name: 'Hero Animation',
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>HeroAnimation() ,));
                }
            ),
            listItem(
                name: 'Animated List',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>AnimatedListSample() ,));
                }
            ),
            listItem(
                name: 'Custom Animated List',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>CustomLandingListAnimation() ,));
                }
            ),
            listItem(
                name: 'Custom Paint with Animation',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SineWaveWidget() ,));
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget listItem({required String name,required Function onTap}){
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo),
              color: Colors.indigo.shade100
            ),

            alignment: Alignment.center,
            child: Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          ),
        ),
      ),
    );
  }
}
