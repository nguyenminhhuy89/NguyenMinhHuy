describe('test API', () => {
  it('passes', () => {
    cy.request('GET', '/api/v1/posts').its('body').should('have.length', 3);
  })
})