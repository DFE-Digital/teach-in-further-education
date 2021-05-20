/// <reference types="cypress" />

const fetch = require("node-fetch")

/**
 * @type {Cypress.PluginConfig}
 */
module.exports = (on, config) => {
  on("task", {
    sitemapLocations() {
      return fetch(`${config.baseUrl}/sitemap.xml`, {
        method: "GET",
        headers: {
          "Content-Type": "application/xml",
        },
      })
        .then(res => res.text())
        .then(xml => {
          const locs = [...xml.matchAll(`<loc>(.|\n)*?</loc>`)].map(([loc]) =>
            loc.replace("<loc>", "").replace("</loc>", "")
          )
          return locs
        })
    },
  })
  return config
}
