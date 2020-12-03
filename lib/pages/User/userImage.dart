

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/repository/user_repository.dart';
class UserImage extends StatefulWidget{
  @override
  _UserImage createState() => _UserImage();


}

class _UserImage extends State<UserImage>{

  SharedPreferences user;
  Size size;
  File imageSelected;
  UserRepository userRepository = UserRepository();

  _Gallery() async{
    var imagePicker = ImagePicker();
    var picture=await imagePicker.getImage(source:  ImageSource.gallery);
    if(picture!=null){
      this.setState(() {
        imageSelected=File(picture.path);
      });
    }
  }

  _Camera() async{

    var imagePicker = ImagePicker();
    var picture=await imagePicker.getImage(source:  ImageSource.camera);
    if(picture!=null){
      this.setState(() {
        imageSelected =File(picture.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondoRegistro.jpg'),
                    fit: BoxFit.fill
                )
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height*0.08),
                child: Center(
                  child: Text("Subir imagen",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Container(
                height:size.height*0.3,
                width: size.width*0.7,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(size.height*0.01),
                  image: DecorationImage(
                    image: imageSelected!=null?FileImage(imageSelected):AssetImage("assets/images/fotoperfil.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width*0.2,
                      height: size.height*0.1,
                      //color: color5,
                      child: FlatButton(
                        onPressed: () async{
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserImage()));
                          print('foto');
                          _Camera();

                          },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: color4,
                        ),
                        highlightColor: color1,
                      ),
                      decoration: BoxDecoration(
                        color: color9,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    SizedBox(
                      width: size.width*0.1
                    ),
                    Container(
                      width: size.width*0.2,
                      height: size.height*0.1,
                      //color: color5,
                      child: FlatButton(
                        onPressed: ()async{
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserImage()));
                          print('galería');
                          _Gallery();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(
                          Icons.image,
                          color: color2,
                        ),
                        highlightColor: color1,
                      ),
                      decoration: BoxDecoration(
                        color: color9,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: size.height*0.05
              ),
              Container(
                alignment: Alignment.center,
                width: size.width*0.2,
                height: size.height*0.1,
                //color: color5,
                child: FlatButton(
                  onPressed: ()async{
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserImage()));
                    print('guarda');
                    bool flag = await Check();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.add,
                    color: color4,
                  ),
                  highlightColor: color1,
                ),
                decoration: BoxDecoration(
                  color: color9,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<bool> Check()async{
    bool x =false;
    if(imageSelected!=null){
      user =await SharedPreferences.getInstance();
      int id = user.getInt("id");
      print(id);
      bool res = await userRepository.updateImage(imageSelected, id);
      if(res){
        print('Imagen subida');
      }
      else{
        print('Problema');
      }
      x = true;
    }else{
      Fluttertoast.showToast(
          msg: "Ninguna imagen seleccionada",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: color3,
          textColor: color1,
          fontSize: 16.0
      );
    }
    return x;
  }
}