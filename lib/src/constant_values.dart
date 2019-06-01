import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class ConstantValues {
  static Random rng = new Random();
  static Color appBarBG = Colors.white;
  static Color darkColor = Color(0xFFFF777C);
  static Color midColor = Color(0xFF898ABC);
  static Color lightColor = Color(0xFFADA8DE);

  static double notificationImageQuoteHeight = 50.0;
  static double notificationImagePostHeight = 30.0;
  static double notificationImagePostWidth = 50.0;
  static double mutualWritersImageRadius = 12.0;
  static double userImageSizeS = 20.0;
  static double userImageSizeM = 25.0;
  static double userImageSizeMin = 12.0;
  static double userImageSizeMax = 45.0;
  static double fontS = 12.0;
  static double fontM = 14.0;
  static double fontL = 16.0;
  static double fontXL = 18.0;
  static double spaceS = 4.0;
  static double spaceM = 8.0;
  static double spaceL = 12.0;

  static double iconS = 24.0;
  static double iconM = 26.0;
  static double iconL = 28.0;
  static double socialMediaIconsRadius = 12.0;
  static double socialMediaIconsRadiusBig = 19.0;
  static double appBarTextSize = 20.0;
  static String exploreScreenHT = "Search People, Hashtags, Category.";


  static TextStyle userNameTSBig1 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0);
  static TextStyle userNameTSBig2 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
  static TextStyle userNameTSSmall1 =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0);
  static TextStyle userNameTSSmall2 =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0);

  static Text seeAllText =
      Text("See All", style: TextStyle(color: midColor, fontSize: fontM));

  static postDivider() {
    return Container(
      //color: Colors.black12,
      height: 0.5,
      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
    );
  }

  static String getPostImage() {
    return "assets/images/landscape${1 + rng.nextInt(3)}.jpg";
  }

  static String getQuoteImage() {
    return rng.nextInt(3) <= 1
        ? "assets/images/quote.jpg"
        : "assets/images/quote1.jpg";
  }

  static double bannerHeight(context) {
    return MediaQuery.of(context).size.width * 0.35;
  }

  static double categoryWidth(context) {
    return MediaQuery.of(context).size.width * 0.3;
  }

  static double categoryHeight(context) {
    return MediaQuery.of(context).size.width * 0.15;
  }

  static double postWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double postHeight(context) {
    return MediaQuery.of(context).size.width * 0.55;
  }

  static double quotePostWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double quotePostHeight(context) {
    return MediaQuery.of(context).size.width;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getHorizontalPostWidth(context) {
    return MediaQuery.of(context).size.width * (0.7);
  }

  static double getHorizontalPostHeight(context) {
    return 140.0;
  } 

  static double getHorizontalQuoteSize(context) {
    return 150.0;
  }

  static double getCreateQuoteRemainingHeight(context) {
    double height = MediaQuery.of(context).size.height;
    return ((height) * (1 - (quotePostWidth(context) / height)) - 129);
  }

  static double getHomePageRemainingHeight(context) {
    double height = MediaQuery.of(context).size.height;
    return (height - 178);
  }

  static Widget widgetDivider(_height) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _height / 2,
        ),
        Divider(),
        SizedBox(
          height: _height / 2,
        )
      ],
    );
  }

  static getPostTypeVal(postType) {
    if (postType == 1) return "Story";
    if (postType == 2) return "Poem";
    if (postType == 3) return "Quote";
  }

  static buttonBody(context, text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: Colors.black12,
        ),
        Container(
          margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: Colors.black12,
        ),
      ],
    );
  }

  static hashtag(tag) {
    return Text("#" + tag,
        style: TextStyle(color: Colors.blue, fontSize: 16.0));
  }

  static iconOptionText(icon, text) {
    return Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black87,
            ),
            SizedBox(
              width: 20.0,
            ),
            title(text, Colors.black, FontWeight.w500, 16.0)
            //Text(text,textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0),),
          ],
        ));
  }

  static pageIconOptionText(icon, text) {
    return Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black87,
            ),
            SizedBox(
              width: 12.0,
            ),
            title(text, Colors.black, FontWeight.w400, 16.0)
          ],
        ));
  }

  static optionText(text) {
    return Container(
        padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 48.0, right: 16.0),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
        ));
  }
/*
  static loadingWidget(context, text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitThreeBounce(
          size: 30.0,
          itemBuilder: (_, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
        SizedBox(
          height: 16.0,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              text,
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
*/
  static Widget title(title, color, fw, fs) {
    return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(color: color, fontWeight: fw, fontSize: fs)),
    );
  }

  static List<String> tabList = [
    "Following",
    "Love",
    "Friendship",
    "Humor",
    "HeartBreak",
    "Inspiration",
    "Erotica",
    "Letter",
    "Shayari",
    "Diary",
    "LifeStyle",
    "Fashion",
    "Travel",
    "Music",
    "Food",
    "Film",
    "Photography",
    "Philosophy",
    "Technology",
    "Politics",
    "Sports",
    "Beauty",
    "Art",
    "Nature",
    "Science",
    "Shopping"
  ];

  static List<String> categoryList = [
    "Love",
    "Friendship",
    "Humor",
    "HeartBreak",
    "Inspiration",
    "Erotica",
    "Letter",
    "Shayari",
    "Diary",
    "LifeStyle",
    "Fashion",
    "Travel",
    "Music",
    "Food",
    "Film",
    "Photography",
    "Philosophy",
    "Technology",
    "Politics",
    "Sports",
    "Beauty",
    "Art",
    "Nature",
    "Science",
    "Shopping"
  ];
  static String userProfileImage =
      "http://www.writeindia.in/app/assets/images/temp/untitled.png";
  static String likeText = "999K Likes";
  static String commentText = "999K Comments";
  static String randomShortText =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:";
  static String randomLongText =
      "Lakshadweep was one of my dream destinations since childhood. I was fascinated to this tiny group of islands but never got company to travel, which motivated me to head alone to live my dream. I started working on it by searching for more about the Lakshadweep over the internet and came to know about the cruise package from Kochi to Lakshadweep and I made my reservations for 7th of march 2016, accordingly I booked my flight ticket for Kochi from Delhi in an advance for 6th of march 2016. A Day before my flight I got a mail from my tour agent that due to some technical problem in ship it can be canceled or delayed and he assured me that he will arrange an alternate in case of cancelation, I didn’t have any option coz flight which I booked was non refundable so I made my mind to visit and explore on my own." +
          "On 6th of march after 3 and half hrs journey from Delhi I reached to Kochi international airport around 10:30Am and booked a prepaid taxi non ac for 900 bucks till willingdon island coz the main Lakshadweep office is located in willingdon island and accordingly I booked a hotel Casino .I started calling my tour agent but he didn’t respond stopped picking my call which made me feel helpless but I dint give up hope as I was there to achieve my dream destination hence decided to visit main Lakshadweep office. Office was located in walking distance from my hotel so I walked to the office and met Mr Hussain Manikfan , he was very gentle and helpful to me and suggested packages for me according to my travel date, he booked a flight for me till agatti Island arranged pass and resorts package which actually made me feel happy that yes finally I am going to Lakshadweep. I came back to my hotel and my flight was for Lakshadweep on 9th and I still had 2 days without any plans so I made my mind up for exploring Kerala, the place where I was staying is very easy to commute using ferry at just rupees 4 to fort kochi , it is well connected to Ernakulum , Vypeen and fort kochi." +
          "" +
          "Next day I asked the hotel desk for package but they were quite expensive, instead of that expensive package I hired return auto @250 till backwater point, it took 20min to reach and then I booked boat to enjoy backwater at Rs 500, the views were so beautiful and breathtaking that I couldn’t stop myself smiling throughout the boat ride, have never seen like scenic beauty like this before, though I have been to many beach places, did boat ride but what I experienced in back waters, i will never be able to forget my entire life." +
          "Next day I took a bus to Varkala beach which is considered to be the “Mini Goa of Kerala”, the beaches in Varkala are very clean and very cheap to stay and accommodation is not expensive. I stayed here for a day to enjoy the scenic beauty and I the morning I headed back to Kochi as I had a pre-booked flight for Agatti.";
  static String randomLongText1 =
      "In this is a text im awritng to  test the font and the  will be used for whihc i dont know what i am doing still i nak typing" +
          "for that i a still typin gnon idea but random text is needed so need to ytype random jagor still going to which then lets waht happens good bye tatabye see you latr good night"
              "os this is a text im awritng to  test the font and the  will be used for whihc i dont know what i am doing still i nak typing" +
          "oka so this is short line" +
          "for that i a still typin gnon idea but random text is needed so need to ytype random jagor still going to which then lets waht happens good bye tatabye see you latr good night";
}
