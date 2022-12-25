import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../bottomSheet/bottom_sheet.dart';
import '../bottomSheet/titled_sheet.dart';
import '../widgets/buttons/custom_ink_well.dart';
import '../widgets/selection_box.dart';
import 'image_picker.dart';




class CustomImagePicker extends StatelessWidget {

  final Widget child;
  final ValueChanged onReceiveFilePath;

  const CustomImagePicker({Key? key,
    required this.child,
    required this.onReceiveFilePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserRepository user=Get.put(UserRepository());
    return CustomInkWell(
      color: Colors.transparent,
        onTap: (){
        CustomBottomSheet.open(context,
            child: TitledSheet(title: "Choose Image", child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInkWell(
                  onTap: () async{
                    Navigator.pop(context);
                    CroppedFile? filePath= await MyImagePicker.pickImageFromCamera();
                    onReceiveFilePath(filePath?.path);
                  },
                  child:  const SelectionBox(
                    title: "Camera",
                    iconData: Icons.camera_alt,
                    description: "Click image using camera",
                    image: 'assets/camera.png',
                  ),
                ),

                CustomInkWell(
                  onTap: () async{
                    Navigator.pop(context);
                    CroppedFile filePath= await MyImagePicker.pickImageFromGallery();
                    onReceiveFilePath(filePath.path);
                  },
                  child:  const SelectionBox(
                    title: "Gallery",
                    iconData: Icons.image,
                    description: "Select Image from gallery",
                    image: 'assets/gallery.png',
                  ),
                ),
              ],
            )
            ));
      }, child: child);
  }
}
