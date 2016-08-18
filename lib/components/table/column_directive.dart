part of table_directives;

@Directive(selector: 'bs-column')
class BsColumnDirective implements OnInit {
  /// Handles the sort of the column. It could have next values:
  ///
  /// * 'ASC': for ascending sorting
  /// * 'DESC': for descending sorting
  /// * 'NONE': for non-sorting
  /// * 'NO_SORTABLE': for column not sortable
  @Input() String sort;

  /// Name of the field associated with the column
  @Input() String fieldName;

  /// Value displayed in the column header
  @Input() String header;


  BsColumnDirective(this.tableComponent);

  BsTableComponent tableComponent;

  @override
  ngOnInit() {
    tableComponent.columns.add(this);
  }
}