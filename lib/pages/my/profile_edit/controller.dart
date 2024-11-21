import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:woo_store/utils/picker_image.dart';
import 'package:woo_store/widgets/index.dart';

class ProfileEditController extends GetxController {
  ProfileEditController();

  // 本机图片file
  File? filePhoto;

  // 选择图片
  onSelectPhoto(BuildContext context) {
    BottomSheetWidget.show(
      context: context,
      titleString: '选择照片上传',
      padding: 20,
      content: PickerImageWidget(
        ccc: context,
        // 拍照
        onTapTake: (AssetEntity? result) async {
          if (result != null) {
            filePhoto = await result.file;
            update(["profile_edit"]);
          }
        },
        // 相册
        onTapAlbum: (List<AssetEntity>? result) async {
          if (result != null && result.isNotEmpty) {
            filePhoto = await result.first.file;
            update(["profile_edit"]);
          }
        },
      ),
    );
  }
}
