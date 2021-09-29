from django.test import TestCase
from django.urls import reverse

# Create your tests here.

class ViewsTestCase(TestCase):
    def test_home_loads_properly(self):
        """The home page loads properly"""
        response = self.client.get('your_server_ip:8000')
        self.assertEqual(response.status_code, 404)

    def test_about_loads_properly(self):
        """The about page loads properly"""
        response = self.client.get('your_server_ip:8000/about')
        self.assertEqual(response.status_code, 404)

    def test_work_loads_properly(self):
        """The work page loads properly"""
        response = self.client.get('your_server_ip:8000/work')
        self.assertEqual(response.status_code, 404)

    def test_contact_loads_properly(self):
        """The contact page loads properly"""
        response = self.client.get('your_server_ip:8000/contact')
        self.assertEqual(response.status_code, 404)

    def test_pricing_loads_properly(self):
        """The pricing page loads properly"""
        response = self.client.get('your_server_ip:8000/price')
        self.assertEqual(response.status_code, 404)