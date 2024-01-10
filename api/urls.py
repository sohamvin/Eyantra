from django.urls import path
from . import views

urlpatterns = [
    path('models/create/', views.predict_crop),
    path('models/', views.getmodels),
    path('models/<str:pk>/delete/', views.deletemodel),
    path('models/<str:pk>/update/', views.updatemodel),
    path('models/<str:pk>/', views.getmodel),

]