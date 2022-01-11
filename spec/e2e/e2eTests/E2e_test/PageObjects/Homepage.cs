using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class Homepage
    {
        private readonly IWebDriver driver;
        public Homepage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements
        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement WhereToStartLink
        {
            get { return driver.FindElement(By.LinkText("Find out if you could teach in FE")); }
        }

        public IWebElement WhereToStartLinkBottomPage
        {
            get { return driver.FindElement(By.LinkText("Find out more about teaching in FE")); }
        }

        #endregion

        #region Actions

        public bool ContentHomepageDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickWhereToStartLink()
        {
            WhereToStartLink.Click();
        }

        public void ClickWhereToStartLinkBottomPage()
        {
            WhereToStartLinkBottomPage.Click();
        }

        #endregion
    }
}
