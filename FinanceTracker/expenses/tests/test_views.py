from django.test import TestCase
from django.urls import reverse

# Create your tests here.

class ViewsTestCase(TestCase):
    def test_dashboard_loads_properly(self):
        """The dashboard page loads properly"""
        response = self.client.get('your_server_ip:8000/auth/login/expense')
        self.assertEqual(response.status_code, 404)

    def test_expense_loads_properly(self):
        """The expenses page loads properly"""
        response = self.client.get('your_server_ip:8000/auth/login/expense/expenses')
        self.assertEqual(response.status_code, 404)

    def test_add_expense_properly(self):
        """The add expenses page loads properly"""
        response = self.client.get('your_server_ip:8000/auth/login/expense/add-expense')
        self.assertEqual(response.status_code, 404)

    def test_expense_summary_loads_properly(self):
        """The expense summary page loads properly"""
        response = self.client.get('your_server_ip:8000/auth/login/expense/expense_summary')
        self.assertEqual(response.status_code, 404)