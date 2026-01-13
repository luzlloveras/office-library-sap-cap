# Office Library Application

A SAP Cloud Application Programming (CAP) application for managing a library with books and authors.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (LTS version recommended) - [Download here](https://nodejs.org/)
- **npm** (comes with Node.js)

To verify your installation:
```bash
node --version
npm --version
```

## Getting Started

### 1. Install Dependencies

Navigate to the project directory and install all required dependencies:

```bash
npm install
```

This will install all the necessary packages including:
- SAP CAP framework (`@sap/cds`)
- SQLite database adapter (`@cap-js/sqlite`)
- UI5 libraries and tools

### 2. Initialize the Database

Initialize the SQLite database with the required schema and sample data:

```bash
./node_modules/.bin/cds-deploy --to sqlite
```

This command will:
- Create the database file (`db.sqlite`)
- Set up all necessary tables (including draft tables for editing)
- Load sample data from CSV files

### 3. Start the Development Server

Start the development server:

```bash
npm run cds-watch
```

The server will start on **http://localhost:4004**

You should see output similar to:
```
[cds] - serving officeLibrarySrv { path: '/odata/v4/office-library-srv' }
[srv/server.js] 🚀 Servidor iniciado
```

### 4. Access the Application

Once the server is running, open your browser and navigate to:

- **Main Application UI**: http://localhost:4004/libraryapp/webapp/index.html
- **OData Service**: http://localhost:4004/odata/v4/office-library-srv/
- **Service Metadata**: http://localhost:4004/odata/v4/office-library-srv/$metadata

## Project Structure

```
office-library-sap-cap/
├── app/                    # Frontend application files
│   └── libraryapp/         # UI5 application
│       └── webapp/         # Web application files
├── db/                     # Database schema and data
│   ├── schema.cds          # Data model definitions
│   └── data/              # Sample data (CSV files)
├── srv/                    # Service layer
│   ├── service.cds         # Service definitions
│   └── server.js          # Server configuration
├── package.json            # Project dependencies and scripts
└── .cdsrc.json            # CDS configuration
```

## Available Scripts

- `npm run cds-watch` - Start the development server
- `npm start` - Start the production server
- `npm run start-local` - Generate entry point and start server
- `./node_modules/.bin/cds-deploy --to sqlite` - Initialize/update database

## Troubleshooting

### Port Already in Use

If you see an error like `EADDRINUSE: address already in use :::4004`, another process is using port 4004.

**Solution:**
1. Find the process using the port:
   ```bash
   lsof -i:4004
   ```
2. Kill the process:
   ```bash
   kill -9 <PID>
   ```
   (Replace `<PID>` with the process ID from step 1)

### Database Tables Not Found

If you see errors about missing tables (e.g., `no such table: officeLibrarySrv_Books_drafts`):

**Solution:**
1. Stop the server (Ctrl+C)
2. Re-initialize the database:
   ```bash
   ./node_modules/.bin/cds-deploy --to sqlite
   ```
3. Restart the server:
   ```bash
   npm run cds-watch
   ```

### SAPUI5 Resources Not Loading

If the UI doesn't load and you see 404 errors for SAPUI5 resources:

**Solution:**
- The application uses SAPUI5 from a CDN. Ensure you have internet connectivity.
- If CDN access is restricted, you may need to configure a local SAPUI5 installation.

### Command Not Found Errors

If you see `command not found` errors:

**Solution:**
- Ensure you've run `npm install` to install all dependencies
- Use the full path: `./node_modules/.bin/cds-serve` instead of just `cds`

## Development Workflow

1. **Make changes** to your code (models, services, UI)
2. **Restart the server** if needed (the server doesn't auto-reload by default)
3. **Refresh your browser** to see changes

## Database

The application uses SQLite for local development. The database file is `db.sqlite` in the project root.

### Viewing Database Contents

You can inspect the database using SQLite:

```bash
sqlite3 db.sqlite
.tables                    # List all tables
SELECT * FROM officeLibrary_Books;  # View books
.quit                      # Exit
```

## API Endpoints

The application exposes an OData V4 service:

- **Base URL**: `http://localhost:4004/odata/v4/office-library-srv/`
- **Entities**:
  - `/Books` - List of books
  - `/Authors` - List of authors
  - `/$metadata` - Service metadata

### Example API Calls

```bash
# Get all books
curl http://localhost:4004/odata/v4/office-library-srv/Books

# Get service metadata
curl http://localhost:4004/odata/v4/office-library-srv/\$metadata
```

## Technologies Used

- **SAP CAP** (Cloud Application Programming Model) - Backend framework
- **SAPUI5** - Frontend UI framework
- **SQLite** - Local database
- **Node.js** - Runtime environment
- **Express** - Web server

## Additional Resources

- [SAP CAP Documentation](https://cap.cloud.sap/docs/)
- [SAPUI5 Documentation](https://sapui5.hana.ondemand.com/)
- [OData V4 Specification](https://www.odata.org/documentation/)

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review the server console output for error messages
3. Check the browser console (F12) for frontend errors

## License

UNLICENSED
