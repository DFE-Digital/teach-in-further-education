using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class CookiesPage
    {
        private readonly IWebDriver driver;
        public CookiesPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement CookiesForm
        {
            get { return driver.FindElement(By.CssSelector("form[id='question-5YbmGtpXXBu42bS6etMosg']")); }
        }

        public IWebElement AcceptCookiesRadio
        {
            get { return driver.FindElement(By.CssSelector("input[value='accept-cookies']")); }
        }

        public IWebElement RejectCookiesRadio
        {
            get { return driver.FindElement(By.CssSelector("input[value='reject-cookies']")); }
        }

        public IWebElement SubmitButton
        {
            get { return driver.FindElement(By.CssSelector("input[value='Submit']")); }
        }

        public IWebElement GoogleAnalyticsCookiesLink
        {
            get { return driver.FindElement(By.LinkText("Google Analytics cookies")); }
        }

        #endregion

        #region Actions

        public bool MainContentDisplayed()
        {
            return MainContent.Displayed;
        }

        public bool CookiesFormDisplayed()
        {
            return CookiesForm.Displayed;
        }

        public void ClickAcceptCookiesRadio()
        {
            AcceptCookiesRadio.Click();
        }

        public void ClickRejectCookiesRadio()
        {
            RejectCookiesRadio.Click();
        }

        public void ClickSubmitButton()
        {
            SubmitButton.Click();
        }

        public void ClickGoogleAnalyticsCookiesLink()
        {
            GoogleAnalyticsCookiesLink.Click();
        }

        #endregion
    }
}
