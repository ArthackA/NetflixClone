import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/Widgets/responsive.dart';

// import 'package:netflix/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
          mobile: _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
          
        ));
  }
}

// Class to create the buttons
class _AppBarBtn extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarBtn({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset('Assets/logos/netflix_logo0.png'),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarBtn(title: 'Tv Shows', onTap: () => print('Tv shows')),
                _AppBarBtn(title: 'Movies', onTap: () => print('Movies')),
                _AppBarBtn(title: 'My List', onTap: () => print('My list'))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset('Assets/logos/netflix_logo1.png'),
          const SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 _AppBarBtn(title: 'Home', onTap: () => print('Home')),
                _AppBarBtn(title: 'Tv Shows', onTap: () => print('Tv shows')),
                _AppBarBtn(title: 'Movies', onTap: () => print('Movies')),
                _AppBarBtn(title: 'My List', onTap: () => print('My list')),
                _AppBarBtn(title: 'Latest', onTap: () => print('Latest'))
              ],
            ),
          ),
          const Spacer(),
           Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.search),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('search'),
                 ),
                
                _AppBarBtn(title: 'KIDS', onTap: () => print('kids')),
                _AppBarBtn(title: 'DVD', onTap: () => print('DVD')),
                IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.card_giftcard),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('GiftCard'),
                ),
                IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.notifications),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('Notifications'),
                 ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
