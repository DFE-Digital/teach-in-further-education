import React from "react"
import { graphql } from "gatsby"
import CTA from "../components/CTA"
import { Layout } from "../components/Layout"
import Block from "../components/Block"

export default function Page(props) {
  const { contentfulPage } = props.data
  return (
    <Layout {...props}>
      <div className="govuk-grid-row">
        <div className="govuk-grid-column-full">
          {contentfulPage.blocks?.map((blk, i) => {
            return <Block className="app-block" key={"block_" + i} data={blk} />
          })}
          <div>
            {contentfulPage.callToActions?.map((blk, i) => {
              return <CTA key={"cta_" + i} data={blk} />
            })}
          </div>
        </div>
      </div>
    </Layout>
  )
}
export const pageQuery = graphql`
    query PageBySlug($slug: String!) {
        contentfulPage(slug: { eq: $slug }) {
            title,
            blocks {
                ... on ContentfulAdvice {
                    id
                    internal {
                        type
                    }
                    contentful_id
                    adviceBody {
                         childMarkdownRemark {
                             html
                         }
                    }
                    title
                }
                ... on ContentfulHeroBanner {
                    id
                    internal {
                        type
                    }
                    contentful_id
                    heroText {
                        raw
                    }
                    heroMedia {
                        title
                        fixed(width: 476, height: 350) {
                            ...GatsbyContentfulFixed
                        }
                    }
                }
                ... on ContentfulSteps {
                    id
                    title
                    internal {
                        type
                    }
                    steps {
                        contentful_id
                        title
                        adviceBody {
                           childMarkdownRemark {
                               html
                           }
                        }
                    }
                }
            },
            callToActions {
                ctaType {
                    ctaType
                }
                title
                slug
            }
        }
    }
`