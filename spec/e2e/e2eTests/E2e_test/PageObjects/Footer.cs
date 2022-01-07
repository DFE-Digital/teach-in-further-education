using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class Footer
    {
        private readonly IWebDriver driver;
        public Footer(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement FooterBar
        {
            get { return driver.FindElement(By.Id("footer")); }
        }

        public IWebElement AccessibilityLink
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.Id("accessibility")); }
        }
         
        public IWebElement PrivacyLink
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.Id("privacy")); }
        }

        public IWebElement CookiesLink
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.Id("cookies")); }
        }

        public IWebElement FeedbackLink
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.Id("feedback")); }
        }

        public IWebElement CopyrightLogo
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.Id("copyright")); }
        }

        public IWebElement OGLLink
        {
            get { return driver.FindElement(By.Id("footer")).FindElement(By.LinkText("Open Government Licence v3.0")); }
        }

        #endregion

        #region Actions

        public bool FooterBarDisplayed()
        {
            return FooterBar.Displayed;
        }

        public void ClickAccessibilityLink()
        {
            AccessibilityLink.Click();
        }

        public void ClickPrivacyLink()
        {
            PrivacyLink.Click();
        }

        public void ClickCookiesLink()
        {
            CookiesLink.Click();
        }

        public void ClickFeedbackLink()
        {
            FeedbackLink.Click();
        }

        public void ClickCopyrightLink()
        {
            CopyrightLogo.Click();
        }

        public void ClickOGLLink()
        {
            OGLLink.Click();
        }

        #endregion
    }
}
