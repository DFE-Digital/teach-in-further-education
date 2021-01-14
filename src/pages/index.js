import React from "react"
import { graphql } from "gatsby"

import { BLOCKS, MARKS } from "@contentful/rich-text-types"
import { documentToReactComponents } from '@contentful/rich-text-react-renderer';

const Bold = ({ children }) => <span className="govuk-!-font-weight-bold">{children}</span>;

const Text = ({ children }) => <p className="govuk-body">{children}</p>;

const options = {
  renderMark: {
    [MARKS.BOLD]: (text) => <Bold>{text}</Bold>
  },
  renderNode: {
    [BLOCKS.HEADING_1]: (node, children) => <h1 className="govuk-heading-xl">{children}</h1>,
    [BLOCKS.HEADING_2]: (node, children) => <h2 className="govuk-heading-l">{children}</h2>,
    [BLOCKS.HEADING_3]: (node, children) => <h3 className="govuk-heading-m">{children}</h3>,
    [BLOCKS.HEADING_4]: (node, children) => <h4 className="govuk-heading-s">{children}</h4>,
    [BLOCKS.PARAGRAPH]: (node, children) => <Text>{children}</Text>
  }
};

export default function Home({ data }) {
  return data.allContentfulAdvice.edges.map(({ node },i) => {
    return <div>
        <h1 className="govuk-heading-m">{node.title}</h1>
        <div>{documentToReactComponents(JSON.parse(node.advicebody.raw), options)}</div>
    </div>
  })
}

export const pageQuery = graphql`
    query {
        allContentfulAdvice {
            edges {
                node {
                    title,
                    advicebody {
                        raw
                    }
                }
            }
        }
    }
`
