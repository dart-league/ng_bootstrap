export "file_select_directive.dart";
export "file_drop_directive.dart";
import "file_select_directive.dart";
import "file_drop_directive.dart";

const bsFileUploadDirectives = const [BsFileSelectDirective, BsFileDropDirective];

@Deprecated('Renamed to "bsFileUploadDirectives"')
const BS_FILE_UPLOAD_DIRECTIVES = bsFileUploadDirectives;