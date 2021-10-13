using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class Homepage
    {
        private readonly IWebDriver driver;
        private readonly string url = "https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/";
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

        public IWebElement ExperienceAndQualificationsNavButton
        {
            get { return driver.FindElement(By.Id("630Q4flj9fmCaHKsckbOA6")); }
        }

        public IWebElement FindAnFeTeachingJobNavButton
        {
            get { return driver.FindElement(By.Id("7fkpVgKNOUvTuZI7KBhdrE")); }
        }

        public IWebElement FinancialSupportToTrainLink
        {
            get { return driver.FindElement(By.PartialLinkText("Many people start a job in further education")); }
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

        public void NavigateTo()
        {
            driver.Navigate().GoToUrl(url);
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

        public void ClickExperienceAndQualificationsNavButton()
        {
            ExperienceAndQualificationsNavButton.Click();
        }

        public void ClickFindAnFeTeachingJobNavButton()
        {
            FindAnFeTeachingJobNavButton.Click();
        }

        public void ClickFinancialSupportToTrainLink()
        {
            FinancialSupportToTrainLink.Click();
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
