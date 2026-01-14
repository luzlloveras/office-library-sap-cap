using { officeLibrarySrv } from '../srv/service.cds';

annotate officeLibrarySrv.Books with {
  Author @Common.ValueList: {
    CollectionPath: 'Authors',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Author_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate officeLibrarySrv.Books with @UI.HeaderInfo: {
  TypeName: 'Book',
  TypeNamePlural: 'Books',
  Title: { Value: title }
};
annotate officeLibrarySrv.Books with {
  ID @UI.Hidden
};
annotate officeLibrarySrv.Books with @UI.Identification: [{ Value: title }];
annotate officeLibrarySrv.Books with {
  title @Common.Label: 'Title';
  publicationDate @Common.Label: 'Publication Date';
  genre @Common.Label: 'Genre';
  Author @Common.Label: 'Author'
};
annotate officeLibrarySrv.Books with {
  ID @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly };
  Author @Common.Text: { $value: Author.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate officeLibrarySrv.Books with @UI.SelectionFields: [
  Author_ID
];
annotate officeLibrarySrv.Books with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: publicationDate },
    { $Type: 'UI.DataField', Value: genre }
];
annotate officeLibrarySrv.Books with @UI.FieldGroup #GeneralInformationSection: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: publicationDate },
    { $Type: 'UI.DataField', Value: genre }
  ]
};

annotate officeLibrarySrv.Books with @UI.FieldGroup #AuthorInformationSection: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Author.name }
  ]
};


annotate officeLibrarySrv.Books with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'GeneralInformationSection', Label: 'General Information', Target: '@UI.FieldGroup#GeneralInformationSection' },
  { $Type: 'UI.ReferenceFacet', ID: 'AuthorInformationSection', Label: 'Author Information', Target: '@UI.FieldGroup#AuthorInformationSection' }
];
annotate officeLibrarySrv.Authors with @UI.HeaderInfo: {
  TypeName: 'Author',
  TypeNamePlural: 'Authors',
  Title: { Value: name }
};
annotate officeLibrarySrv.Authors with {
  ID @UI.Hidden
};
annotate officeLibrarySrv.Authors with @UI.Identification: [{ Value: name }];
annotate officeLibrarySrv.Authors with {
  name @Common.Label: 'Name'
};
annotate officeLibrarySrv.Authors with {
  ID @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly };
};
annotate officeLibrarySrv.Authors with @UI.SelectionFields: [
  name
];
annotate officeLibrarySrv.Authors with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name }
];
annotate officeLibrarySrv.Authors with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: name }
]};
annotate officeLibrarySrv.Authors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];