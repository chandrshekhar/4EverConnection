import 'dart:developer';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forever_connection/Feature/document_vault/Model/document_vault_list_model.dart';
import 'package:forever_connection/Feature/document_vault/Repo/document_repo.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/document_type_model.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/toast_widget.dart';

class DocumentsVaultController extends GetxController {
  RxBool isLoadingDocumentList = false.obs;
  // RxList<VaultDocumentData> documentValultDataList = <VaultDocumentData>[].obs;
  final DocumentRepo _documentRepo = DocumentRepo();
  RxList<DocumentTypeModel> documentTypes = <DocumentTypeModel>[].obs;
  RxList<DocumentVaultListModel> documentVaultList =
      <DocumentVaultListModel>[].obs;
  var searchForDocumentController = TextEditingController().obs;
  RxInt documentTypeId = (-1).obs;
  RxString choosenFilename = RxString("");
  final documentDescControler = TextEditingController().obs;

  final TextEditingController documentSearchController = TextEditingController();




  RxBool uplodDocument = false.obs;
  // RxString files = ''.obs;
  Rx<File?> files = Rx<File?>(null);
  Dio dio = Dio();

  final List<ImagePickerList> chatPickerList = [
    ImagePickerList(
        "File",
        Icon(
          Icons.file_copy,
          color: AppColors.lightBlue,
        )),
    ImagePickerList(
        'Gallery',
        Icon(
          Icons.image,
          color: AppColors.lightBlue,
        )),
    ImagePickerList(
        'Camera',
        Icon(
          Icons.camera_alt_rounded,
          color: AppColors.lightBlue,
        ))
  ];

  setSearchValue(String value) {
    searchForDocumentController.value.text = value;
  }

  setDocumentId(value) {
    documentTypeId.value = value;
  }

  // get docuement type controller
  getDocumentType() async {
    try {
      var resp = await _documentRepo.getSelectedProfession();
      documentTypes.value = resp;
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

  // get vault document list
  getVaultDocumentList({String? query}) async {
    isLoadingDocumentList(true);
    try {
      var resp = await _documentRepo.getDocumentVaultList(query??"");
      if (kDebugMode) {
        log(resp.toString());
      }
      documentVaultList.value = resp;
      documentVaultList
          .sort((a, b) => b.publicationDate!.compareTo(a.publicationDate!));

      isLoadingDocumentList(false);
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      isLoadingDocumentList(false);
    }
  }
  // update document vault description

  updateDocumentVaultDescription({int? id, String? name, String? desc}) async {
    isLoadingDocumentList(true);
    try {
      var resp = await _documentRepo.updateDocumentDesc(
          id: id, name: name, desc: desc);
      await getVaultDocumentList();
      ToastWidget.successToast(success: "Update Successfully");
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }

  // delete document vault

  deleteDocumentVault({
    int? id,
  }) async {
    isLoadingDocumentList(true);
    try {
      var resp = await _documentRepo.deleteDocument(
        id: id,
      );
      await getVaultDocumentList();
      ToastWidget.successToast(success: resp['message']);
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }
// send email with document

  Future<void> sendEmail(String attachmentUrl, String path) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: path,
      queryParameters: {
        'subject': "Document vault Attachment",
        'body': "I send the document vault attachemnt.",
        'attachment': attachmentUrl,
      },
    );

    if (await launchUrl(Uri.parse(emailLaunchUri.toString()))) {
      await launchUrl(Uri.parse(emailLaunchUri.toString()));
    } else {
      throw 'Could not launch email';
    }
  }

  // print document
  void printDocument(String documentUrl) async {
    var url = Uri.parse(documentUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  // print document with ---

  Future<String> saveNetworkImageToLocalTempFileWithDio(String imageUrl) async {
    try {
      final tempDir = await getApplicationDocumentsDirectory();

      // Generate a unique file name
      final String fileName =
          'temp_image_${DateTime.now().millisecondsSinceEpoch}.png';

      // Create a File instance with the temporary directory and file name
      final File file = File('${tempDir.path}/$fileName');

      // Download the image using Dio and save it to the local file
      await dio.download(imageUrl, file.path);

      // Return the path of the saved file
      return file.path;
    } catch (error) {
      // Handle errors, for example, print the error message
      print('Error: $error');
      throw error; // Propagate the error to the calling code
    }
  }

  Future<void> printImage(String imageUrl) async {
    try {
      final String imagePath =
          await saveNetworkImageToLocalTempFileWithDio(imageUrl);

      // Do something with the image path, for example, print it
      print('Image saved at: $imagePath');
      final pdf = await rootBundle.load(imagePath);
      await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
    } catch (error) {
      // Handle errors, for example, print the error message
      print('Error: $error');
    }
  }

  // download file fsavePath
  Future download2(String url) async {
    String fileName = url.split("/").last.toString();
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final savePath = '${appDocumentsDirectory.path}/$fileName';
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  downloadforAndroid() async {}
  void showPermissionRationale(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Permission Required"),
          content:
              Text("Storage permission is required to perform this action."),
          actions: <Widget>[
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Open Settings"),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<bool> saveVideo(
      String url, String fileName, BuildContext context) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.manageExternalStorage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/forEver";
          directory = Directory(newPath);
        } else {
          showPermissionRationale(context);
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          progress = value1 / value2;
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  downloadFile(String url, BuildContext context) async {
    // var res = await CsvFileDownload().getDownloadUrl();

    String fileName = url.toString().split("/").last;
    bool downloaded = await saveVideo(url, fileName, context);
    if (downloaded) {
      ToastWidget.successToast(success: "File Downloaded-->");
    } else {
      ToastWidget.errorToast(error: "Failed to download file");
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      // ToastWidget.successToast(success: "Downloading");
      print((received / total * 100).toStringAsFixed(0) + "%");
      ToastWidget.successToast(success: "downloaded");
    }
  }

  // download file azhar

  bool loading = false;
  double progress = 0;

  Future<bool> saveFile(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage) &&
            await _requestPermission(Permission.accessMediaLocation) &&
            await _requestPermission(Permission.manageExternalStorage)) {
          directory = (await getExternalStorageDirectory())!;
          print(directory.path);
          String newPath = "";
          List<String> folders = directory.path.split("/");
          for (int x = 1; x < folders.length; x++) {
            String folder = folders[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/4everConnection";
          directory = Directory(newPath);
          print(directory.path);
          return true;
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      if (!await directory.exists()) {
        directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File(directory.path + "/$fileName");
        await dio.download(
          url,
          saveFile.path,
        );
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  addFileDocumentVault() async {
    try {
      uplodDocument(true);
      await _documentRepo.uploadDocument(
          id: documentTypeId.value,
          desc: documentDescControler.value.text.trim(),
          file: files.value!);
      documentTypeId.value = -1;
      searchForDocumentController.value.text = "";
      documentDescControler.value.clear();
      files.value = null;
      choosenFilename.value = "";
      uplodDocument(false);
      getVaultDocumentList();
      getDocumentType();
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
      uplodDocument(false);
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
      ],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      final fileName = file.path!.split("/").last;
      print(fileName);
      print("FileName--> $fileName");
      choosenFilename.value = fileName;
      files.value = File(file.path!);
    } else {
      // User canceled the picker
    }
  }

  Future pickImageFromGallery() async {
    try {
      final images = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (images != null) {
        final fileName = images.path.split("/").last;
        print("fileName-> $fileName");
        choosenFilename.value = fileName;
        files.value = File(images.path);
      } else {
        print("data is null");
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 75);
      if (image == null) return;
      final imageTemp = File(image.path);
      final fileName = imageTemp.path.split("/").last;
      print("fileName-> $fileName");
      choosenFilename.value = fileName;
      files.value = File(image.path);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        log('Failed to pick image: $e');
      }
    }
  }

  @override
  void onInit() {
    getVaultDocumentList();
    getDocumentType();
    super.onInit();
  }
}

class ImagePickerList {
  final String? title;
  final Widget? icon;
  ImagePickerList(this.title, this.icon);
}
