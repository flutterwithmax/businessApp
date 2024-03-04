import '/models/topic.dart';
import '/screens/drawer.dart';
import '/screens/search_screen.dart';
import '/screens/topic_details.dart';
import '/widgets/card.dart';
import '/widgets/search_panel.dart';
import '/widgets/topic_item.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Topic> list = [
    Topic(title: 'Greetings', imagePath: 'assets/images/greeting.png'),
    Topic(title: 'Appointment', imagePath: 'assets/images/appointment.png'),
    Topic(title: 'Career', imagePath: 'assets/images/career.png'),
    Topic(title: 'Office', imagePath: 'assets/images/office.png'),
    Topic(title: 'Telephoning', imagePath: 'assets/images/telephoning.png'),
    Topic(title: 'Email', imagePath: 'assets/images/email.png'),
    Topic(title: 'Purchases', imagePath: 'assets/images/purchasing.png'),
    Topic(title: 'Job Interview', imagePath: 'assets/images/interview.png'),
    Topic(title: 'Complaints', imagePath: 'assets/images/complaining.png'),
    Topic(title: 'Advertisement', imagePath: 'assets/images/ads.png'),
    Topic(title: 'Leadership', imagePath: 'assets/images/leadership.png'),
    Topic(title: 'Presentation', imagePath: 'assets/images/presentation.png'),
    Topic(title: 'Business Deal', imagePath: 'assets/images/deal.png'),
    Topic(title: 'Banking', imagePath: 'assets/images/bank.png'),
    Topic(
        title: 'International Business', imagePath: 'assets/images/global.png'),
  ];

  var index = 0;
  bool visBool = true;
  @override
  Widget build(BuildContext context) {
    Widget _buildIcon(String imagePath, Color color) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
    );
    }

    BottomNavigationBarItem _buildBottomNavigationBarItem(
        String label, String imagePath, int itemIndex) {
      return BottomNavigationBarItem(
        label: label,
        icon: _buildIcon(
            imagePath,
            index == itemIndex
                ? Colors.blue
                : const Color.fromARGB(255, 76, 76, 76)),
      );
    }

    return Scaffold(

      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showSettingsPopup(context);
            },
          ),
         
        ],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Business English',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  )),
              child: const SearchPanel()),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: visBool,
            child: Dismissible(
              key: GlobalKey(),
              onDismissed: (direction) {
                setState(() {
                  visBool =false;
                });
              },
              child: const CardHolder(
                uzWord: 'kelishmoq/muzokara olib bormoq',
                engWord: 'to negotiate',
                transcription: "/nɪˈɡoʊ.ʃi.eɪt/",
                title: '*Kunlik So`z',
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ), 
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TopicScreen(topic: list[index]),
                  ));
                },
                child: TopicItem(
                    title: list[index].title, imgPath: list[index].imagePath),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          _buildBottomNavigationBarItem(
              'Asosiy', 'assets/images/main_icon.png', 0),
          _buildBottomNavigationBarItem('Testlar', 'assets/images/quiz.png', 1),
          _buildBottomNavigationBarItem(
              'Sozlamalar', 'assets/images/settings.png', 2),
        ],
      ),
    );
  }
}

void showSettingsPopup(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  final overlayRect = Rect.fromPoints(
    overlay.localToGlobal(overlay.semanticBounds.topRight),
    overlay.localToGlobal(overlay.semanticBounds.bottomRight),
  );

  final position = RelativeRect.fromRect(
    overlayRect,
    Offset.zero & overlay.size,
  );

  final popupWidth = 70.0;
  final popupHeight = 40.0;

  showMenu<String>(
    context: context,
    position: position,
    items: [
      PopupMenuItem<String>(
        value: 'settings',
        child: SizedBox(
          width: popupWidth,
          height: popupHeight,
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
