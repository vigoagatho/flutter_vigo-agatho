import 'package:flutter/material.dart';
import 'detailPage.dart';

List<ImageDetails> _image = [
  ImageDetails(
    name: 'Olivia Hye (Son Hyejoo)',
    imPath: 'https://i.imgur.com/QvrdeWB.png',
    gBand: 'LOONA',
    bDate: 'November 13, 2001'
  ),
  ImageDetails(
    name: 'Jeon Heejin',
    imPath: 'https://i.imgur.com/zB2T061.jpeg',
    gBand: 'LOONA',
    bDate: 'October 19, 2000'
  ),
  ImageDetails(
    name: 'Im Yeojin',
    imPath: 'http://pm1.narvii.com/7056/710393f7c575ab97b7d29a43a3c22dbe9ad21e05r1-675-1200v2_uhq.jpg',
    gBand: 'LOONA',
    bDate: 'November 11, 2002'
  ),
  ImageDetails(
    name: 'An Yujin',
    imPath: 'https://i.pinimg.com/736x/5b/ed/72/5bed724d4b46f2ad825eae1c9cd96ec4.jpg' ,
    gBand: 'IVE',
    bDate: 'September 1, 2003'
  ),
  ImageDetails(
    name: 'Naoi Rei',
    imPath: 'https://i.pinimg.com/736x/d6/c1/8f/d6c18f28eeccec916317166280f283d3.jpg',
    gBand: 'IVE',
    bDate: 'February 3, 2004'
  ),
  ImageDetails(
    name: 'Kim Gaeul',
    imPath: 'https://i.pinimg.com/originals/6a/5e/a2/6a5ea2b29b3ca30fb754e30583fbdbc2.jpg',
    gBand: 'IVE',
    bDate: 'September 24, 2002'
  ),
  ImageDetails(
    name: 'Park Sieun',
    imPath: 'https://cdn.idntimes.com/content-images/community/2020/12/fromandroid-4d10b015d047dd6973cb6833832b7e7c.jpg',
    gBand: 'STAYC',
    bDate: 'August 1, 2001',
  ),
  ImageDetails(
    name: 'J (Jang Yeeun)',
    imPath: 'https://kpopping.com/documents/a2/1/220816-STAYC-J-documents-1.jpeg?v=1fb1e',
    gBand: 'STAYC',
    bDate: 'December 9, 2004',
  ),
  ImageDetails(
    name: 'Isa (Lee Chaeyoung)',
    imPath: 'https://kprofiles.com/wp-content/uploads/2020/09/2DB40892-AE88-49AE-9D54-39550771C3E7-534x800.jpeg',
    gBand: 'STAYC',
    bDate: 'January 23, 2002',
  ),
  ImageDetails(
    name: 'Minnie',
    imPath: 'https://w0.peakpx.com/wallpaper/393/65/HD-wallpaper-minnie-g-idle-g-idle-gidle-idle-korea-kpop-music-nicha-yontararak-thailand.jpg',
    gBand: '(G)I-DLE',
    bDate: 'October 23, 1997',
  ),
  ImageDetails(
    name: 'Song Yuqi',
    imPath: 'https://pbs.twimg.com/media/DcWXaj5X4AAgiGd.jpg',
    gBand: '(G)I-DLE',
    bDate: 'September 23, 1999',
  ),
  ImageDetails(
    name: 'Miyeon',
    imPath: 'https://pbs.twimg.com/media/DvzeK5XU0AEbHTD.jpg',
    gBand: '(G)I-DLE',
    bDate: 'January 31, 1997',
  ),
  ImageDetails(
    name: 'Karina (Yu Jimin)',
    imPath: 'https://cdn-cas.orami.co.id/parenting/images/Karina_4.width-1000.jpg',
    gBand: 'AESPA',
    bDate: 'April 11, 2000'
  ),
  ImageDetails(
    name: 'Winter (Kim Minjeong)',
    imPath: 'https://64.media.tumblr.com/08d5c90d3887630a5b6921435bfd2653/688bf7cb351e0492-15/s1280x1920/0a37c27c280306ff7ee0e41e04babc1b5c70ab68.png',
    gBand: 'AESPA',
    bDate: 'January 1, 2001'
  ),
  ImageDetails(
    name: 'Giselle (Uchinaga Aeri)',
    imPath: 'https://i.pinimg.com/736x/e3/ce/fc/e3cefc0587becce5cb7d3a26e1da1f5b.jpg',
    gBand: 'AESPA',
    bDate: 'October 30, 2000'
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Idol Gallery', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                   itemBuilder: (context, index){
                    return RawMaterialButton(
                      onPressed: (() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return DetailPage(
                              imPath: _image[index].imPath,
                              name:  _image[index].name,
                              gBand: _image[index].gBand,
                              bDate: _image[index].bDate,
                            );
                          })
                          );
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(_image[index].imPath),
                            fit: BoxFit.cover
                            )
                        ),
                      ),
                      );
                   },
                   itemCount: _image.length,
                   ),
              ))
          ],
        ),)
    );
  }
}

class ImageDetails {
  final String imPath;
  final String name;
  final String bDate;
  final String gBand;
  ImageDetails({this.name, this.imPath, this.gBand, this.bDate});
}


