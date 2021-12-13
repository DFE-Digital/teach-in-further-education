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
            get { return driver.FindElement(By.ClassName("govuk-grid-row")); }
        }

        public IWebElement OpenAllButton
        {
            get { return driver.FindElement(By.ClassName("govuk-accordion__open-all")); }
        }

        public IWebElement WhatLevelsMeanLink
        {
            get { return driver.FindElement(By.PartialLinkText("What levels mean")); }
        }

        public IWebElement TrainOnTheJobLink
        {
            get { return driver.FindElement(By.PartialLinkText("Train on the job")); }
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

        public void ClickTrainOnTheJobLink()
        {
            TrainOnTheJobLink.Click();
        }

        public void ClickTrainInYourOwnTimeLink()
        {
            TrainInYourOwnTimeLink.Click();
        }

        #endregion
    }
}