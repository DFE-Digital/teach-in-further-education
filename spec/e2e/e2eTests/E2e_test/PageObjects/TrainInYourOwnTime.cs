using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class TrainInYourOwnTimePage
    {
        private readonly IWebDriver driver;
        public TrainInYourOwnTimePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement NoneRadioButton
        {
            get { return driver.FindElement(By.ClassName("govuk-radios__input")); }
        }

        public IWebElement GcseButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(2) > input")); }
        }

        public IWebElement AlevelButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(3) > input")); }
        }

        public IWebElement DegreeButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(4) > input")); }
        }

        public IWebElement SubmitButton
        {
            get { return driver.FindElement(By.Id("question-submit-qNRtpmv245PlK1GAu8Mzm")); }
        }

        public IWebElement ValidationErrorMessage
        {
            get { return driver.FindElement(By.Id("error-message")); }
        }

        public IWebElement FullListOfFeQualifications
        {
            get { return driver.FindElement(By.LinkText("Here's a list of popular teacher training courses.")); }
        }

        public IWebElement StudentFinanceLink
        {
            get { return driver.FindElement(By.PartialLinkText("You may be eligible to apply for a student loan")); }
        }

        public IWebElement TrainOnTheJobLink
        {
            get { return driver.FindElement(By.LinkText("Train on the job")); }
        }

        public IWebElement BursariesAvailableLink
        {
            get { return driver.FindElement(By.LinkText("There are bursaries available for some subjects.")); }
        }

        public IWebElement PcetLink
        {
            get { return driver.FindElement(By.LinkText("PCET in Post-Compulsory Education and Training")); }
        }

        public IWebElement DiplomaInEducationAndTrainingLink
        {
            get { return driver.FindElement(By.LinkText("Diploma in Education and Training")); }
        }

        public IWebElement TeacherBursaryLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find out about the current teacher")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk ")); }
        }

        #endregion

        #region Actions

        public bool ContentTrainInYourOwnTimeDisplayed()
        {
            return MainContent.Displayed;
        }

        public bool ValidationErrorMessageDisplayed()
        {
            return ValidationErrorMessage.Displayed;
        }

        public void ClickNoneRadioButton()
        {
            NoneRadioButton.Click();
        }

        public void ClickGcseButton()
        {
            GcseButton.Click();
        }

        public void ClickAlevelsButton()
        {
            AlevelButton.Click();
        }

        public void ClickDegreeButton()
        {
            DegreeButton.Click();
        }

        public void ClickSubmitButton()
        {
            SubmitButton.Click();
        }

        public void ClickFullListOfFeQualifications()
        {
            FullListOfFeQualifications.Click();
        }

        public void ClickStudentFinanceLink()
        {
            StudentFinanceLink.Click();
        }

        public void ClickTrainOnTheJobLink()
        {
            TrainOnTheJobLink.Click();
        }

        public void ClickBursariesAvailableLink()
        {
            BursariesAvailableLink.Click();
        }

        public void ClickPcetLink()
        {
            PcetLink.Click();
        }

        public void ClickDiplomaInEducationAndTrainingLink()
        {
            DiplomaInEducationAndTrainingLink.Click();
        }

        public void ClickTeacherBursaryLink()
        {
            TeacherBursaryLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
