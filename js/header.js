export class Header {

    init(headerId) {
        const headerElement = document.getElementById(headerId)

        for (const listElement of headerElement.getElementsByTagName("li")) {
            for (const anchor of listElement.getElementsByTagName("a")){
                const route = anchor.getAttribute("href")
                const link = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
                if(link === route || (link === "" && route === "/")) {
                    anchor.classList.add("active")
                } else {
                    anchor.classList.remove("active")
                }
            }
        }
    }

}