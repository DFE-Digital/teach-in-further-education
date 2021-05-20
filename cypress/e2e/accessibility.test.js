/// <reference types="Cypress" />



describe("Accessibility tests", () => {
      cy.task("getPageSlugs").then(slugs => {
        slugs.forEach(slug => {
          beforeEach(() => {
            cy.visit(`/${slug}`).get("main").injectAxe()
          })
          it("Has no detectable accessibility violations on load", () => {
            cy.checkA11y()
          })
        })
      })
})
