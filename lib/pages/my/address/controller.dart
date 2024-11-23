import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:woo_store/models/index.dart';
import 'package:woo_store/services/index.dart';

class AddressController extends GetxController {
  AddressController(this.type);
  final String? type;

  // 表单 form
  GlobalKey formKey = GlobalKey<FormState>();

  // 输入框控制器
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  // TextEditingController statesController = TextEditingController();

  String? initData;
  String selected_1 = '';
  final List<Map> data = [
    {
      "label": '北京市',
      "value": '110000',
      "children": [
        {
          "value": '110100',
          "label": '北京市',
          "children": [
            {"value": '110101', "label": '东城区'},
            {"value": '1101022', "label": '东区'},
            {"value": '110102', "label": '西城区'},
            {"value": '110105', "label": '朝阳区'},
            {"value": '110106', "label": '丰台区'},
            {"value": '110107', "label": '石景山区'},
            {"value": '110108', "label": '海淀区'},
            {"value": '110109', "label": '门头沟区'},
          ],
        },
      ],
    },
    {
      "label": '天津市',
      "value": '120000',
      "children": [
        {
          "value": '120100',
          "label": '天津市',
          "children": [
            {
              "value": '120101',
              "label": '和平区',
            },
            {
              "value": '120102',
              "label": '河东区',
            },
            {
              "value": '120103',
              "label": '河西区',
            },
            {
              "value": '120104',
              "label": '南开区',
            },
            {
              "value": '120105',
              "label": '河北区',
            },
            {
              "value": '120106',
              "label": '红桥区',
            },
            {
              "value": '120110',
              "label": '东丽区',
            },
            {
              "value": '120111',
              "label": '西青区',
            },
            {
              "value": '120112',
              "label": '津南区',
            },
          ],
        },
      ],
    },
  ];

  Future<void> _initData() async {
    // 用户数据初始
    UserProfileModel profile = UserService.to.profile;
    if (type == "Billing") {
      firstNameController.text = profile.billing?.firstName ?? "";
      lastNameController.text = profile.billing?.lastName ?? "";
      postCodeController.text = profile.billing?.postcode ?? "";
      cityController.text = profile.billing?.city ?? "";
      address1Controller.text = profile.billing?.address1 ?? "";
      address2Controller.text = profile.billing?.address2 ?? "";
      companyController.text = profile.billing?.company ?? "";
      phoneNumberController.text = profile.billing?.phone ?? "";
      emailController.text = profile.billing?.email ?? "";
      // countryController.text = profile.billing?.country ?? "";
      // statesController.text = profile.billing?.state ?? "";
    } else {
      firstNameController.text = profile.shipping?.firstName ?? "";
      lastNameController.text = profile.shipping?.lastName ?? "";
      postCodeController.text = profile.shipping?.postcode ?? "";
      cityController.text = profile.shipping?.city ?? "";
      address1Controller.text = profile.shipping?.address1 ?? "";
      address2Controller.text = profile.shipping?.address2 ?? "";
      companyController.text = profile.shipping?.company ?? "";
      // countryController.text = profile.shipping?.country ?? "";
      // statesController.text = profile.shipping?.state ?? "";
    }

    // 国家代码
    // String countryCode = countryController.text;

    update(["address"]);
  }

  changeCity(List<MultiCascaderListModel> selectData) {
    // Console.log(selectData);
    List result = [];
    int len = selectData.length;
    initData = selectData[len - 1].value!;
    for (var element in selectData) {
      result.add(element.label);
    }
    selected_1 = result.join('/');
    update(["address"]);
  }

  onSave() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
