const path = require(`path`)

exports.createPages = async ({ graphql, actions }) => {
  const { createPage } = actions
  const blogPostTemplate = path.resolve(`src/templates/page.js`)
  const result = await graphql(`
    query {
      allContentfulPage {
        edges {
          node {
            slug
            title
          }
        }
      }
    }
  `)
  result.data.allContentfulPage.edges.forEach(edge => {
    createPage({
      path: `${edge.node.slug}`,
      component: blogPostTemplate,
      context: {
        slug: edge.node.slug,
      },
    })
  })
}
