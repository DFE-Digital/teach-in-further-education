import RichText from "./RichText"
import React from "react"
import { GatsbyImage, getImage } from "gatsby-plugin-image"

export const Hero = ({ data, ...props }) => {
  const image = getImage(data.heroMedia)
  return (<div {...props} className="app-hero-banner">
    <RichText data={data?.heroText.raw} style={{ zIndex: "99" }} />
    <div>
      <div style={{
        width: "50px",
        height: "50px",
        backgroundColor: "#ffbb00",
        borderRadius: "5px",
        transform: "translate(" + (image.width - 25) + "px,25px)"
      }} />
      <GatsbyImage image={image} alt='hero_image' />
      <div style={{
        width: "80px",
        height: "80px",
        backgroundColor: "#ff9900",
        borderRadius: "5px",
        transform: "translate(-40px,-40px)"
      }} />
    </div>
  </div>)
}

export default Hero