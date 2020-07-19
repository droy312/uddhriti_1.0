import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uddhriti/constants.dart';
import 'package:uddhriti/helpers/common_widgets/facility_button.dart';
import 'package:uddhriti/helpers/create_post_helpers/background_color.dart';
import 'package:uddhriti/helpers/create_post_helpers/edit_button.dart';
import 'package:uddhriti/helpers/create_post_helpers/text_size.dart';
import 'package:uddhriti/helpers/create_post_helpers/text_size_slider.dart';
import 'package:uddhriti/helpers/create_post_helpers/text_style.dart';
import 'package:uddhriti/helpers/create_post_helpers/text_style_panel.dart';
import 'package:uddhriti/models/user.dart';
import 'package:uddhriti/pages/home.dart';
import 'package:uddhriti/services/auth.dart';

class CreatePostScreen extends StatefulWidget {
  final User user;

  CreatePostScreen({this.user});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  Color currentBGColor = Colors.pink[100];
  bool showTextSizeSlider = false;
  bool showTextStylePanel = false;
  bool boldText, italicText, underlinedText = false;
  int quoteFontSize = 17;
  String quoteText = '';

  File imageFile;

  AuthService auth = AuthService();

  // Image picker
  Future<void> pickImage() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = selected;
    });
  }

  // clear image
  void clearImage() {
    setState(() {
      return imageFile = null;
    });
  }

  // Upload files
  bool isUploading = false;

  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://udi-test-1.appspot.com');

  StorageUploadTask uploadTask;

  void startUpload(
      {File file = null}) {
    // Image Upload
    String imageFilePath = widget.user.email + 'images/${DateTime.now()}.png';

    setState(() {
      uploadTask = storage.ref().child(imageFilePath).putFile(file);
    });
  }

//  Here we get the string or the quote that will be displayed
  updateQuoteText(String string) {
    setState(() {
      quoteText = string;
    });
  }

//  updating new background color of the post from the color picker
  updateBackgroundColor(Color color) {
    setState(() {
      currentBGColor = color;
    });
  }

// just a boolean value that allows to show the slider for text size when it is true
  updateShowTextSizeSlider(bool value) {
    setState(() {
      showTextSizeSlider = value;
    });
  }

// this updates the fontsize of the text or quote
  updateTextSize(int size) {
    setState(() {
      quoteFontSize = size;
    });
  }

// true value means it will show the text style panel at the bottom
  updateTextSizePanel(bool value) {
    setState(() {
      showTextStylePanel = value;
    });
  }

// true value means fontweight is bold
  updateBoldText(bool value) {
    setState(() {
      boldText = value;
    });
    print('bold text: $boldText');
  }

// true value means font style italic
  updateItalicText(bool value) {
    setState(() {
      italicText = value;
    });
    print('italic text: $italicText');
  }

// true value means text decoration is underlined
  updateUnderlinedText(bool value) {
    setState(() {
      underlinedText = value;
    });
    print('underlined text: $underlinedText');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
        title: Text(
          "Create Post",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[800],
            size: 25.0,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 70.0,
              // color: Colors.grey[200],
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  // *******************EDIT BUTTON****************
                  EditButton(
                    initialQuotetext: quoteText,
                    onQuoteTextChanged: updateQuoteText,
                  ),
                  // *****************CHANGE BACKGROUND COLOR*****************
                  ChangeBackgroundColor(
                    initialBackgroundColor: currentBGColor,
                    onBackgroundColorChanged: updateBackgroundColor,
                  ),
                  // ****************SHOW TEXT SIZE SLIDER**************
                  ChangeTextSize(
                    initialBoolValue: showTextSizeSlider,
                    showTextSizeSlider: updateShowTextSizeSlider,
                  ),
                  // ****************SHOW TEXT STYLE PANEL***************
                  ChangeTextStyle(
                    initialBoolValue: showTextStylePanel,
                    showTextStylePanel: updateTextSizePanel,
                  ),
                  // ****************BG IMAGE PICKER***************
                  facilityButton(
                    icon: Icons.photo_library,
                    label: 'Background',
                    onPressed: () => pickImage(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: currentBGColor,
                        alignment: Alignment.center,
                        child: imageFile == null
                            ? Container()
                            : Image.file(imageFile,
                                fit: BoxFit.cover), //TODO: ------------
                        // child: Text(
                        //   quoteText,
                        //   style: TextStyle(
                        //     fontSize: quoteFontSize.toDouble(),
                        //     color: Colors.black,
                        //     fontWeight: boldText == true
                        //         ? FontWeight.bold
                        //         : FontWeight.normal,
                        //     fontStyle: italicText == true
                        //         ? FontStyle.italic
                        //         : FontStyle.normal,
                        //     decoration: underlinedText == true
                        //         ? TextDecoration.underline
                        //         : TextDecoration.none,
                        //   ),
                        // ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          quoteText,
                          style: TextStyle(
                            fontSize: quoteFontSize.toDouble(),
                            color: Colors.black,
                            fontWeight: boldText == true
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontStyle: italicText == true
                                ? FontStyle.italic
                                : FontStyle.normal,
                            decoration: underlinedText == true
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 80.0,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: showTextSizeSlider
                  ? TextSizeSlider(
                      defaultFontSize: quoteFontSize.toDouble(),
                      onTextSizeChanged: updateTextSize,
                      onPressed: () {
                        setState(() {
                          showTextSizeSlider = false;
                        });
                      },
                    )
                  : showTextStylePanel
                      ? TextStylePanel(
                          boldText: updateBoldText,
                          italicText: updateItalicText,
                          underlinedText: updateUnderlinedText,
                          initialBoolBoldText: boldText,
                          initialBoolItalicText: italicText,
                          initialBoolUnderlinedText: underlinedText,
                          onStyleCancel: () {
                            setState(() {
                              boldText = false;
                              italicText = false;
                              underlinedText = false;
                            });
                          },
                          onPressed: () {
                            setState(() {
                              showTextStylePanel = false;
                            });
                          },
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Container(
                            //   height: 40.0,
                            //   width: 40.0,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(12.0),
                            //     border:
                            //         Border.all(color: Colors.pink, width: 3.0),
                            //     color: Colors.white,
                            //   ),
                            // ),

                            //* Upload file and text
                            uploadTask != null
                                ? StreamBuilder<StorageTaskEvent>(
                                    stream: uploadTask.events,
                                    builder: (context, snapshotVar) {
                                      if (uploadTask.isComplete)
                                        return Row(
                                          children: <Widget>[
                                            Icon(Icons.check_circle_outline,
                                                color: kPrimaryColor),
                                            SizedBox(width: 10),
                                            Text(
                                              'Upload Complete',
                                              style: TextStyle(
                                                  color: kPrimaryColor),
                                            ),
                                          ],
                                        );

                                      if (uploadTask.isInProgress)
                                        return SpinKitThreeBounce(
                                            color: kPrimaryColor, size: 20);
                                    },
                                  )
                                : FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        startUpload(
                                          file: imageFile,
                                        );
                                      });
                                    },
                                    color: Theme.of(context).primaryColor,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "UPLOAD",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        Icon(Icons.check_circle_outline,
                                            color: Colors.white, size: 20.0)
                                      ],
                                    ),
                                  ),

                            // Container(
                            //   height: 40.0,
                            //   width: 40.0,
                            //   decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     border:
                            //         Border.all(color: Colors.pink, width: 3.0),
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
