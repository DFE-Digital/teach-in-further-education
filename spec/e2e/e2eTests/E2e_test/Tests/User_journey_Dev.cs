using NUnit.Framework;
using OpenQA.Selenium.Chrome;
using TeachFe.E2e_test.PageObjects;

namespace TeachFe.E2e_test
{
    [TestFixture]
    public class UserJourneyDev
    {
        private ChromeDriver driver;

        [SetUp]
        public void StartBrowser()
        {
            driver = new ChromeDriver();
        }
        [Test]
        public void UserJourneyChromeDriver()
        {
            #region pages

            Homepage homepage = new Homepage(driver);
            GuideToFeTeachingPage guideToFeTeachingPage = new GuideToFeTeachingPage(driver);
            TrainInYourOwnTimePage trainInYourOwnTimePage = new TrainInYourOwnTimePage(driver);
            FindAnFeTeachingJobPage findAnFeTeachingJobPage = new FindAnFeTeachingJobPage(driver);
            TrainOnTheJobPage trainOnTheJobPage = new TrainOnTheJobPage(driver);
            HelpAndAdvicePage helpAndAdvicePage = new HelpAndAdvicePage(driver);
            ResultsNoQualificationsPage resultsNoQualificationsPage = new ResultsNoQualificationsPage(driver);
            ResultsGcsePage resultsGcsePage = new ResultsGcsePage(driver);
            ResultsAlevelsPage resultsAlevelsPage = new ResultsAlevelsPage(driver);
            ResultsDegreePage resultsDegreePage = new ResultsDegreePage(driver);

            #endregion

            #region homepage

            homepage.NavigateToDev();
            homepage.ContentHomepageDisplayed();
            homepage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));
            homepage.ClickHomeNavButton();
            homepage.ClickTrainInYourOwnTimeLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            homepage.ClickHomeNavButton();
            homepage.ClickGuideToFurtherEducationLink();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            homepage.ClickHomeNavButton();
            homepage.ClickGuideToFurtherEducationLinkBottomPage();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            homepage.ClickGuideToFeTeachingNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));

            #endregion

            #region guide to FE teaching page

            guideToFeTeachingPage.ContentGuideToFeDisplayed();
            guideToFeTeachingPage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));
            driver.Navigate().Back();
            guideToFeTeachingPage.ClickOpenAllButton();
            guideToFeTeachingPage.ClickAverageSalaryLink();
            Assert.IsTrue(driver.Url.EndsWith("/job-profiles/further-education-lecturer"));
            driver.Navigate().Back();
            guideToFeTeachingPage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            homepage.ClickTrainOnTheJobNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));

            #endregion

            #region train on the job page

            trainOnTheJobPage.ContentTrainOnTheJobDisplayed();
            trainOnTheJobPage.ClickFullListOfFeQualificationsLink();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickStudentFinanceLink();
            Assert.IsTrue(driver.Url.EndsWith("/student-finance"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickAzEmployersLink();
            Assert.IsTrue(driver.Url.EndsWith("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickOurMembersLink();
            Assert.IsTrue(driver.Url.EndsWith("aelp.org.uk/about/our-members/"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickTrainInYourOwnTimeLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickFindAnFeTeachingJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));
            driver.Navigate().Back();
            Assert.IsTrue(trainOnTheJobPage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            homepage.ClickTrainInYourOwnTimeNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));

            #endregion

            #region train in your own time

            trainInYourOwnTimePage.ContentTrainInYourOwnTimeDisplayed();
            trainInYourOwnTimePage.ClickFullListOfFeQualifications();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickStudentFinanceLink();
            Assert.IsTrue(driver.Url.EndsWith("gov.uk/student-finance"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickBursariesAvailableLink();
            Assert.IsTrue(driver.Url.Contains("/initial-teacher-training-bursaries-funding-manual"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickSubmitButton();
            trainInYourOwnTimePage.ValidationErrorMessageDisplayed();
            trainInYourOwnTimePage.ClickNoneRadioButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/results-no-quals.html"));
            resultsNoQualificationsPage.ContentNoQualificationsResultsDisplayed();
            resultsNoQualificationsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickGcseButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-gcse.html"));
            resultsGcsePage.ContentGcseResultsDisplayed();
            resultsGcsePage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickAlevelsButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-result-a-level.html"));
            resultsAlevelsPage.ContentAlevelsResultsDisplayed();
            resultsAlevelsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickDegreeButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/results-degree-or-above.html"));
            resultsDegreePage.ContentDegreeResultsDisplayed();
            resultsDegreePage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickPcetLink();
            Assert.IsTrue(driver.Url.EndsWith("/pgce-in-post-compulsory-education-and-training-pcet.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickDiplomaInEducationAndTrainingLink();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training.html"));
            driver.Navigate().Back();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickTeacherBursaryLink();
            Assert.IsTrue(driver.Url.Contains("/publications/fe-funding-initial-teacher-education-ite"));
            driver.Navigate().Back();
            Assert.IsTrue(trainInYourOwnTimePage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            homepage.ClickFindAnFeTeachingJobNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));

            #endregion

            #region find an FE teaching job page

            findAnFeTeachingJobPage.ContentFindAnFeTeachingJobDisplayed();
            findAnFeTeachingJobPage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickTesJobsLink();
            Assert.IsTrue(driver.Url.EndsWith("/further-education-teaching-and-lecturing"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickFeJobsLink();
            Assert.IsTrue(driver.Url.Contains("fejobs.com/career-advice"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickCollegeJobsLink();
            Assert.IsTrue(driver.Url.Contains("college.jobs.ac.uk/"));
            driver.Navigate().Back();
            homepage.ClickHelpAndAdviceNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/help-and-advice.html"));

            #endregion

            #region help and advice page

            helpAndAdvicePage.ContentHelpAndAdviceDisplayed();          
            Assert.IsTrue(helpAndAdvicePage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));

            #endregion
        }
        [TearDown]
        public void CloseBrowser()
        {
            driver.Quit();
        }
    }
}
