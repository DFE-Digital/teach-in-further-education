using NUnit.Framework;
using OpenQA.Selenium.Chrome;
using TeachFe.E2e_test.PageObjects;

namespace TeachFe.E2e_test
{
    [TestFixture]
    public class UserJourney
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
            //TrainingAndSupportPage trainingAndSupportPage = new TrainingAndSupportPage(driver);
            ResultsNoQualificationsPage resultsNoQualificationsPage = new ResultsNoQualificationsPage(driver);
            ResultsGcsePage resultsGcsePage = new ResultsGcsePage(driver);
            ResultsAlevelsPage resultsAlevelsPage = new ResultsAlevelsPage(driver);
            ResultsDegreePage resultsDegreePage = new ResultsDegreePage(driver);

            #endregion

            homepage.NavigateTo();
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


            trainInYourOwnTimePage.ClickBursariesAvailableLink();
            Assert.IsTrue(driver.Url.Contains("/initial-teacher-training-bursaries-funding-manual"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickFullListOfFeCoursesLink();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickSubmitButton();
            trainInYourOwnTimePage.ValidationErrorMessageDisplayed();
            trainInYourOwnTimePage.ClickNoneRadioButton();
            trainInYourOwnTimePage.ClickSubmitButton();

            Assert.IsTrue(driver.Url.EndsWith("/results-no-quals.html"));
            resultsNoQualificationsPage.ContentNoQualificationsResultsDisplayed();
            resultsNoQualificationsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/experience-and-qualifications.html"));

            trainInYourOwnTimePage.ClickGcseButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-gcse.html"));
            resultsGcsePage.ContentGcseResultsDisplayed();
            resultsGcsePage.ClickBackButton();

            trainInYourOwnTimePage.ClickAlevelsButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-result-a-level.html"));
            resultsAlevelsPage.ContentAlevelsResultsDisplayed();
            resultsAlevelsPage.ClickBackButton();

            trainInYourOwnTimePage.ClickDegreeButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/results-degree-or-above.html"));
            resultsDegreePage.ContentDegreeResultsDisplayed();
            resultsDegreePage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/experience-and-qualifications.html"));

            homepage.ClickFindAnFeTeachingJobNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));
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
            homepage.ClickTrainingAndFinancialSupportNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/financial-support-to-train.html"));

            trainingAndSupportPage.ContentFinancialSupportDisplayed();
            trainingAndSupportPage.ClickFullListOfQualificationsLink();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickStudentFinanceLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/student-finance"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            Assert.IsTrue(trainingAndSupportPage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            trainingAndSupportPage.ClickGuideToFurtherEducationLink();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickPcetLink();
            Assert.IsTrue(driver.Url.EndsWith("/pgce-in-post-compulsory-education-and-training-pcet.html"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickDiplomaInEducationAndTrainingLink();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training.html"));
            driver.Navigate().Back();
            trainingAndSupportPage.ClickBursariesAvailableLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/government/publications/fe-funding-initial-teacher-education-ite"));
            driver.Navigate().Back();
            Assert.IsTrue(driver.Url.EndsWith("/financial-support-to-train.html"));
        }
        [TearDown]
        public void CloseBrowser()
        {
            driver.Quit();
        }
    }
}
