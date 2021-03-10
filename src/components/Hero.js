import RichText from "./RichText"
import React from "react"
import Img from "gatsby-image"

export default function Hero({ data, ...props }) {
  return (<div {...props} className="app-hero-banner">
    <RichText data={data?.heroText.raw} />
    <Img
      fixed={data?.heroMedia.fixed}
      key={data?.heroMedia.fixed.src}
      alt={data?.heroMedia.title}
    />
  </div>)
}