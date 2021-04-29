import React from "react"

export const TableOfContents = ({page, data, index, ...props }) => {
  return <div className="app-table-of-contents" {...props}>
    <h3 className="govuk-heading-m">{data.title}</h3>
    <ul className="govuk-list">
      {page.blocks?.map((blk, i) => {
        if(i > index) {
          return <li><h4 className="govuk-heading-s" key={"block_" + i}><a href={"#block_" + i}>{blk.title}</a></h4>
          </li>
        } else {
          return null
        }
      })}
    </ul>
  </div>
}

export default TableOfContents