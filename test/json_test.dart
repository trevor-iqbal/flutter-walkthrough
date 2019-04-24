import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_walkthrough/src/article_parsing.dart';
import 'package:http/http.dart' as http;

void main(){
  test("parses topstories.json", (){
      const jsonString = "[19738394,19738120,19738537,19738608,19726941,19738685,19737089,19734977,19727795,19734909,19738556,19736309,19730313,19737344,19737663,19737181,19736091,19738217,19736677,19728132,19737015,19734565,19737012,19726520,19737716,19735512,19727401,19738572,19735012,19737555,19735463,19729734,19737715,19712238,19738228,19734608,19738793,19734800,19733618,19728399,19737070,19730319,19733418,19723157,19737949,19733182,19737838,19719380,19735530,19730799,19732447,19738298,19736964,19730034,19727832,19732794,19734001,19737056,19736167,19734674,19735240,19730058,19728544,19725290,19725823,19732821,19737067,19729286,19726939,19724485,19733646,19730309,19735432,19732032,19734699,19730663,19727850,19728176,19727775,19733234,19728749,19729998,19719492,19738233,19732823,19729854,19729202,19728112,19730919,19728392,19726794,19728189,19718287,19732561,19724317,19727085,19719118,19717786,19731400,19727218,19724262,19716347,19735848,19728391,19737406,19734779,19730906,19735761,19723049,19717830,19731574,19737324,19728277,19735709,19716019,19730098,19717991,19727621,19712057,19729016,19717808,19723858,19735561,19731205,19735402,19737214,19733282,19727551,19738503,19736184,19732775,19731858,19732974,19729033,19720099,19717584,19713604,19730274,19736477,19735713,19735179,19714627,19717884,19717717,19728974,19737019,19720962,19721264,19724401,19727047,19729692,19727156,19731326,19732654,19717558,19736157,19717719,19718250,19733015,19728555,19736345,19715490,19724371,19730418,19733523,19718440,19713838,19727962,19716179,19727302,19726528,19722594,19729038,19716303,19731169,19724986,19728271,19719160,19722161,19723039,19735348,19729491,19715450,19726888,19734185,19716463,19714189,19735242,19717250,19713605,19711392,19715191,19717809,19716401,19711669,19707659,19735491,19716649,19727035,19730386,19709626,19730987,19713791,19735318,19718284,19733069,19717940,19725610,19718885,19731419,19712918,19729071,19729839,19736123,19720009,19708620,19732710,19736098,19721998,19720832,19708982,19716510,19711531,19734198,19722675,19716673,19722480,19711756,19730875,19710288,19721343,19720753,19731455,19715576,19725056,19712705,19710398,19709229,19709835,19720697,19721568,19732232,19717225,19712167,19715864,19734892,19728289,19729377,19719197,19721302,19713276,19718546,19718344,19729559,19722179,19735079,19735053,19729449,19714924,19732120,19728024,19721516,19733284,19714441,19712162,19728355,19734300,19708997,19717877,19715041,19729332,19722604,19720411,19734087,19735475,19728174,19718064,19733098,19722894,19721279,19714321,19714105,19710142,19714622,19731963,19734648,19734569,19708429,19712617,19720702,19715353,19708778,19711174,19715852,19714514,19724402,19733321,19728612,19711257,19733271,19717000,19733212,19721725,19734229,19729894,19721467,19719196,19733500,19711011,19713197,19711057,19737034,19730162,19734883,19712564,19711584,19718486,19711141,19721099,19725489,19713481,19734850,19717183,19722259,19710778,19711566,19723066,19707426,19722891,19734763,19713352,19720733,19730863,19720037,19729952,19735120,19721415,19712465,19733304,19707570,19713544,19725640,19724024,19712685,19720679,19725365,19710841,19729958,19734425,19709411,19729736,19719957,19707516,19732763,19734338,19717419,19708451,19707660,19712151,19734147,19725499,19714073,19708742,19710316,19734021,19734003,19716936,19709318,19732389,19722522,19721741,19728552,19721235,19711241,19731526,19733461,19715848,19733362,19710770,19711310,19717354,19710854,19719305,19719569,19732953,19731068,19712058,19730587,19710835,19712013,19719948,19709551,19720070,19707686,19733666,19726411,19711714,19726349,19717754,19724610,19722621,19732367,19721869,19726091,19719781,19712976,19729353,19732357,19710972,19709811,19720850,19711732,19723173,19727193,19711567,19710747,19714906,19731277,19711017,19724674,19708870,19729444,19718394,19714475,19730723,19716506,19711793,19722678,19724969,19724958,19718488,19730365,19707248,19719542,19724812,19715786,19718163,19719280,19707404,19727341,19729806,19709475,19717876,19709289,19727079,19711851,19723780,19725826,19723628,19724287,19723270,19708133,19711416,19728674,19727216,19707543,19728159,19726324,19721855,19717507,19723382,19712101,19723094,19719241,19720653,19727566,19722860,19727488,19713770,19715796,19707814,19714794,19724466,19727361,19727332,19710021,19727254,19725623,19720789,19719337,19721580,19713026,19722911,19719878,19721250,19713963,19713263,19708102,19722704,19707805,19712240,19714637,19714532,19714293,19711843,19710412,19708789,19711637,19725761,19719495]";
  expect(parseTopStoriesTestCase(jsonString).first, 19738394);
  });
  test("parses item.json", (){
      const jsonString = """{
          "by":"griffinmb",
          "descendants":4,
          "id":19738394,
          "kids":[19738879,19738853],
          "score":34,
          "time":1556114390,
          "title":"Private Key Extraction from Qualcomm Hardware-Backed Keystores",
          "type":"story",
          "url":"https://www.nccgroup.trust/us/our-research/private-key-extraction-qualcomm-keystore/?research=Technical+advisories"
          }""";
  expect(parseArticleTestCase(jsonString).by, "peter_d_sherman");
  });
  test("parses item.json over a network", () async{
    final url = "https://hacker-news.firebaseio.com/v0/topstories.json";
    final res = await http.get(url);
    if(res.statusCode == 200){
      final idList = json.decode(res.body);
      if(idList.isNotEmpty){
        final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/${idList.first}.json';
        final storyRes = await http.get(storyUrl);
        if(res.statusCode == 200){
          expect(parseArticleTestCase(storyRes.body).by, "vetelko");
        }
      }
    }
  });
}