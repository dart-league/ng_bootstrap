import 'dart:html';
import 'package:angular/angular.dart';
import 'package:ng_bootstrap/components/file_upload/file_upload.dart';
import 'package:ng_bootstrap/components/progress/progress.dart';

// const URL = '/api/';
const URL = 'https://evening-anchorage-3159.herokuapp.com/api/';

@Component(selector: 'file-upload-demo',
    templateUrl: 'file_upload_demo.html',
    styleUrls: ['file_upload_demo.css'],
    directives: [bsFileUploadDirectives, BsProgressComponent, coreDirectives],
    pipes: [DecimalPipe])
class FileUploadDemoComponent {
  bool hasBaseDropZoneOver = false;
  bool hasAnotherDropZoneOver = false;

  num progress = 0;

  bool isUploading = false;

  List<File> filesToUpload = [];

  void fileOverBase(dynamic e) {
    hasBaseDropZoneOver = e;
  }

  void fileOverAnother(dynamic e) {
    hasAnotherDropZoneOver = e;
  }

  final HttpRequest _xhr = HttpRequest();

  void save() {
    var formData = FormData();
    formData.append('hello', 'hi');
    for(var file in filesToUpload) {
      formData.appendBlob(file.name, file);
    }

    _xhr
      ..onLoad.listen((e) {
        print('loaded');
      })
      ..onError.listen((e) {
        print('error');
      })
      ..open('POST', '/')
      ..send(formData);
  }

  void cancel() {
    _xhr.abort();
  }
}
