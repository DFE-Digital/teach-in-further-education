import React from "react"
import Advice from "./Advice"
import Hero from "./Hero"
import Steps from "./Steps"
import DefinitionList from "./DefinitionList"
import TableOfContents from "./TableOfContents"

export const Block = ({ data, page, index, ...props }) => {
  const getLayout = type => {
    switch (type) {
      case "ContentfulAdvice": {
        return <Advice data={data} />
      }
      case "ContentfulHeroBanner": {
        return <Hero data={data} />
      }
      case "ContentfulSteps": {
        return <Steps data={data} />
      }
      case "ContentfulDefinitionList": {
        return <DefinitionList data={data} />
      }
      case "ContentfulTableOfContents": {
        return <TableOfContents index={index} data={data} page={page} />
      }
      default: {
        return null
      }
    }
  }

  return <div {...props}>{getLayout(data.internal.type)}</div>
}

export default Block
