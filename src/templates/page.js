import React from "react"
import { graphql } from "gatsby"
import RichText from "../components/RichText"
import Advice from "../components/Advice"

export default function Page({ data }) {
  const { contentfulPage } = data
  return (
    <div>
      <h1 className="govuk-heading-xl">{contentfulPage.title}</h1>
      {contentfulPage.introduction ? <RichText data={contentfulPage.introduction.raw} /> : null }
      { contentfulPage.blocks.map((blk, i) => { return <div><Advice data={blk} /></div> }) }
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
            blocks {
                title
                advicebody {
                    raw
                }
            }
        }
    }
`