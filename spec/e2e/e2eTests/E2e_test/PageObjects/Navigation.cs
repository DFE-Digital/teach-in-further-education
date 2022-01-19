using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class Navigation
    {
        private readonly IWebDriver driver;
        private readonly string urlDev = "https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/";
        private readonly string urlTest = "https://teachfe:efhcaet@teach-in-further-education-test.london.cloudapps.digital/";
        private readonly string urlPreProd = "https://teachfe:efhcaet@teach-in-further-education-pre-production.london.cloudapps.digital/";
        public Navigation(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements
        public IWebElement SiteHomeNavButton
        {
            get { return driver.FindElement(By.XPath("//header")).FindElement(By.LinkText("Teach in further education")); }
        }

        public IWebElement WhereToStartInFeNavButton
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

        public void ClickHomeNavButton()
        {
            SiteHomeNavButton.Click();
        }

        public void ClickWhereToStartInFeNavButton()
        {
            WhereToStartInFeNavButton.Click();
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

        #endregion
    }
}
