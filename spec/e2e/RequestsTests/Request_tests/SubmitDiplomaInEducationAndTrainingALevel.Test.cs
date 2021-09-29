using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class SubmitDiplomaInEducationAndTrainingALevel
    {
        [Test]
        public void SubmitDiplomaInEducationAndTrainingALevelTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("diploma-in-education-and-training-result-a-level.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }
    }
}