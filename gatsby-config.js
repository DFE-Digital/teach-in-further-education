/**
 * Configure your Gatsby site with this file.
 *
 * See: https://www.gatsbyjs.com/docs/gatsby-config/
 */

const dotenv = require('dotenv');
dotenv.config();

module.exports = {
  /* Your site config here */
  plugins: [
    `gatsby-plugin-sass`,
    `gatsby-plugin-sharp`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-react-helmet`,
    {
      resolve: `gatsby-transformer-remark`,
      options: {
        // CommonMark mode (default: true)
        commonmark: true,
        // Footnotes mode (default: true)
        footnotes: true,
        // Pedantic mode (default: true)
        pedantic: true,
        // GitHub Flavored Markdown mode (default: true)
        gfm: true,
        // Plugins configs
          plugins: [
            {
              resolve: `gatsby-remark-classes`,
              options: {
                classMap: {
                  "heading[depth=1]": "govuk-heading-xl",
                  "heading[depth=2]": "govuk-heading-l",
                  "heading[depth=3]": "govuk-heading-m",
                  "heading[depth=4]": "govuk-heading-s",
                  "paragraph": "govuk-body",
                  "list[ordered=false]": "govuk-list govuk-list--bullet",
                  "list[ordered=true]": "govuk-list govuk-list--number",
                  "link": "govuk-link",
                  "table": "govuk-table",
                  "tableRow": "govuk-table__row",
                  "tableCell": "govuk-table__cell",
                  "tableHead": "govuk-table__head"
                }
              }
            }
          ]
      },
    },
    {
      resolve: `gatsby-source-contentful`,
      options: {
        spaceId: process.env.CONTENTFUL_SPACE_ID,
        accessToken: process.env.CONTENTFUL_DELIVERY_TOKEN,
        downloadLocal: true
      },
    },
    {
      resolve: `gatsby-plugin-google-gtag`,
      options: {
        // You can add multiple tracking ids and a pageview event will be fired for all of them.
        trackingIds: [
          process.env.GOOGLE_ANALYTICS_TAG, // Google Analytics / GA
        ],
        // This object gets passed directly to the gtag config command
        // This config will be shared across all trackingIds
        gtagConfig: {
          anonymize_ip: true,
          cookie_expires: 0,
        },
        // This object is used for configuration specific to this plugin
        pluginConfig: {
          // Puts tracking script in the head instead of the body
          head: true,
          // Setting this parameter is also optional
          respectDNT: true,
          // Avoids sending pageview hits from custom paths
          exclude: [],
        },
      },
    },
  ],
}
