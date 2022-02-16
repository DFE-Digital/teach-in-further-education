using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class WhatYouCouldTeachPage
    {
        private readonly IWebDriver driver;
        public WhatYouCouldTeachPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement OpenAllButton
        {
            get { return driver.FindElement(By.ClassName("govuk-accordion__open-all")); }
        }

        public IWebElement WhatLevelsMeanLink
        {
            get { return driver.FindElement(By.PartialLinkText("What levels mean")); }
        }

        public IWebElement GetStartedWithFeProviderLink
        {
            get { return driver.FindElement(By.PartialLinkText("Get started with an FE provider")); }
        }

        public IWebElement TrainInYourOwnTimeLink
        {
            get { return driver.FindElement(By.PartialLinkText("Train in your own time")); }
        }

        #endregion

        #region Actions

        public bool ContentWhatYouCouldTeachDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickOpenAllButton()
        {
            OpenAllButton.Click(); 
        }

        public void ClickWhatLevelsMeanLink()
        {
            WhatLevelsMeanLink.Click();
        }

        public void ClickGetStartedWithFeProviderLink()
        {
            GetStartedWithFeProviderLink.Click();
        }

        public void ClickTrainInYourOwnTimeLink()
        {
            TrainInYourOwnTimeLink.Click();
        }

        #endregion
    }
}