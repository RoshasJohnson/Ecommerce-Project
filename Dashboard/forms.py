
from django import forms
from  customer.models import *


class Update_form(forms.ModelForm):
    class Meta:
        model = Product
        fields = '__all__'
    
class Category_form(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'



       

class CoupenForm(forms.ModelForm):
    class Meta:
        model = Coupen
        fields = '__all__'