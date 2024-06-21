import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kcolor = const Color(0xffF1F5F9);
Color kcolorTabbarInHomePage = Colors.black;

const Color kColorTextFromScreenLogin = Color(0xffBBF7D0);
const Color kColorTextScreenLogin = Color(0xff065F46);
const Color kColorDisplay2InHomePage = Color(0xff34D399);
const Color c = Colors.green;
const double sizeTextScreenLogin = 12;

class AssetsData {
  static String host1 = "http://127.0.0.1:8000/api/";

  static List<bool> colorfavorite = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  static const String imageSplashViewBody = "assets/images/abd1.png";
  //"assets/images/1.png";
  static const String imageFlower = "assets/images/2.png";
  static const String imageBookNovels = "assets/images/book.png";
}

const String a =
    "Joanne Rowling CH OBE FRSL (/ˈroʊlɪŋ/ rolling;[1] born 31 July 1965), better known by her pen name J. K. Rowling, is a British author and philanthropist. She wrote Harry Potter, a seven-volume fantasy series published from 1997 to 2007. The series has sold over 600 million copies, been translated into 84 languages, and spawned a global media franchise including films and video games. The Casual Vacancy (2012) was her first novel for adults. She writes Cormoran Strike, an ongoing crime fiction series, under the alias Robert Galbraith"
    "Born in Yate, Gloucestershire, Rowling was working as a researcher and bilingual secretary for Amnesty International in 1990 when she conceived the idea for the Harry Potter series while on a delayed train from Manchester to London. The seven-year period that followed saw the death of her mother, the birth of her first child, divorce from her first husband, and relative poverty until the first novel in the series, Harry Potter and the Philosophers Stone, was published in 1997. Six sequels followed, and by 2008, Forbes had named her the worlds highest-paid author."
    "Rowling concluded the Harry Potter series with Harry Potter and the Deathly Hallows (2007). The novels follow a boy called Harry Potter as he attends Hogwarts (a school for wizards), and battles Lord Voldemort. Death and the divide between good and evil are the central themes of the series. Its influences include Bildungsroman (the coming-of-age genre), school stories, fairy tales, and Christian allegory. The series revived fantasy as a genre in the children s market, spawned a host of imitators, and inspired an active fandom. Critical reception has been more mixed. Many reviewers see Rowling s writing as conventional; some regard her portrayal of gender and social division as regressive. There were also religious debates over the Harry Potter series."
    "Rowling has won many accolades for her work. She has received an OBE and was made a Companion of Honour for services to literature and philanthropy. Harry Potter brought her wealth and recognition, which she has used to advance philanthropic endeavours and political causes. She co-founded the charity Lumos and established the Volant Charitable Trust, named after her mother. Rowlings charitable giving centres on medical causes and supporting at-risk women and children. In politics, she has donated to Britains Labour Party and opposed Scottish independence and Brexit. She has publicly expressed her opinions on transgender people and related civil rights since 2017. These views have been criticised as transphobic by LGBT rights organisations and some feminists, but have received support from other feminists and individuals.";
FToast fToast = FToast();

showToast(
    {required context,
    required String text,
    required Color color,
    int duration = 3}) {
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: duration),
  );
}
