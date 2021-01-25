import React from "react"
import { graphql } from "gatsby"
import RichText from "../components/RichText"
import CTA from "../components/CTA"


export default function Home({ data }) {
  return data.allContentfulHomePage.edges.map(({ node }, i) => {
    return <div className="govuk-grid-row">
        <div className="govuk-grid-column-two-thirds">
          <h1 className="govuk-heading-xl">{node.heading}</h1>
          <RichText data={node.body.raw} />
      
          <div>
            <CTA data={node.cta} />
          </div>
        </div>
        <div className="govuk-grid-column-one-third app-sidebar">
          <h2 className="govuk-heading-m">Related content</h2>
          {node.sidebar?.map((page, i) => {
            return <p className="govuk-body"><a href={page.slug}>{page.title}</a></p>

          })}
        </div>
      </div>
  })
}

export const pageQuery = graphql`
    query {
        allContentfulHomePage(sort: {fields: updatedAt, order: DESC}, limit: 1) {
            edges {
                node {
                    heading,
                    body {
                        raw
                    }
                    sidebar {
                        title
                        slug
                    }
                    cta {
                        title
                        ctaType {
                            ctaType
                        }
                    }
                }
            }
        }
    }
`
