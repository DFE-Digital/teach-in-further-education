/// <reference types="cypress" />

const fetch = require("node-fetch")
// import { useStaticQuery, graphql } from "gatsby"

const { useStaticQuery } = require("gatsby")
const { graphql } = require("gatsby")

require("dotenv").config()
const db = require("db")
db.connect({
  spaceID: process.env.CONTENTFUL_SPACE_ID,
  deliveryToken: process.env.CONTENTFUL_DELIVERY_TOKEN,
  googleAnalytics: process.env.GOOGLE_ANALYTICS_TAG,
})

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
    },
  })
  return config
}

await fetch(
  `https://graphql.contentful.com/content/v1/spaces/${spaceID}/environments/${deliveryToken}?query=query{allContentfulPage{edges{node{slug}}}}&variables={"preview":true}`,
  {
    method: "GET",
    headers: { "Content-Type": "application/json" },
  }
)
