using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class Homepage
    {
        private readonly IWebDriver driver;
        private readonly string urlDev = "https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/";
        private readonly string urlTest = "https://teachfe:efhcaet@teach-in-further-education-test.london.cloudapps.digital/";
        private readonly string urlPreProd = "https://teachfe:efhcaet@teach-in-further-education-pre-production.london.cloudapps.digital/";
        public Homepage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements
        public IWebElement MainContent
        {
            get { return driver.FindElement(By.ClassName("govuk-grid-row")); }
        }

        public IWebElement HomeNavButton
        {
            get { return driver.FindElement(By.Id("home-link")); }
        }

        public IWebElement GuideToFeTeachingNavButton
        {
            get { return driver.FindElement(By.Id("5yYjsBia5tKnn6rysEdUQ2")); }
        }

        public IWebElement WhatYouCouldTeachNavButton
        {
            get { return driver.FindElement(By.Id("6Fraj3twk8xSHrc1kyKzVr")); }
        }


        public IWebElement TrainOnTheJobNavButton
        {
            get { return driver.FindElement(By.Id("2wAftZDRvPUWLTGogsMx4B")); }
        }

        public IWebElement TrainInYourOwnTimeNavButton
        {
            get { return driver.FindElement(By.Id("4LD9JHyl4cpaKoLhRZqk8p")); }
        }

        public IWebElement FindAnFeTeachingJobNavButton
        {
            get { return driver.FindElement(By.Id("7fkpVgKNOUvTuZI7KBhdrE")); }
        }

        public IWebElement HelpAndAdviceNavButton
        {
            get { return driver.FindElement(By.Id("6qhlSowYQyDegYs3FxSiLN")); }
        }
        public IWebElement TrainOnTheJobLink
        {
            get { return driver.FindElement(By.LinkText("Train on the job")); }
        }

        public IWebElement TrainInYourOwnTimeLink
        {
            get { return driver.FindElement(By.LinkText("Train in your own time")); }
        }

        public IWebElement GuideToFurtherEducationLink
        {
            get { return driver.FindElement(By.LinkText("Find out if you could teach in FE")); }
        }

        public IWebElement GuideToFurtherEducationLinkBottomPage
        {
            get { return driver.FindElement(By.LinkText("Find out more about teaching in FE")); }
        }

        #endregion

        #region Actions

        public void NavigateToDev()
        {
            driver.Navigate().GoToUrl(urlDev);
        }

        public void NavigateToTest()
        {
            driver.Navigate().GoToUrl(urlTest);
        }

        public void NavigateToPreProd()
        {
            driver.Navigate().GoToUrl(urlPreProd);
        }

        public bool ContentHomepageDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickHomeNavButton()
        {
            HomeNavButton.Click();
        }

        public void ClickGuideToFeTeachingNavButton()
        {
            GuideToFeTeachingNavButton.Click();
        }

        public void ClickWhatYouCouldTeachNavButton()
        {
            WhatYouCouldTeachNavButton.Click();
        }

        public void ClickTrainOnTheJobNavButton()
        {
            TrainOnTheJobNavButton.Click();
        }

        public void ClickTrainInYourOwnTimeNavButton()
        {
            TrainInYourOwnTimeNavButton.Click();
        }

        public void ClickFindAnFeTeachingJobNavButton()
        {
            FindAnFeTeachingJobNavButton.Click();
        }

        public void ClickHelpAndAdviceNavButton()
        {
            HelpAndAdviceNavButton.Click();
        }

        public void ClickTrainOnTheJobLink()
        {
            TrainOnTheJobLink.Click();
        }

        public void ClickTrainInYourOwnTimeLink()
        {
            TrainInYourOwnTimeLink.Click();
        }

        public void ClickGuideToFurtherEducationLink()
        {
            GuideToFurtherEducationLink.Click();
        }

        public void ClickGuideToFurtherEducationLinkBottomPage()
        {
            GuideToFurtherEducationLinkBottomPage.Click();
        }

        #endregion
    }
}
