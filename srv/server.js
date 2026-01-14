const cds = require('@sap/cds');
const express = require('express');
const path = require('path');

cds.on('bootstrap', (app) => {
  const webappPath = path.resolve(__dirname, '../app/libraryapp/webapp');
  app.use('/libraryapp/webapp', express.static(webappPath, {
    index: 'index.html'
  }));
});
