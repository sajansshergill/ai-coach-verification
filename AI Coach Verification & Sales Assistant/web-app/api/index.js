// Vercel serverless function entry point
// This file allows Vercel to properly handle the Express app

const app = require('../server');

// Export the Express app for Vercel
module.exports = app;
