import React from "react"
import { graphql } from "gatsby"

import CTA from "../components/CTA"
import { Layout } from "../components/Layout"
import Block from "../components/Block"

export default function Page(props) {
  const { contentfulPage: page } = props.data
  return (
    <Layout title={page.title} {...props}>
      <div className="govuk-grid-row">
        <div className="govuk-grid-column-full">
          {page.blocks?.map((blk, i) => {
            return <Block className="app-block" key={"block_" + i} index={i} id={"block_"+i} page={page} data={blk} />
          })}
          <div>
            {page.callToActions?.map((blk, i) => {
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
                        gatsbyImageData(width: 317, height: 233)
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
                ... on ContentfulTableOfContents {
                    id
                    title
                    internal {
                        type
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