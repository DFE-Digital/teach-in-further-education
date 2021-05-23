/// <reference types="cypress" />

const fetch = require("node-fetch")
// import { useStaticQuery, graphql } from "gatsby"

const { useStaticQuery } = require("gatsby")
const { graphql } = require("gatsby")

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


await fetch ('https://graphql.contentful.com/content/v1/spaces/CONTENTFUL_SPACE_ID/environments/CONTENTFUL_DELIVERY_TOKEN?query=query{allContentfulPage{edges{node{slug}}}}&variables={"preview":true}', {
  method: 'GET', 
  headers: {"Content-Type": "application/json"}, 
  body: JSON.stringify(
    { query:
      query {
      allContentfulPage {
        edges {
          node {
            slug
          }
        }
      }
      }
      })
      return Response.json()
      .then(res => res.json())
    })
   
