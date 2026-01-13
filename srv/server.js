const cds = require('@sap/cds');
const express = require('express');
const path = require('path');

// This file will be loaded by CDS automatically
// Serve static files from app directory
cds.on('bootstrap', (app) => {
  console.log('[srv/server.js] ✅ Hook bootstrap ejecutado');
  
  // Serve files from app/libraryapp/webapp
  const webappPath = path.resolve(__dirname, '../app/libraryapp/webapp');
  console.log('[srv/server.js] 📁 Sirviendo archivos desde:', webappPath);
  
  // Serve static files - order matters!
  app.use('/libraryapp/webapp', express.static(webappPath, {
    index: 'index.html'
  }));
  
  console.log('[srv/server.js] ✅ Archivos estáticos configurados en /libraryapp/webapp');
});

cds.on('served', () => {
  console.log('[srv/server.js] 🚀 Servidor iniciado');
});
