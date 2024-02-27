import HomePage from '../pom/homePage';
import HomePageAssert from '../assert/homePageAssert';

const homePage = new HomePage();
const homePageAssert = new HomePageAssert();
describe('template spec', () => {
  it('passes', () => {
    homePage.visit('https://example.cypress.io');
    // cy.screenshot('before');
    homePageAssert.visitSuccess();
    homePage.elements.eq(1).click();

    homePage.click(homePage.buttonElement);
    // cy.screenshot('after');
    cy.request('https://example.cypress.io');
    // cy.compareImages('before', 'after').then(percentChanged => {
      // expect(percentChanged).to.be.lessThan(0.01); // Assert images are similar
    // });
  })
})

describe.only('template spec v2', () => {
  it('passes', () => {
    cy.request('https://example.cypress.io');
  })
})