from django.contrib.auth import get_user_model
from django.test import TestCase
# Create your tests here.

class CreateUserTests(TestCase):
    def test_create_user(self):
        User = get_user_model()
        user = User.objects.create_user(
        username='Milan',
        email='milan@email.com',
        password='testpass123'
        )
        self.assertEqual(user.username, 'Milan')
        self.assertEqual(user.email, 'milan@email.com')
        self.assertTrue(user.is_active)
        self.assertFalse(user.is_staff)
        self.assertFalse(user.is_superuser)

    def test_create_superuser(self):
        User = get_user_model()
        admin_user = User.objects.create_superuser(
        username='adminMilan',
        email='adminMilan@email.com',
        password='testpass123'
        )
        self.assertEqual(admin_user.username, 'adminMilan')
        self.assertEqual(admin_user.email, 'adminMilan@email.com')
        self.assertTrue(admin_user.is_active)
        self.assertTrue(admin_user.is_staff)
        self.assertTrue(admin_user.is_superuser)