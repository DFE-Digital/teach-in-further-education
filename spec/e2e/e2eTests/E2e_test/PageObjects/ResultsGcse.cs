using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class ResultsGcsePage
    {
        private readonly IWebDriver driver;
        public ResultsGcsePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.ClassName("govuk-grid-row")); }
        }

        public IWebElement BackButton
        {
            get { return driver.FindElement(By.Id("4jG2PspMQXj2hxNwIzNLfN")); }
        }

        #endregion

        #region Actions

        public bool ContentGcseResultsDisplayed()
        {
            return _ = MainContent.Displayed;
        }

        public void ClickBackButton()
        {
            BackButton.Click();
        }

        #endregion
    }
}
