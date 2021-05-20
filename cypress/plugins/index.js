/// <reference types="cypress" />

const fetch = require("node-fetch")
import { useStaticQuery, graphql } from "gatsby"

/**
 * @type {Cypress.PluginConfig}
 */
module.exports = (on, config) => {

  const data = useStaticQuery(graphql`
      query {
          allContentfulPage {
              edges {
                  node {
                      slug
                  }
              }
          }
      }
  `)

  on("task", {

    getPageSlugs() {
      return data.allContentfulPage.edges.map(edge => edge.node.slug)
    }

    //   return fetch(`${config.baseUrl}/sitemap.xml`, {
    //     method: "GET",
    //     headers: {
    //       "Content-Type": "application/xml",
    //     },
    //   })
    //     .then(res => res.text())
    //     .then(xml => {
    //       const locs = [...xml.matchAll(`<loc>(.|\n)*?</loc>`)].map(([loc]) =>
    //         loc.replace("<loc>", "").replace("</loc>", "")
    //       )
    //       return locs
    //     })
    // },
  })
  return config
}
