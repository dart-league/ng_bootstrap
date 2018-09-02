part of bs_table_directives;

@Directive(selector: 'template[bs-column-editor]')
class BsColumnEditorDirective {

  BsColumnEditorDirective(this.templateRef);

  TemplateRef templateRef;
}
