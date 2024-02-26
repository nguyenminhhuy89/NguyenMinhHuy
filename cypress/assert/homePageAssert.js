class HomePageAssert {
  visitSuccess() {
    cy.get('h1').should('contain', 'Kitchen Sink').should('be.visible');
    cy.url().should('contain', 'https://example.cypress.io/');
  }
}

export default HomePageAssert;