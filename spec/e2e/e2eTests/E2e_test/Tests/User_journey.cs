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
            Homepage homepage = new Homepage(driver);
            GuideToFeTeachingPage guideToFeTeachingPage = new GuideToFeTeachingPage(driver);
            ExperienceAndQualificationsPage experienceAndQualificationsPage = new ExperienceAndQualificationsPage(driver);
            FindAnFeTeachingJobPage findAnFeTeachingJobPage = new FindAnFeTeachingJobPage(driver);
            ResultsNoQualificationsPage resultsNoQualificationsPage = new ResultsNoQualificationsPage(driver);
            ResultsGcsePage resultsGcsePage = new ResultsGcsePage(driver);
            ResultsAlevelsPage resultsAlevelsPage = new ResultsAlevelsPage(driver);
            ResultsDegreePage resultsDegreePage = new ResultsDegreePage(driver);

            homepage.NavigateTo();
            homepage.ContentHomepageDisplayed();
            homepage.ClickFinancialSupportToTrainLink();
            Assert.IsTrue(driver.Url.EndsWith("/financial-support-to-train.html"));
            homepage.ClickHomeNavButton();
            homepage.ClickGuideToFurtherEducationLink();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            homepage.ClickHomeNavButton();
            homepage.ClickGuideToFurtherEducationLinkBottomPage();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            homepage.ClickGuideToFeTeachingNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/guide-to-further-education.html"));
            
            guideToFeTeachingPage.ContentGuideToFeDisplayed();
            guideToFeTeachingPage.ClickFinancialSupportToTrainLink();
            Assert.IsTrue(driver.Url.EndsWith("/financial-support-to-train.html"));
            driver.Navigate().Back();
            guideToFeTeachingPage.ClickOpenAllButton();
            guideToFeTeachingPage.ClickAverageSalaryLink();
            Assert.IsTrue(driver.Url.EndsWith("/job-profiles/further-education-lecturer"));
            driver.Navigate().Back();
            guideToFeTeachingPage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            homepage.ClickExperienceAndQualificationsNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/experience-and-qualifications.html"));

            experienceAndQualificationsPage.ContentExpAndQualificationsDisplayed();
            experienceAndQualificationsPage.ClickFinancialSupportToTrainLink();
            Assert.IsTrue(driver.Url.EndsWith("/financial-support-to-train.html"));
            driver.Navigate().Back();
            experienceAndQualificationsPage.ClickWhatLevelsMeanLink();
            Assert.IsTrue(driver.Url.EndsWith("/what-different-qualification-levels-mean/list-of-qualification-levels"));
            driver.Navigate().Back();
            Assert.IsTrue(experienceAndQualificationsPage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            experienceAndQualificationsPage.ClickBursariesAvailableLink();
            Assert.IsTrue(driver.Url.Contains("/initial-teacher-training-bursaries-funding-manual"));
            driver.Navigate().Back();
            experienceAndQualificationsPage.ClickFullListOfFeCoursesLink();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            experienceAndQualificationsPage.ClickSubmitButton();
            experienceAndQualificationsPage.ValidationErrorMessageDisplayed();
            experienceAndQualificationsPage.ClickNoneRadioButton();
            experienceAndQualificationsPage.ClickSubmitButton();

            Assert.IsTrue(driver.Url.EndsWith("/results-no-quals.html"));
            resultsNoQualificationsPage.ContentNoQualificationsResultsDisplayed();
            resultsNoQualificationsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/experience-and-qualifications.html"));

            experienceAndQualificationsPage.ClickGcseButton();
            experienceAndQualificationsPage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-gcse.html"));
            resultsGcsePage.ContentGcseResultsDisplayed();
            resultsGcsePage.ClickBackButton();

            experienceAndQualificationsPage.ClickAlevelsButton();
            experienceAndQualificationsPage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-result-a-level.html"));
            resultsAlevelsPage.ContentAlevelsResultsDisplayed();
            resultsAlevelsPage.ClickBackButton();

            experienceAndQualificationsPage.ClickDegreeButton();
            experienceAndQualificationsPage.ClickSubmitButton();
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
        }
        [TearDown]
        public void CloseBrowser()
        {
            driver.Quit();
        }
    }
}
