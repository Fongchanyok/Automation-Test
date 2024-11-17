using System.Net.Http;
using System.Threading.Tasks;
using NUnit.Framework;

namespace APITests
{
    public class ProductApiTests
    {
        private HttpClient _httpClient;

        [SetUp]
        public void Setup()
        {
            _httpClient = new HttpClient { BaseAddress = new System.Uri("https://fakestoreapi.com/") };
        }

        [Test]
        public async Task GetProducts_ShouldReturnSuccess()
        {
            // Arrange
            var endpoint = "products";

            // Act
            var response = await _httpClient.GetAsync(endpoint);

            // Assert
            Assert.IsTrue(response.IsSuccessStatusCode, "API did not return success status code.");
            var responseData = await response.Content.ReadAsStringAsync();
            Assert.IsNotNull(responseData, "Response content should not be null.");
        }

        [TearDown]
        public void TearDown()
        {
            _httpClient.Dispose();
        }
    }
}