import 'package:bucket/HomeData.dart';
import 'package:flutter/material.dart';
import 'QuoteData.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool isLoading1 = true;
  var animeData;
  var animeHomeData;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchHomeData();
  }

  void fetchData() async {
    animeData = await QuoteData();
    setState(() {
      isLoading = false;
    });
  }
  void fetchHomeData() async {
    animeHomeData = await HomeData();
    setState(() {
      isLoading1 = false;
    });
  }

  int _currentIndex = 0;

  Widget buildBody() {
    switch (_currentIndex) {
      case 0:
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  title: Text(
                    animeHomeData[index][1],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle:
                      Text(
                        "RANK : "+(animeHomeData[index][0]).toString(),
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),

                  leading: Icon(
                    Icons.movie,
                    color: Colors.blue[800],
                  ),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                ),
              );
            },
          );
        }
      case 1: //title 2 , char 1 ,anime 0
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: animeData.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 3,
                child: ListTile(
                  title: Text(
                    animeData[index][2],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CHARACTER : "+animeData[index][1],
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "ANIME : "+animeData[index][0],
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  leading: Icon(
                    Icons.movie,
                    color: Colors.blue[800],
                  ),
                  tileColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                ),
              );
            },
          );
        }
      case 2:
        return Column(
          children: [
            Text("index 2"),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index; // update the current index
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'QUOTES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PERSON',
          ),
        ],
        //onTap: _onItemTapped,
      ),
    );
  }
}
