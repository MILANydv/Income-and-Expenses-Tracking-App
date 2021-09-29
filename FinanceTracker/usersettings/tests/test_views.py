from django.test import TestCase
from django.urls import reverse

# Create your tests here.

class ViewsTestCase(TestCase):
    def test_profile_loads_properly(self):
        """The profile page loads properly"""
        response = self.client.get('your_server_ip:8000/profile')
        self.assertEqual(response.status_code, 404)

    def test_usersettings_loads_properly(self):
        """The usersettings page loads properly"""
        response = self.client.get('your_server_ip:8000/usersettings')
        self.assertEqual(response.status_code, 404)

    def test_caregory_settings_loads_properly(self):
        """The category setting page loads properly"""
        response = self.client.get('your_server_ip:8000/settings/category-setting')
        self.assertEqual(response.status_code, 404)