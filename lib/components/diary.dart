import 'package:diary/views/photoViewPage.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  @override
  DiaryState createState() => DiaryState();
}

const data = [
  {
    'time': '17:20',
    'day': '今天',
    'title': '随想',
    'content': '我们无法拉伸生命的长度，但是我们可以拓宽生命的宽度，这句话就是告诉你，这辈子，长高就别想了，长胖是可以的，努力吧。',
    'imageList': [
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5771cce9e1.jpg',
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5eacd5aee1.jpg'
    ],
    'audio': '',
    'video': '',
    'flag': 0
  },
  {
    'time': '17:20',
    'day': '昨天',
    'title': '这梦幻喧嚣，打扰了',
    'content': '',
    'imageList': [
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5771cce9e1.jpg',
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5eacd5aee1.jpg'
    ],
    'audio': '',
    'video': '',
    'flag': 1
  },
  {
    'time': '17:20',
    'day': '今天',
    'title': '此刻的心情',
    'content': '',
    'imageList': [
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5771cce9e1.jpg',
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5eacd5aee1.jpg'
    ],
    'audio': '',
    'video': '',
    'flag': 2
  },
  {
    'time': '17:20',
    'day': '昨天',
    'title': '这梦幻喧嚣，打扰了',
    'content': '',
    'imageList': [
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5771cce9e1.jpg',
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5eacd5aee1.jpg'
    ],
    'audio': '',
    'video': '',
    'flag': 1
  },{
    'time': '17:20',
    'day': '今天',
    'title': '随想',
    'content': '我们无法拉伸生命的长度，但是我们可以拓宽生命的宽度，这句话就是告诉你，这辈子，长高就别想了，长胖是可以的，努力吧。',
    'imageList': [
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5771cce9e1.jpg',
      'http://www.yoka.com/dna/pics/ba1eadb7/d3dd57add5eacd5aee1.jpg'
    ],
    'audio': '',
    'video': '',
    'flag': 0
  }
];

class DiaryState extends State<Diary> {
  Widget build(BuildContext context) {
    List<Widget> diaryItems = [];
    int index = 0;
    for (var item in data) {
      if (index == 0) {
        diaryItems.add(diaryItem(0, item['flag'],index));
      } else {
        diaryItems.add(diaryItem(1, item['flag'],index));
      }
      index++;
    }

    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: diaryItems
        ));
  }

  diaryItem(int index, int flag, int itemIndex) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[BaseCard(index, flag, itemIndex)],
      ),
    );
  }
}

class BaseCard extends StatefulWidget {
  int index;
  int flag;
  int itemIndex;
  @override
  BaseCard(int index, int flag,int itemIndex) {
    this.index = index;
    this.flag = flag;
    this.itemIndex = itemIndex;
  }
  BaseCardState createState() => BaseCardState(this.index, this.flag, this.itemIndex);
}

class BaseCardState extends State<BaseCard> {
  int index;
  int flag;
  bool isPlay = false;
  int itemIndex;
  BaseCardState(int index, int flag,int itemIndex) {
    this.index = index;
    this.flag = flag;
    this.itemIndex = itemIndex;
  }
  Widget build(BuildContext context) {
    Widget baseCard;
    if (this.flag == 0) {
      baseCard = baseCardContent(cardContent(), this.flag);
    } else if (this.flag == 1) {
      baseCard = baseCardContent(cardContentImg(), this.flag);
    } else if (this.flag == 2) {
      baseCard = baseCardContent(cardContentAudio(), this.flag);
    }
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[cardTitle(), baseCard],
      ),
    );
  }

  cardTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10, top: 6),
          child: Text(
            data[this.itemIndex]['time'],
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color.fromRGBO(214, 225, 255, 1),
                fontSize: 25,
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
              data[this.itemIndex]['day'],
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color.fromRGBO(214, 225, 255, 1),
                  fontSize: 25,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none)),
        )
      ],
    );
  }

  cardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            data[this.itemIndex]['title'],
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 10),
          width: MediaQuery.of(context).size.width - 110,
          child: Wrap(
            children: <Widget>[
              Text(
                data[this.itemIndex]['content'],
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(214, 225, 255, 1),
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
      ],
    );
  }

  cardContentImg() {
    List<Widget> cardImgs = [];
    for(var img in data[this.itemIndex]['imageList']){
      cardImgs.add(
        Padding(
          padding: EdgeInsets.only(left: 22),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: (MediaQuery.of(context).size.width - 140) / 2,
              child: cardImageItem(
                  img),
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 10, top: 5),
          width: MediaQuery.of(context).size.width - 110,
          child: Wrap(
            children: <Widget>[
              Text(
                data[this.itemIndex]['title'],
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(214, 225, 255, 1),
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Row(
            children: cardImgs,
          ),
        )
      ],
    );
  }

  cardImageItem(String imgUrl) {
    return Material(
      child: Ink(
          child: InkWell(
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
          height: 180,
          width: 130,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PhotoViewSimpleScreen(
              imageProvider: NetworkImage(imgUrl),
              heroTag: 'simple',
            );
          }));
        },
      )),
    );
  }

  cardContentAudio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            data[this.itemIndex]['title'],
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            width: MediaQuery.of(context).size.width - 110,
            child: Card(
                color: Color.fromRGBO(235, 240, 250, 1),
                margin: EdgeInsets.only(top: 6),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        clipBehavior: Clip.antiAlias,
                        child: Ink(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  isPlay = !isPlay;
                                });
                              },
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    isPlay ? Icons.pause : Icons.play_arrow,
                                    color: Color.fromRGBO(117, 135, 170, 1),
                                    size: 30,
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ))),
      ],
    );
  }

  baseCardContent(Widget cardItem, int flag) {
    double _top = 0;
    if (flag == 0 || flag == 2) {
      _top = 15;
    } else if (flag == 1) {
      _top = 10;
    }
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 0),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 6,
            top: index == 0 ? 18 : 0,
            bottom: 0,
            child: VerticalDivider(
              width: 1,
              color: Color.fromRGBO(104, 111, 126, 1),
            ),
          ),
          Positioned(
              left: 0,
              top: _top,
              child: Container(
                width: 12,
                height: 12,
                child: Material(
                  color: Color.fromRGBO(86, 91, 102, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  clipBehavior: Clip.antiAlias,
                ),
              )),
          cardItem
        ],
      ),
    );
  }
}
