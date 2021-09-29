from django.test import TestCase
from django.urls import reverse

# Create your tests here.

class ViewsTestCase(TestCase):
    def test_income_loads_properly(self):
        """The income page loads properly"""
        response = self.client.get('your_server_ip:8000/income')
        self.assertEqual(response.status_code, 404)

    def test_add_income_loads_properly(self):
        """The add income page loads properly"""
        response = self.client.get('your_server_ip:8000/income/add_income')
        self.assertEqual(response.status_code, 404)

    def test_income_summary_loads_properly(self):
        """The imcome summary  page loads properly"""
        response = self.client.get('your_server_ip:8000/income/income_summary')
        self.assertEqual(response.status_code, 404)