// Vercel serverless function entry point
// This file is in /api/ folder which Vercel automatically detects
// The path will be relative to web-app, so no spaces in the function name

const app = require('../server');

module.exports = app;
