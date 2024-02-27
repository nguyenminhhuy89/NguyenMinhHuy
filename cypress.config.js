const { defineConfig } = require("cypress");
const { beforeRunHook, afterRunHook } = require('cypress-mochawesome-reporter/lib');

module.exports = defineConfig({
  projectId: 'xbueeg',
  e2e: {
    setupNodeEvents(on, config) {
      on('before:run', async (details) => {
        console.log('override before:run');
        await beforeRunHook(details);
      });

      on('after:run', async () => {
        console.log('override after:run');
        await afterRunHook();
      });
    },
    specPattern: 'cypress/*/*.cy.{js,jsx,ts,tsx}',
  },
  reporter: 'cypress-mochawesome-reporter',
  reporterOptions: {
    charts: true,
    reportPageTitle: 'custom-title',
    embeddedScreenshots: true,
    inlineAssets: true,
    saveAllAttempts: false,
  }
});
