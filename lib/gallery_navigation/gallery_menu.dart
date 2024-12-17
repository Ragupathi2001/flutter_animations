import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_project/gallery_navigation/page_scaffold.dart';

import '../samples/explicit/ring_animation.dart';
import '../samples/explicit/rotation_transition.dart';
import '../samples/explicit/scale_transition.dart';
import '../samples/explicit/staggered_animations.dart';
import '../samples/implicit/animated_container.dart';
import '../samples/implicit/animated_positioned.dart';
import '../samples/implicit/tween_animation_builder.dart';
import '../samples/settings/curves.dart';
import '../samples/settings/duration.dart';
import '../samples/settings/theming.dart';
import '../samples/tickers/tickers_stopwatch.dart';

final availablePages = <String, WidgetBuilder>{
  // settings
  'Curves': (_) => const CurvesPage(),
  'Themes': (_) => const ThemeSelectionPage(),
  'Duration': (_) => const DurationPage(),
  // implicit animations
  'AnimatedContainer': (_) => const AnimatedContainerPage(),
  'AnimatedPositioned': (_) => const AnimatedPositionedPage(),
  'TweenAnimationBuilder (translation)': (_) =>
      const TweenAnimationBuilderPage(),
  // explicit animations
  'ScaleTransition': (_) => const ScaleTransitionPage(),
  'RotationTransition': (_) => const RotationTransitionPage(),
  'Animated Ring': (_) => const AnimatedRingPage(),
  'Staggered Animations': (_) => const StaggeredAnimationsPage(),
  // tickers
  'Stopwatch': (_) => const StopwatchPage(),
};

final settingsGroupKeys = <String>[
  'Curves',
  'Themes',
  'Duration',
];
final implicitGroupKeys = <String>[
  'AnimatedContainer',
  'AnimatedPositioned',
  'TweenAnimationBuilder (translation)',
];
final explicitGroupKeys = <String>[
  'ScaleTransition',
  'RotationTransition',
  'Staggered Animations',
  'Animated Ring',
];
final tickerGroupKeys = <String>[
  'Stopwatch',
];

final selectedPageKeyProvider = StateProvider<String>((ref) {
  return availablePages.keys.first;
});

final selectedPageBuilderProvider = Provider<WidgetBuilder>((ref) {
  final selectedPageKey = ref.watch(selectedPageKeyProvider);
  return availablePages[selectedPageKey]!;
});

class GalleryMenu extends ConsumerWidget {
  const GalleryMenu({Key? key}) : super(key: key);

  void _selectPage(BuildContext context, WidgetRef ref, String pageName) {
    if (ref.read(selectedPageKeyProvider) != pageName) {
      ref.read(selectedPageKeyProvider.notifier).state = pageName;
      // dismiss drawer if we have one
      if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageName = ref.watch(selectedPageKeyProvider);
    return PageScaffold(
      title: 'Gallery',
      showDrawerIcon: false,
      body: ListView(
        children: <Widget>[
          const ListSectionHeader(title: 'Settings'),
          for (var pageName in settingsGroupKeys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
          const ListSectionHeader(title: 'Implicit Animations'),
          for (var pageName in implicitGroupKeys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
          const ListSectionHeader(title: 'Explicit Animations'),
          for (var pageName in explicitGroupKeys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
          const ListSectionHeader(title: 'Tickers'),
          for (var pageName in tickerGroupKeys)
            PageListTile(
              selectedPageName: selectedPageName,
              pageName: pageName,
              onPressed: () => _selectPage(context, ref, pageName),
            ),
        ],
      ),
    );
  }
}

class PageListTile extends StatelessWidget {
  const PageListTile(
      {Key? key,
      required this.selectedPageName,
      required this.pageName,
      this.onPressed})
      : super(key: key);
  final String selectedPageName;
  final String pageName;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Opacity(
        opacity: selectedPageName == pageName ? 1.0 : 0.0,
        child: const Icon(Icons.check),
      ),
      title: Text(pageName),
      onTap: onPressed,
    );
  }
}

class ListSectionHeader extends StatelessWidget {
  const ListSectionHeader({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 32,
      decoration: const BoxDecoration(
        color: Colors.black12,
        border: Border(
          top: BorderSide(color: Colors.black26, width: 0.5),
          bottom: BorderSide(color: Colors.black26, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(title, textAlign: TextAlign.left),
      ),
    );
  }
}
