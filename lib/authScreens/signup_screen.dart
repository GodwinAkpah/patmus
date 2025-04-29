import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patmus/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  XFile? imageFile;

  ImagePicker pickerImage = ImagePicker();
  Position ? position;
  List<Placemark> ? placeMark;
  String fullAddress = " ";
   

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
   TextEditingController confirmpasswordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  // TextEditingController restaurantNameTextEditingController = TextEditingController();


  pickImageFromGallery() async {
    imageFile = await pickerImage.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile;
    });
  }

  pickImageFromCamera() async {
    imageFile = await pickerImage.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile;
    });
  }

  // getCurrentLocation() async{
  //   // ignore: deprecated_member_use
  //   Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   placeMark = await placemarkFromCoordinates(cPosition.latitude, cPosition.longitude);
  //   Placemark placeMarkVar = placeMark![0];
  //   fullAddress = "${placeMarkVar.subThoroughfare} ${placeMarkVar.thoroughfare} ,${placeMarkVar.subLocality} ${placeMarkVar.locality}, ${placeMarkVar.subAdministrativeArea}, ${placeMarkVar.administrativeArea} ${placeMarkVar.postalCode}, ${placeMarkVar.country} ";
  //   locationTextEditingController.text = fullAddress;
  // }


  getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location services are disabled. Please enable them.'))
    );
    return;
  }

  // Check for permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied.'))
      );
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location permissions are permanently denied.'))
    );
    return;
  }

  // Now we can safely get the position
  Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  placeMark = await placemarkFromCoordinates(cPosition.latitude, cPosition.longitude);

  Placemark placeMarkVar = placeMark![0];

  fullAddress = "${placeMarkVar.subThoroughfare} ${placeMarkVar.thoroughfare}, ${placeMarkVar.subLocality} ${placeMarkVar.locality}, ${placeMarkVar.subAdministrativeArea} ${placeMarkVar.administrativeArea} ${placeMarkVar.postalCode}, ${placeMarkVar.country}";

  setState(() {
    locationTextEditingController.text = fullAddress;
  });
}

 
                             


  
  @override
  Widget build(BuildContext context) {
    return  
    SingleChildScrollView(
      child: Column (
        children: [
        const SizedBox(height: 11,),

        InkWell(
          onTap: () {
            pickImageFromGallery();
            // Perform sign-up action
          },
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.20,
            backgroundColor: Colors.white,
            backgroundImage: imageFile == null
                ?null
                : FileImage(File(imageFile!.path)) as ImageProvider,
                child: imageFile == null
                ?  Icon(
                    Icons.add_a_photo,
                    color: Colors.grey,
                    size: MediaQuery.of(context).size.width * 0.20, 
                  )
                : null,
          )
        ),
        const SizedBox(height: 10,),
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                textEditingController: nameTextEditingController,
                hintString: "Name",
                iconData: Icons.person,
                isObscure: false,
                enabled: true,
              ),
              CustomTextField(
                textEditingController: emailTextEditingController,
                hintString: "Email",
                iconData: Icons.email,
                isObscure: false,
                enabled: true,
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                textEditingController: passwordTextEditingController,
                hintString: "Password",
                iconData: Icons.lock,
                isObscure: true,
                enabled: true,
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                textEditingController: confirmpasswordTextEditingController,
                hintString: "Confirm Password",
                iconData: Icons.lock,
                isObscure: true,
                enabled: true,
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                textEditingController: phoneTextEditingController,
                hintString: "Phone Number",
                iconData: Icons.phone,
                isObscure: false,
                enabled: true,
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                textEditingController: locationTextEditingController,
                hintString: "Location",
                iconData: Icons.location_on_outlined,
                isObscure: false,
                enabled: true,
              ),

              Container(
                width: 398,
                height:39,
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    getCurrentLocation();
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  label: const Text(
                    "Get my Current Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                 icon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  ),

              )
              
              ),
         
              const SizedBox(height: 32,),
              ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Perform sign-up action
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
               const SizedBox(height: 32,),
            ],
          )
        )
        
      ],),
    );
  }
}