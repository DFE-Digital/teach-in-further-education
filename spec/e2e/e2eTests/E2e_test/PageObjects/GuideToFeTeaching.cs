using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class GuideToFeTeachingPage
    {
        private readonly IWebDriver driver;
        public GuideToFeTeachingPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        #endregion

        #region Actions

        public bool ContentGuideToFeDisplayed()
        {
            return _ = MainContent.Displayed;
        }

        #endregion
    }
}
