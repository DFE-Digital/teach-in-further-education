using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class PrivacyPolicy
    {
        private readonly IWebDriver driver;
        public PrivacyPolicy(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement InformationCommissionerLink
        {
            get { return driver.FindElement(By.LinkText("Information Commissioner's website")); }
        }

        public IWebElement InformationCommissionerLink2
        {
            get { return driver.FindElement(By.PartialLinkText("(ICO) via their website")); }
        }

        public IWebElement FindOutAboutCookiesLink
        {
            get { return driver.FindElement(By.LinkText("Find out more on how we use cookies.")); }
        }

        #endregion

        #region Actions

        public bool MainContentDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickICOLink1()
        {
            InformationCommissionerLink.Click();
        }

        public void ClickICOLink2()
        {
            InformationCommissionerLink2.Click();
        }

        public void ClickFindOutAboutCookiesLink()
        {
            FindOutAboutCookiesLink.Click();
        }

        #endregion
    }
}
