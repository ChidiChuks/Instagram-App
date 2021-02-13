import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/pages/chat_page.dart';
import 'package:instagram_app/theme/colors.dart';
import 'package:instagram_app/util/constant.dart';
import 'package:instagram_app/util/new_feed_json.dart';
import 'package:instagram_app/util/story_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 90,
              ),
              IconButton(
                splashRadius: 15.0,
                icon: Icon(FontAwesome5Brands.facebook_messenger),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ChatPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            top: 5.0,
            left: 5.0,
            right: 5.0,
          ),
          child: Row(
            children: List.generate(stories.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 80,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          stories[index]['isStory']
                              ? Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: bgStoryColors)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 70.0,
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2.0,
                                          color: bgWhite,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              stories[index]['imageUrl']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 70.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.0,
                                        color: bgGrey,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            stories[index]['imageUrl']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                          stories[index]['isAdd']
                              ? Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: primary),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: bgWhite,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        stories[index]['username'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Divider(),
        Column(
          children: List.generate(newFeeds.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: bgStoryColors),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.3),
                                child: Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1.0,
                                      color: bgWhite,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          newFeeds[index]['profile']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              newFeeds[index]['username'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          FontAwesome.ellipsis_v,
                          size: 15.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(newFeeds[index]['imageUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              splashRadius: 15,
                              icon: newFeeds[index]['isLike']
                                  ? SvgPicture.asset(
                                      "assets/images/heart_red.svg",
                                      width: 25.0,
                                      height: 25.0,
                                    )
                                  : SvgPicture.asset(
                                      "assets/images/heart.svg",
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                              onPressed: () {},
                            ),
                            IconButton(
                              splashRadius: 15,
                              icon: Icon(
                                FontAwesome.comment_o,
                                size: 25.0,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              splashRadius: 15,
                              icon: SvgPicture.asset(
                                "assets/images/share.svg",
                                width: 20.0,
                                height: 20.0,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Feather.bookmark),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${newFeeds[index]['likes']} likes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: newFeeds[index]['username'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: newFeeds[index]['caption'],
                                style: TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          newFeeds[index]['comments'],
                          style: TextStyle(color: bgGrey),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: (size.width - 30) * 0.7,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1.0,
                                          color: bgGrey,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(profile),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 25.0,
                                      width: (size.width - 70) * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, right: 10.0),
                                        child: TextField(
                                          cursorColor:
                                              textBlack.withOpacity(0.5),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Add a comment",
                                            hintStyle: TextStyle(
                                              fontSize: 14.0,
                                              color: textBlack.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: (size.width - 30) * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 12.0,
                                    color: Colors.orange[900],
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.people_alt_outlined,
                                    size: 12.0,
                                    color: Colors.yellow[900],
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          newFeeds[index]['dateTime'],
                          style: TextStyle(
                            fontSize: 12.0,
                            color: textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
