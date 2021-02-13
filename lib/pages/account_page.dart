import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_app/theme/colors.dart';
import 'package:instagram_app/util/account_images_json.dart';
import 'package:instagram_app/util/constant.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 0;

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
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Feather.lock,
                    size: 18.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 15.0,
                    icon: Icon(AntDesign.plus),
                    onPressed: () {},
                  ),
                  IconButton(
                    splashRadius: 15.0,
                    icon: Icon(FontAwesome.bars),
                    onPressed: () {},
                  ),
                ],
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
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: (size.width - 20) * 0.3,
                    child: Stack(
                      children: [
                        Container(
                          height: 100.0,
                          width: 100.0,
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
                        Positioned(
                          bottom: 0,
                          right: 25.0,
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                              border: Border.all(
                                width: 1.0,
                                color: bgWhite,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: bgWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "61",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "117",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "173",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(instagramName),
              Text(instagramBio),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 35.0,
                width: (size.width - 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: bgGrey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: bgLightGrey,
                ),
                child: Center(
                  child: Text(
                    "Edit Profile",
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Story Highlights",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    FontAwesome.angle_down,
                    size: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          height: 0.5,
          width: size.width,
          decoration: BoxDecoration(
            color: bgGrey.withOpacity(0.8),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 3.0,
          ),
          child: Row(
            children: [
              Container(
                width: (size.width * 0.5),
                child: IconButton(
                  splashRadius: 20.0,
                  icon: Icon(
                    FontAwesome.th,
                    color: selectedIndex == 0
                        ? textBlack
                        : textBlack.withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
              ),
              Container(
                width: (size.width * 0.5),
                child: IconButton(
                  splashRadius: 20.0,
                  icon: Icon(
                    FontAwesome.id_badge,
                    color: selectedIndex == 1
                        ? textBlack
                        : textBlack.withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 1.0,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                    color: selectedIndex == 0 ? bgDark : Colors.transparent,
                  ),
                ),
                Container(
                  height: 1.0,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                    color: selectedIndex == 1 ? bgDark : Colors.transparent,
                  ),
                ),
              ],
            ),
            Container(
              height: 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: bgGrey.withOpacity(0.8),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getImages(size),
            getImageWithTags(size),
          ],
        ),
      ],
    );
  }

  Widget getImages(size) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(images.length, (index) {
        return Container(
          height: 150.0,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }

  Widget getImageWithTags(size) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(imageWithTags.length, (index) {
        return Container(
          height: 150.0,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageWithTags[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
