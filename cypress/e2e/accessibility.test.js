/// <reference types="Cypress" />

import { useStaticQuery, graphql } from "gatsby"

const data = useStaticQuery(graphql`
  query {
    allContentfulPage {
      edges {
        node {
          slug {
            title
          }
        }
      }
    }
  }
`)

{
  data.allContentfulPage.edges.map(edge => {
    return describe("Accessibility tests", () => {
      beforeEach(() => {
        cy.visit(`/${edge.node.slug}`).get("main").injectAxe()
      })
      it("Has no detectable accessibility violations on load", () => {
        cy.checkA11y()
      })
    })
  })
}

// describe("Accessibility tests", () => {
//   beforeEach(() => {
//     cy.visit("/").get("main").injectAxe()
//   })
//   it("Has no detectable accessibility violations on load", () => {
//     cy.checkA11y()
//   })
// })
