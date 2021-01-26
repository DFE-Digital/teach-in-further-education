import React from "react"
import { graphql } from "gatsby"
import RichText from "../components/RichText"
import Advice from "../components/Advice"
import CTA from "../components/CTA"

export default function Page({ data }) {
  const { contentfulPage } = data
  return (
      <div className="govuk-grid-row">
        <div className="govuk-grid-column-two-thirds">
          <h1 className="govuk-heading-xl">{contentfulPage.title}</h1>

          {contentfulPage.introduction ? <RichText data={contentfulPage.introduction.raw} /> : null}
          {contentfulPage.blocks?.map((blk, i) => {
            return <div><Advice key={"advice_" + i} data={blk} /></div>
          })}
          <div>
            {contentfulPage.callToActions?.map((blk, i) => {
              return <CTA key={"cta_" + i} data={blk} />
            })}
          </div>
        </div>

        <div className="govuk-grid-column-one-third app-sidebar">
          <h2 className="govuk-heading-m">Related content</h2>
          {contentfulPage.sidebar?.map((page, i) => {
            return <p key={"sb_" + i} className="govuk-body"><a href={page.slug}>{page.title}</a></p>
          })}
        </div>
      </div>
  )
}
export const pageQuery = graphql`
    query PageBySlug($slug: String!) {
        contentfulPage(slug: { eq: $slug }) {
            title,
            introduction {
                raw
            },
            sidebar {
                title
                slug
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