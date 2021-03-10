import React from "react"
import Advice from "./Advice"
import Hero from "./Hero"
import Steps from "./Steps"

export default function Block({ data, ...props }) {
  const getLayout = (type) => {
    switch (type) {
      case 'ContentfulAdvice': {
        return <Advice data={data} />
      }
      case 'ContentfulHeroBanner': {
          return <Hero data={data} />
      }
      case 'ContentfulSteps': {
        return <Steps data={data} />
      }
      default: { return null }
    }
  }

  return (<div {...props}>{getLayout(data.internal.type)}</div>)
}