import React from "react"
import { graphql } from "gatsby"
import RichText from "../components/RichText"
import Advice from "../components/Advice"
import CTA from "../components/CTA"
import { Layout } from "../components/Layout"
import Hero from "../components/Hero"

export default function Page(props) {
  const { contentfulPage } = props.data
  return (
    <Layout {...props}>
      <div className="govuk-grid-row">
        <div className="govuk-grid-column-full">
          <Hero key="hero" data={contentfulPage.hero} />
          {contentfulPage.introduction ? <RichText key="intro" data={contentfulPage.introduction.raw} /> : null}
          {contentfulPage.blocks?.map((blk, i) => {
            return <div><Advice key={"advice_" + i} data={blk} /></div>
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
            introduction {
                raw
            },
            hero {
              heroText {
                raw
              }
              heroMedia {
                  title
                  fixed(width: 476, height: 350) {
                    ...GatsbyContentfulFixed
                  }
              }
            },
            blocks {
                title
                advicebody {
                    raw
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