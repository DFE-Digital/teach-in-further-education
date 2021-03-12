/**
 * Configure your Gatsby site with this file.
 *
 * See: https://www.gatsbyjs.com/docs/gatsby-config/
 */

module.exports = {
  /* Your site config here */
  plugins: [
    `gatsby-plugin-sass`,
    `gatsby-plugin-sharp`,
    `gatsby-transformer-sharp`,
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
  ],
}
