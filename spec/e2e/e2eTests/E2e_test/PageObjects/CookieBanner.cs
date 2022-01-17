using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class CookieBanner
    {
        private readonly IWebDriver driver;
        public CookieBanner(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement CookieBannerBar
        {
            get { return driver.FindElement(By.Id("cookie-banner")); }
        }

        public IWebElement AcceptCookiesButton
        {
            get { return driver.FindElement(By.CssSelector("button[value='accept']")); }
        }

        public IWebElement RejectCookiesButton
        {
            get { return driver.FindElement(By.CssSelector("button[value='reject']")); }
        }

        public IWebElement ViewCookiesLink
        {
            get { return driver.FindElement(By.Id("cookie-banner"))
                       .FindElement(By.LinkText("View cookies")); }
        }

        public IWebElement CookieBannerAccepted
        {
            get { return driver.FindElement(By.Id("cookie-banner-accepted")); }
        }

        public IWebElement CookieBannerRejected
        {
            get { return driver.FindElement(By.Id("cookie-banner-rejected")); }
        }

        public IWebElement ChangeCookieSettingsLink
        {
            get { return driver.FindElement(By.LinkText("change your cookie settings")); }
        }

        public IWebElement AcceptedHideThisMessageLink
        {
            get { return driver.FindElement(By.Id("cookie-banner-accepted")).FindElement(By.LinkText("Hide this message")); }
        }

        public IWebElement RejectedHideThisMessageLink
        {
            get { return driver.FindElement(By.Id("cookie-banner-rejected")).FindElement(By.LinkText("Hide this message")); }
        }

        #endregion


        #region Actions

        public bool CookieBannerDisplayed()
        {
            return CookieBannerBar.Displayed;
        }

        public void ClickAcceptCookiesButton()
        {
            AcceptCookiesButton.Click();
        }

        public void ClickRejectCookiesButton()
        {
            RejectCookiesButton.Click();
        }

        public void ClickViewCookiesLink()
        {
            ViewCookiesLink.Click();
        }

        public bool CookieBannerAcceptedDisplayed()
        {
            return CookieBannerAccepted.Displayed;
        }

        public bool CookieBannerRejectedDisplayed()
        {
            return CookieBannerRejected.Displayed;
        }

        public void ClickChangeCookieSettingsLink()
        {
            ChangeCookieSettingsLink.Click();
        }

        public void ClickAcceptedHideThisMessageLink()
        {
            AcceptedHideThisMessageLink.Click();
        }

        public void ClickRejectedHideThisMessageLink()
        {
            RejectedHideThisMessageLink.Click();
        }

        #endregion
    }
}
