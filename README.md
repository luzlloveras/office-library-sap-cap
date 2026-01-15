# Office Library

SAP CAP app for managing books and authors.

## Setup

```bash
npm install
./node_modules/.bin/cds-deploy --to sqlite
npm run cds-watch
```

Server runs on http://localhost:4004

- UI: http://localhost:4004/libraryapp/webapp/index.html
- OData: http://localhost:4004/odata/v4/office-library-srv/

## Database

Uses SQLite (`db.sqlite`) in development. To inspect:

```bash
sqlite3 db.sqlite
```
