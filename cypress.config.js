const { defineConfig } = require("cypress");

module.exports = defineConfig({
  projectId: 'xbueeg',
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    specPattern: 'cypress/*/*.cy.{js,jsx,ts,tsx}',
  },
});
