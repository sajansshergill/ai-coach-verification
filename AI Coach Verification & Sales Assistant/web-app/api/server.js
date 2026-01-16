// Vercel serverless function wrapper
// This file is in /api/ to avoid path issues with spaces in directory names

const path = require('path');

// Import the main server app
const app = require('../server');

// Export for Vercel
module.exports = app;
