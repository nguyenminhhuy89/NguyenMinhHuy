const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: "xbueeg",
  e2e: {
    setupNodeEvents(on, config) {
    },
    baseUrl: process.env.CYPRESS_BASE_URL || 'http://localhost:3000/',
    specPattern: 'cypress/*/*.cy.js'
  },
});
