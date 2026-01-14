# Office Library

SAP CAP application for managing books and authors.

## Setup

Install dependencies:
```bash
npm install
```

Initialize the database:
```bash
./node_modules/.bin/cds-deploy --to sqlite
```

Start the server:
```bash
npm run cds-watch
```

The server runs on http://localhost:4004

## Access

- UI: http://localhost:4004/libraryapp/webapp/index.html
- OData service: http://localhost:4004/odata/v4/office-library-srv/

## Project Structure

```
app/libraryapp/webapp/    # UI5 frontend
db/schema.cds             # Data model
srv/service.cds           # Service definitions
srv/server.js             # Server config
```

## Scripts

- `npm run cds-watch` - Start dev server
- `npm start` - Start production server
- `./node_modules/.bin/cds-deploy --to sqlite` - Initialize/update database

## Database

SQLite database file: `db.sqlite`

View contents:
```bash
sqlite3 db.sqlite
.tables
SELECT * FROM officeLibrary_Books;
```
