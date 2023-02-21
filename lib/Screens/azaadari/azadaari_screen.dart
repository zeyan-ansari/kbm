import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../Helper/App_notifier.dart';

class AzadariDisplay extends StatefulWidget {
  @override
  _AzadariDisplayState createState() => _AzadariDisplayState();
}

class _AzadariDisplayState extends State<AzadariDisplay> {
  dynamic colors = [Colors.black, Colors.white];
  double fontSize = 20.0;
  void incfontsize() {
    setState(() {
      fontSize += 1;
    });
  }

  void decfontsize() {
    setState(() {
      fontSize -= 1;
    });
  }

  List<String> hadiths = <String>[];
  @override
  void initState() {
    hadiths = fortyhadith.split("____________________________");
    super.initState();
  }

  final String fortyhadith = '''1. The Inferno of Husayni Love 

The Holy Prophet (S) said: Surely, there exists in the hearts of the Mu'mineen, with respect to the martyrdom of Husayn (A.S.), a heat that never subsides. 

Mustadrak al‐Wasail vol 10 pg. 318 
____________________________
2. A'ashura ‐ A Day of Grief 

Imam Ridha’ (A.S.) said: 

The one for whom the day of A'ashura is a day of tragedy, grief and weeping, Allah The Mighty, ThemGlorious, shall make the Day of Judgment, a day of joy and happiness for him. 

Bihar al‐Anwar, vol. 44, pg. 284 
____________________________
3. Muharram ,The Month of Mourning 

Imam Ridha’ (A.S.) said: 

With the advent of the month of Muharram, my father Imam Kadhim (A.S.) would never be seen laughing; gloom and sadness would overcome him for (the first) ten days of the month; and when the tenth day of the month would dawn, it would be a day of tragedy, grief and weeping for him. 

Amaali Saduq, pg. 111 
____________________________
4. Laughing Eyes 

The Holy Prophet (S) said: 

O' Fatimah! Every eye shall be weeping on the Day of Judgment except the eye which has shed tears over the tragedy of Husayn (A.S.) for surely, that eye shall be laughing and shall be given the glad tidings of the bounties and comforts of Paradise. 

Bihar al‐Anwar, vol. 44 pg. 193.
____________________________
5. Reward of the Martyred Companions 

Imam Ridha’ (A.S.) said (to one of his companions): 

If you desire that for you be the reward equivalent to that of those martyred along with Husayn (A.S.), then whenever you remember him say: ' Oh! Would that I had been with them! A great achievement would I have achieved'. 

Wasaail al‐Shia'h, vol. 14, pg. 501. 
____________________________
6. The Customary Mourning

Abu Haroon al‐Makfoof said: 

I presented myself before Imam Sadiq (A.S.) whereupon he said to me: "Recite for me a poetry" and so I recited for him. He said "Not in this manner. Recite for me as you recite poems and elegies over the grave of Husayn (A.S.)" and so I recited for him (again). 

Bihar al Anwar vol 44, pg. 287.
____________________________
7. Reward for Reciting Poetry about Husayn (A.S.) 

Imam Sadiq (A.S.) said: 

The one who recites poetry about Husayn (A.S.) and weeps and makes others weep by means of it, except that Allah makes Paradise incumbent upon him and forgives his sins. 

Rijal al‐Shaikh al‐ Tusi pg. 189.
____________________________
8. People of Eulogies and Elegies 

Imam Sadiq (A.S.) said: 

All praise is for Allah, who has placed amongst the people, those who arrive in our presence, eulogizing us and reciting elegies about us. 

Wasail al‐Shiah vol. 10, pg. 469.
____________________________
9. Poetry Recitation During the Period of Mourning 

Imam Ridha’ (A.S.) said (to De'bil, a poet sincerely devoted to the Ahlul Bayt): 

I desire that you recite for me poetry, for surely, these days (of the month of Muharram) are the days of grief and sorrow, which have passed over us, Ahlul Bayt. 

Mustadrak al‐Wasail, vol 10, pg. 386. 
____________________________
10. Shiites, The Companions and Associates 

Imam 'Ali (A.S.) said: 

Surely, Allah has chosen for us followers (Shiites), who assist us and are happy at our happiness and are sad in our sadness. 

Ghuraral‐Hikam vol. 1, pg. 135. 
____________________________
11.Paradise, The Recompense of A'zadari 

Imam 'Ali Ibn al‐Husayn (A.S.) used to say: 

Every Mu'min, whose eyes shed tears upon the killing of Husayn Ibn 'Ali (A.S.) and his companions,such that the tears roll down his cheeks, Allah shall accommodate him in the elevated rooms of Paradise. 

Yanaabe'al‐Mawaddah, pg. 419.
____________________________ 
12.In Remembrance of the Children of Fatimah (A.S.) 

Imam Sajjad (A.S.) said: 
 
Surely, I have never brought to mind the martyrdom of the children of Fatimah (A.S.) except that I have been choked with tears due to it. 

Bihar al‐Anwar vol. 46, pg. 109. 
____________________________
13. Mourning in the Houses 

For those unable to go for the ziarat of Imam Husayn (A.S.) on the day of A'ashura, Imam Baqir (A.S.) mentions the manner of performing A'zadari as follows: 

He should mourn over Husayn (A.S.), weep for him and instruct the members of the house to weep for him. He should establish the mourning ceremony in the house by exhibiting lamentations and grief over him; the people should meet one another in their homes and offer condolences and consolation to each other over the calamities which befell him. 

Kaamil al‐Ziyaraat pg. 175 
____________________________
14. 'Ali (A.S.) Weeps While Grieving the Martyrs of Karbala’ 

Imam Baqir (A.S.) said: 

Amirul Mu'mineen (A.S.), along with two of his companions, happened to pass by Karbala’ and as he did so, tears filled his eyes. He said (to them), "This is the resting place of their animals; and this is where their luggage shall be laid down; and it is here that their blood shall be shed. Blessed are you O' Earth,that the blood of the beloved shall be spilled upon you." 

Bihar al Anwar, vol: 98 pg. 258. 
____________________________
15. Tears, Barrier of Hell 

Imam Baqir (A.S.) said: 

He who remembers us, or in whose presence, we are remembered, and (as a result) tears flow from his eyes, even though they may be in the measure of a wing of a mosquito, Allah shall construct for him a house in paradise and make the tears a barrier between him and the fire (of hell). 

Al‐Ghadeer vol. 2, pg. 202. 
____________________________
16. Twenty Years of Weeping! 

Imam Sadiq (A.S.) said: 

As for A'li Ibn al‐Husayn (A.S.), he cried over Husayn (A.S.) for twenty years (after the tragedy of Karbala); never would any food be placed before him except that he would begin to weep. 

Bihar al Anwar, vol 46, pg. 108 
____________________________
17. The Etiquette of Mourning 

Imam Sadiq (A.S.) said: 

When Ibrahim, the son of the Holy Prophet (S) died, tears filled the eyes of the Holy Prophet (S.A.W),whereupon he said, " The eyes are tearful and the heart is anguished (but) we shall not say anything which shall anger the Lord. Surely we, O' Ibrahim, are grief‐stricken for you" 

Bihar al‐Anwar vol: 22 , pg. : 157. 
____________________________
18. Tearful Eyes 

Imam Sadiq (A.S.) said: 

He in whose presence we (and our miseries) are mentioned and, as a result, his eyes pour out tears,Allah shall make his face forbidden upon the fire of hell. 

Bihar al Anwar vol. 44, pg. 185. 
____________________________
19. Husayni Gatherings 

Imam Sadiq (A.S.) said to Fudhail: 

Do you sit together, talk and discuss amongst yourselves? Fudhail replied: Yes. The Imam then said: I approve of these sittings. So keep our issue(Imamate) alive. May Allah exhibit mercy on those who revive our issue and mission! 

Wasail al‐Shiah , vol. 10, pg. 391. 
____________________________
20. Invaluable Tears 

May Allah have mercy upon your tears! Do know that you are regarded as being of those who are deeply concerned about us and of those who are happy at our happiness and aggrieved at our sorrow.Do know that you shall witness the presence of my fathers near you at the time of your death. 

Wasail al‐Shia, vol., 10, pg. 397 
____________________________
21. Scalded Hearts 

Imam Sadiq (A.S.) (while sitting on the prayer mat prayed for the mourners and those going for the ziarat of the Ahlul Bayt (A.S.) as follows): 

O' Lord, have mercy upon those eyes, which have shed tears in compassion for us; and upon those hearts, which have been restless and blistered for us; and upon those wailings, which have been for us. 

Bihar al‐Anwar vol 98 , pg. 8. 
____________________________
22. Tears over the Oppressed State of the Shiites 

Imam Sadiq (A.S.) said: 

He whose eyes shed tears for our blood which has been shed, or for our rights which have been usurped, or for the humiliation meted out to us or to one of our Shiites, Allah shall accommodate him in paradise for a long time. 

Amali Sheikh al Mufid, pg. 175. 
____________________________
23. Weeping of the Sky 

Imam Sadiq (A.S.) said: 

O' Zurarah! The sky had cried for forty days over(the martyrdom of) Husayn (A.S.) 

Mustadrakal‐Wasail, vol 1 pg. 391 
____________________________
24. The Holy Prophet and Weeping over the Martyrs 

Imam Sadiq (A.S.) said: 

After the news of the martyrdom of Ja'far Ibn Abi Talib (A.S.) and Zaid Ibn Harithah reached the Holy Prophet (S), whenever he entered his house, he would weep profusely for them and say: " They used to converse with me and were intimate with me and (now) both of them have departed together". 

Man La Yahdhuruhu al‐Faqih, vol. 1, pg. 177 
____________________________
25. Sympathy for Ahlulbayt 

Imam Sadiq (A.S.) said: 

The breath of one who is aggrieved upon the injustice and oppression subjected to us, is tasbeeh (glorification of Allah), and his grief for us, is i'baadat (worship of Allah) and his concealing our secrets, is jihad in the path of Allah.

The Imam (A.S.) then added: This tradition ought to be written in gold. 

Amaali al‐Shaikh al‐Mufid, pg. 338. 
____________________________
26. Mourning Angels 

Imam Sadiq (A.S.) said: 

Allah has appointed to the grave of Imam Husayn (A.S.), four thousand anguished and grief‐stricken angels, who weep over him (and shall continue to do so) up to the Day of Judgment. 

Kamil al‐ziyaraat, pg. 119. 
____________________________
27. Weeping over Husayn (A.S.) 

Imam Ridha’ (A.S.) said (to Rayyan Ibn Shabib): 

O' Son of Shabib! If you have to cry over something, then do so over Husayn Ibn 'Ali (A.S.) for surely, he was slaughtered in the manner in which a ram is slaughtered. 

Bihar al Anwar, vol. 94, pg. 286. 
____________________________
28. Gatherings in Remembrance of the Imams 

Imam Ridha’ (A.S.) said: 

He who sits in a gathering in which our affairs (and our path and aims) are discussed and revived, his heart shall not die on the day (Day of Judgment) when hearts shall die (of fear). 

Bihar alAnwar vol 4 pg. 178. 
____________________________
29. Benefits of Weeping over Husayn (A.S.) 

Imam Ridha’ (A.S.) said: 

Those who weep should weep over the likes of Husayn (A.S.) for surely, weeping over him does away with one's great sins. 

Bihar al‐Anwar vol: 94, pg. 184. 
____________________________
30. Forgiveness of Sins 

Imam Ridha’ (A.S.) said: 

O' Son of Shabib! Should you weep for Husayn (A.S.) in the measure that tears roll down your cheeks,Allah would forgive all the sins committed by you, whether they be the great sins or the small sins and whether they be meagre or immense. 

Amali Saduq, pg. 111. 
____________________________
31. Intimacy with the Progeny 

Imam Ridha’ (A.S.) said (to Ibn Shabib): 

O' Son of Shabib! If it makes you happy (and you desire) to be with us in the elevated ranks of paradise,then be sad in our grief and happy at our happiness. 

Wasaail al‐Shiah, vol. 14 pg. 502. 
____________________________
32. Day of A'ashura 

Imam Ridha’ (A.S.) said: 

One who refrains from seeking his (worldly) desires on the day of A'ashura, Allah shall grant him his desires of this world and the hereafter. 

Wasaail al Shiah, 14, pg. 504, 
____________________________
33. Pilgrim of Husayn (A.S.) 

Imam Sadiq (A.S.) said: 

The zaair (pilgrim) of Imam Husayn (A.S.) turns back (from his pilgrimage) such that not a single sin remains upon him. 

Wasaail al‐Shia'h, vol 14, pg. 412. 
____________________________
34. Husayn (A.S.) Seeks Forgiveness for his Pilgrims 

(Regarding someone who goes for pilgrimage to the shrine of Imam Husayn (A.S.)), Imam Sadiq (A.S.) said: 

One who weeps for Imam Husayn (A.S.), surely, the Imam (A.S.) observes him and seeks forgiveness for him and requests his holy fathers to (also) seek forgiveness for him. 

Bihar al‐Anwar vol. 44, pg. 181 
____________________________
35. Intercession on Day of Judgment 

The Holy Prophet (S) (said to H. Fatimah (A.S.)): 

On the Day of Judgment, you shall intercede for the ladies and I shall intercede for the men; every person who has wept over the tragedy of Husayn (A.S.), we shall take him by the hand and lead him into Paradise. 

Bihar al‐Anwar vol. 94 pg. 192, 
____________________________
36. Imam Sadiq (A.S.) on Day of A'ashura 

A'bdullah Ibn Sinaan says: 

I arrived in the presence of my master, Imam Sadiq (A.S.) on the day of A'ashura and found him pale and grief‐stricken, with tears streaming from his eyes like falling pearls. 

Mustadrak al‐ Wasail, vol 6, pg, 279. 
____________________________
37. Neither Angels nor Prophets 

The Holy Prophet (S) said: 

(On the Day of Judgment, a group would be seen in the most excellent and honourable of states. They would be asked if they were of the Angels or of the Prophets. In reply they would state): "We are‐neither Angels nor Prophets but of the indigent ones from the ummah of Muhammad (S)". They would then be asked: "How then did you achieve this lofty and honourable status?" They would reply: "We did not perform very many good deeds nor did we pass all the days in a state of fasting or all the nights in a state of worship but yes, we used to offer our (daily) prayers (regularly) and whenever we used to hear the mention of Muhammad (S), tears would roll down our cheeks". 

Mustadrak al‐Wasail, vol 10, pg. 318. 
____________________________
38. Visiting the Shrine of Imam Husayn (A.S.) 

Imam Sadiq (A.S.) said: 

He (Imam Husayn) sees those, who come to his shrine and he knows them by their names, their father's names and their ranks in the eyes of Allah, The Mighty, The Glorious, better than you know your own children! 

Wasaail al Shiah vol 14, pg. 411. 
____________________________
39. Isa (A.S.) Weeps 

Imam A'li (A.S.) said to Ibn A'bbas: 

(Once when he happened to pass by Karbala’), Isa (A.S.) sat down and began to weep. His disciples who were observing him, followed suit and began weeping too, but not comprehending the reason for this behaviour, they asked him: "O' Spirit of God! What is it that makes you weep?" Isa (A.S.) said: "Do you know what land this is?" The disciples replied: "No." He then said: "This is the land on, which the son of the Prophet Ahmad (S) shall be killed. 

Bihar al Anwar vol 44 pg. 252. 
____________________________
40. All Creatures Weep over Imam Husayn (A.S.) 

Abu Baseer narrates that Imam Baqir (A.S.) said: 

The humans, the jinn, the birds and the wild beasts (all) mourned and wept over (the tragedy which befell) Husayn Ibn A'li (A.S.) 

Kaamil al‐Ziyaaraat, pg. 79.''';

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar:
          AppBar(
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [

              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      fontSize--;
                    });
                  }),
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      fontSize++;
                    });
                  }),
              FlutterSwitch(
                width: 45.0,
                height: 25.0,
                toggleSize: 20.0,
                value: Provider.of<AppStateNotifier>(context).isDarkMode,
                borderRadius: 45.0,
                padding: 1.0,
                activeToggleColor: Color(0xFF6E40C9),
                inactiveToggleColor: Color(0xFF2F363D),
                activeSwitchBorder: Border.all(
                  color: Colors.black38,
                  width: 1.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Color(0xFFD1D5DA),
                  width: 1.0,
                ),
                activeColor: Colors.white24,
                inactiveColor: Colors.white,
                activeIcon: Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (val) {
                  Provider.of<AppStateNotifier>(context, listen: false)
                      .updateTheme(val);
                },
              ),
              const SizedBox(
                width: 7,
              ),
            ],
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back)),

            title: Text(
              '40 Hadith on Azadari',
              style: const TextStyle(fontSize: 16),
            ),



          ),

          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: ListView.separated(
              separatorBuilder: (context, i) => Divider(),
              itemCount: hadiths.length,
              itemBuilder: (context, i) => Column(
                children: [
                  SelectableText(
                    hadiths[i],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: appState.isDarkMode ? Colors.white : const Color(0xffa80000),
                      fontSize: fontSize,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.favorite,
                      //     color: Colors.red,
                      //   ),
                      //   onPressed: () {

                      //   },
                      // ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Share.share(hadiths[i]);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
