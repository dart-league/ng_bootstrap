part of bs_table_directives;

@Directive(selector: 'template[bs-column-filterer]')
class BsColumnFiltererDirective {

  BsColumnFiltererDirective(this.templateRef);

  TemplateRef templateRef;
}