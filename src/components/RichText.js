import { BLOCKS, MARKS } from "@contentful/rich-text-types"
import { documentToReactComponents } from '@contentful/rich-text-react-renderer';
import React from "react"


const options = {
  renderMark: {
    [MARKS.BOLD]: (text) => <span className="govuk-!-font-weight-bold">{text}</span>,
    [MARKS.CODE]: (text) => <pre>{text}</pre>
  },
  renderNode: {
    [BLOCKS.HR]: (node, children) => <hr />,
    [BLOCKS.HEADING_1]: (node, children) => <h1 className="govuk-heading-xl">{children}</h1>,
    [BLOCKS.HEADING_2]: (node, children) => <h2 className="govuk-heading-l">{children}</h2>,
    [BLOCKS.HEADING_3]: (node, children) => <h3 className="govuk-heading-m">{children}</h3>,
    [BLOCKS.HEADING_4]: (node, children) => <h4 className="govuk-heading-s">{children}</h4>,
    [BLOCKS.PARAGRAPH]: (node, children) => <p className="govuk-body">{children}</p>,
    [BLOCKS.UL_LIST]: (node, children) => <ul className="govuk-list govuk-list--bullet govuk-list--spaced">{children}</ul>,
    [BLOCKS.OL_LIST]: (node, children) => <ul className="govuk-list govuk-list--number govuk-list--spaced">{children}</ul>,
    [BLOCKS.LIST_ITEM]: (node, children) => <li>{children}</li>,
  }
};

export const RichText = ({data, className}) => {
  return <div className={ "app-rich-text " + className }>{documentToReactComponents(JSON.parse(data), options)}</div>
}

export default RichText