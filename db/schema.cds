namespace officeLibrary;

entity Books {
  key ID: UUID;
  title: String(50) @assert.unique @mandatory;
  publicationDate: Date;
  genre: String(50);
  status: String(10);
  statusCriticality: Integer @odata.Type: 'Edm.Byte';
  Author: Association to Authors;
}

entity Authors {
  key ID: UUID;
  name: String(50) @assert.unique @mandatory;
}
