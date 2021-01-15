import React from "react"
import { graphql } from "gatsby"
import RichText from "../components/RichText"
import CTA from "../components/CTA"


export default function Home({ data }) {
  return data.allContentfulHomePage.edges.map(({ node }, i) => {
    return <div>
      <h1 className="govuk-heading-xl">{node.heading}</h1>
      <RichText data={node.body.raw} />
      <div>
        {node.userJourneys.map(({ title, pages }, i) => {
          return <div>
            <h2 className="govuk-heading-l">{title}</h2>
            <ul className="govuk-list">
              {pages.map((page, j) => {
                return <li><a href={page.slug}>{page.title}</a></li>
              })}
            </ul>
          </div>
        })}
      </div>
      <div>
        <CTA data={node.cta}/>
      </div>
    </div>
  })
}

export const pageQuery = graphql`
    query {
        allContentfulHomePage {
            edges {
                node {
                    heading,
                    body {
                        raw
                    }
                    userJourneys {
                        title
                        pages {
                            title
                            slug
                        }
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
