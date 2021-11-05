using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class FindAnFeTeachingJob
    {
        [Test]
        public void FindAnFeTeachingJobTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("find-an-fe-teaching-job.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }
    }
}