import RichText from "./RichText"
import React from "react"
import Img from "gatsby-image"

export default function Hero({ data, ...props }) {
  return (<div {...props} className="app-hero-banner">
    <RichText data={data?.heroText.raw} />
    <div>
      <div style={{width: '75px', height: '75px', backgroundColor: '#ffbb00', borderRadius: '5px', transform: 'translate(' + (data?.heroMedia.fixed.width - 37) +'px,37px)' }} />
      <Img style={{zIndex: '2'}}
      fixed={data?.heroMedia.fixed}
      key={data?.heroMedia.fixed.src}
      alt={data?.heroMedia.title}
    />
      <div style={{width: '120px', height: '120px', backgroundColor: '#ff9900', borderRadius: '5px', transform: 'translate(-60px,-60px)'}} />
    </div>
  </div>)
}