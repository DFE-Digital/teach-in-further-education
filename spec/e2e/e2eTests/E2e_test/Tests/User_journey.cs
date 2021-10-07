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
            homepage.ClickExperienceAndQualificationsNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/experience-and-qualifications.html"));

            experienceAndQualificationsPage.ContentExpAndQualificationsDisplayed();
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
        }
        [TearDown]
        public void CloseBrowser()
        {
            driver.Quit();
        }
    }
}
