﻿using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class ResultsAlevelsPage
    {
        private readonly IWebDriver driver;
        public ResultsAlevelsPage(IWebDriver driver)
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

        public bool ContentAlevelsResultsDisplayed()
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
