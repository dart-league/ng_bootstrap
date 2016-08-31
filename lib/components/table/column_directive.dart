part of bs_table_directives;

/// Directive to create columns for [BsTableComponent]
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

  /// Creates a [BsColumnDirective] and add it to it's parent [_tableComponent]
  BsColumnDirective(this._tableComponent);

  /// Parent [_tableComponent]
  BsTableComponent _tableComponent;

  /// Initialize the [BsColumnDirective]
  @override
  ngOnInit() {
    _tableComponent.columns.add(this);
  }
}