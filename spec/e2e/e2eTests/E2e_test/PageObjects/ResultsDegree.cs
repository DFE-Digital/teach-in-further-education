﻿using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class ResultsDegreePage
    {
        private readonly IWebDriver driver;
        public ResultsDegreePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement BackButton
        {
            get { return driver.FindElement(By.Id("4jG2PspMQXj2hxNwIzNLfN")); }
        }

        #endregion

        #region Actions

        public bool ContentDegreeResultsDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickBackButton()
        {
            BackButton.Click();
        }

        #endregion
    }
}
