class HomePage {
  get elements() {
    return cy.get('a[href="/commands/querying"]').should("be.visible");
  }

  get buttonElement() {
    return cy.get('#query-btn').should('contain', 'Button');
  }

  visit(url) {
    cy.visit(url);
  }

  click(button) {
    button.should('be.visible').click();
  }
}

export default HomePage;
