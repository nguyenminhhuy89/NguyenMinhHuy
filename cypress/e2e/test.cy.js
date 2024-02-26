import HomePage from '../pom/homePage';
import HomePageAssert from '../assert/homePageAssert';

const homePage = new HomePage();
const homePageAssert = new HomePageAssert();
describe('template spec', () => {
  it('passes', () => {
    homePage.visit('https://example.cypress.io');
    homePageAssert.visitSuccess();
    homePage.elements.eq(1).click();

    homePage.click(homePage.buttonElement);
  })
})