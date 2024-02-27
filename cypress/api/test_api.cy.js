describe('test API', () => {
  it('passes', () => {
    cy.request('GET', 'localhost:3000/api/v1/posts/1').as('response');
    cy.get('@response').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body).to.have.property('id')
      expect(response.body.id).to.eq(1)
      expect(response.body.title).to.eq('test')
    })
  })
})