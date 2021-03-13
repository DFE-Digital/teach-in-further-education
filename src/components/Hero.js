import RichText from "./RichText"
import React from "react"
import Img from "gatsby-image"

export default function Hero({ data, ...props }) {
  return (<div {...props} className="app-hero-banner">
    <RichText data={data?.heroText.raw} style={{zIndex:'99'}}/>
    <div>
      <div style={{width: '50px', height: '50px', backgroundColor: '#ffbb00', borderRadius: '5px', transform: 'translate(' + (data?.heroMedia.fixed.width - 25) +'px,25px)' }} />
      <Img style={{zIndex: '2'}}
      fixed={data?.heroMedia.fixed}
      key={data?.heroMedia.fixed.src}
      alt={data?.heroMedia.title}
    />
      <div style={{width: '80px', height: '80px', backgroundColor: '#ff9900', borderRadius: '5px', transform: 'translate(-40px,-40px)'}} />
    </div>
  </div>)
}