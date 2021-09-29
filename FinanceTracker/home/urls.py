from .views import about, contact, home, pricing, work
from django.urls import path

urlpatterns = [
    path('', home, name='home909'),
    path('work/', work, name='work909'),
    path('about/', about, name='about909'),
    path('price/', pricing, name='price909'),
    path('contact/', contact, name='contact909')
    
]